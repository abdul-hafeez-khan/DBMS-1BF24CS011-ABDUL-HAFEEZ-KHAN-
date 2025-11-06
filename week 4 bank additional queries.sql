use bank;
select distinct d.customer_name
from depositer d, bank_account ba, branch b
where d.accno = ba.accno and ba.branch_name = b.branch_name
and b.branch_city = "Delhi"
group by d.customer_name having count(b.branch_name) > 1;

select b.customer_name
from borrower b
where b.loan_number in
(select d.accno from depositer d
where b.loan_number = d.accno);

select b.customer_name
from borrower b
where b.loan_number in
(select d.accno from depositer d,
bank_account ba, branch b
where b.loan_number = d.accno and
d.accno = ba.accno and ba.branch_name = b.branch_name
and b.branch_city = "Bangalore");

select branch_name
from branch
where assets_inlakhs > all
(select assets_inlakhs from branch
where branch_city = "bombay");

delete from depositer
where accno in (
select accno
from bank_account
where branch_name in(
select b.branch_name
from branch b
where b.branch_city = "Bombay"));
delete from bank_account
where branch_name in (select
b.branch_name from branch b
where b.branch_city = "Bombay");
select * from bank_account;

update bank_account
set balance = balance + ((5/100) * balance)
where accno in (1,2,3,4,5,6,7,8,9,10,11);
select * from bank_account;