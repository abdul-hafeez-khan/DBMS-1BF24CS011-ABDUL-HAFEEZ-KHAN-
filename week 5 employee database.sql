create database employee;
use employee;
create table DEPT (
    DEPT_NO INT ,
    DEPT_NAME VARCHAR(100),
    DEPT_LOC VARCHAR(100),
    primary key (DEPT_NO));
create table EMPLOYEE (
    EMP_NO INT,
    EMP_NAME VARCHAR(100),
    MGR_NO INT,
    HIRE_DATE DATE,
    SALARY DECIMAL(10,2),
    DEPT_NO INT,
    primary key (EMP_NO),
    foreign key (DEPT_NO) references DEPT(DEPT_NO));
create table PROJECT (
    P_NO INT ,
    P_LOC VARCHAR(100),
    P_NAME VARCHAR(100),
    primary key(P_NO));
create table ASSIGNED_TO (
    EMP_NO INT,
    P_NO INT,
    JOB_ROLE VARCHAR(100),
    primary key (EMP_NO, P_NO),
    foreign key (EMP_NO) references  EMPLOYEE(EMP_NO),
    foreign key (P_NO) references PROJECT(P_NO));
create table INCENTIVES (
    EMP_NO INT,
    INCENTIVE_DATE DATE,
    INCENTIVE_AMOUNT DECIMAL(10,2),
    foreign key (EMP_NO) references EMPLOYEE(EMP_NO));
insert into DEPT values (1, 'Development', 'Bengaluru'),
(2, 'Testing', 'Hyderabad'),
                (3, 'Sales', 'Mysuru'),
                (4, 'HR', 'Chennai'),
(5, 'Support', 'Mumbai'),
(6, 'Admin', 'Pune');
insert into EMPLOYEE values (101, 'Anil', NULL, '2022-01-01', 60000, 1),
(102, 'Priya', 101, '2022-02-01', 50000, 2),
(103, 'Rahul', 102, '2021-07-12', 65000, 1),
(104, 'Neha', 101, '2023-04-10', 48000, 3),
(105, 'Vijay', NULL, '2022-05-16', 59000,2),
(106, 'Sneha', 101, '2022-12-05', 51000, 4);
insert into PROJECT values (201, 'Bengaluru', 'Alpha'),
(202, 'Hyderabad', 'Beta'),
(203, 'Chennai', 'Gamma'),
(204, 'Mysuru', 'Delta'),
(205, 'Mumbai', 'Sigma'),
(206, 'Pune', 'Zeta');
insert into ASSIGNED_TO values (101, 201, 'Developer'),
(102, 202, 'Tester'),
(103, 204, 'Lead'),
(104, 202, 'Support'),
(105, 201, 'Analyst'),
(106, 203, 'Manager');
insert into INCENTIVES values (101, '2023-01-10', 5000),
(102, '2023-02-15', 4000),
(104, '2023-03-20', 3500),
(105, '2023-04-05', 4500),
(106, '2023-06-25', 3000);

