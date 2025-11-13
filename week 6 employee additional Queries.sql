
SELECT E2.EMP_NO AS MGR_NO, E2.EMP_NAME AS Manager_Name, counts.emp_count AS Num_Employees
FROM EMPLOYEE E2
JOIN (
    SELECT MGR_NO, COUNT(*) AS emp_count
    FROM EMPLOYEE
    WHERE MGR_NO IS NOT NULL
    GROUP BY MGR_NO
    HAVING COUNT(*) = (
        SELECT MAX(emp_count)
        FROM (
            SELECT COUNT(*) AS emp_count
            FROM EMPLOYEE
            WHERE MGR_NO IS NOT NULL
            GROUP BY MGR_NO
        ) AS inner_counts
    )
) AS counts ON E2.EMP_NO = counts.MGR_NO;
select E.EMP_NO,E.EMP_NAME AS Manager_name, E.SALARY AS Manager_salary
from EMPLOYEE E
where E.EMP_NO in (select MGR_NO from EMPLOYEE
where MGR_NO IS NOT NULL
group by MGR_NO
HAVING E.SALARY > avg(SALARY)
);

SELECT E.EMP_NAME AS Second_Top_Level_Manager, D.DEPT_NAME
FROM EMPLOYEE E
JOIN DEPT D ON E.DEPT_NO = D.DEPT_NO
WHERE E.MGR_NO IN (
    SELECT EMP_NO
    FROM EMPLOYEE
    WHERE MGR_NO IS NULL
)
ORDER BY D.DEPT_NAME;

select e.EMP_NAME, i.INCENTIVE_AMOUNT from EMPLOYEE e
join INCENTIVES i on e.EMP_NO = i.EMP_NO
where i.INCENTIVE_DATE like '2023%'  
and i.INCENTIVE_AMOUNT = (
select INCENTIVE_AMOUNT
from INCENTIVES
where INCENTIVE_DATE like '2023%'
order by INCENTIVE_AMOUNT desc
limit 1 offset 1
);

select e.EMP_NAME as Employee_name, e.DEPT_NO as Employee_dept,
m.EMP_NAME as Manager_name, m.DEPT_NO as Manager_dept from EMPLOYEE e
 join EMPLOYEE m on e.MGR_NO = m.EMP_NO
 where e.DEPT_NO = m.DEPT_NO;
