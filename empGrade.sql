/* Assignment No : 5 */


use VIDYA149;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show EMP;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'EMP' at line 1
mysql> show tables;
+--------------------+
| Tables_in_GAURI146 |
+--------------------+
| Boats              |
| Book               |
| EMP                |
| Emp_backup         |
| Reserves           |
| RollID             |
| Sailors            |
| Student            |
| StudentInfo        |
+--------------------+
9 rows in set (0.00 sec)

select * from Student;
+-----+---------+---------+-------+------+
| rno | sname   | Marks  | grade | dno  |
+-----+---------+---------+-------+------+
| 101 | Gauri   |  250.02 |       |    5 |
| 102 | Vidya   | 2000.00 |       |    4 |
| 103 | Aditi   | 5000.00 |       |    1 |
| 111 | Ishwari |  300.00 |       |   11 |
+-----+---------+---------+-------+------+
4 rows in set (0.00 sec)


/*	empGrade.sql 

Delimiter $$
create procedure empGrade (IN e int)

begin
declare Temp decimal(6,2);

select Marks into Temp from Student where rno=e;
IF Temp <= 1500 AND Temp >= 990 Then
update Student set grade = 'Distinction' where rno=e;
elseif (Temp >= 989 AND Temp<= 900) Then
update Student set grade = 'First Class' where rno=e;
elseif (Temp >= 899 AND Temp<= 825) Then
update Student set grade = 'Second Class' where rno=e;
END IF;
end $$
Delimiter ;

*/

mysql> source /home/student/empGrade.sql;
Query OK, 0 rows affected (0.25 sec)

mysql> call empGrade(101);
Query OK, 1 row affected (0.12 sec)

mysql> call empGrade(102);
Query OK, 1 row affected (0.11 sec)

mysql> call empGrade(103);
Query OK, 1 row affected (0.09 sec)

mysql> call empGrade(111);
Query OK, 1 row affected (0.09 sec)

mysql> select * from Student;
+-----+---------+---------+-------------+-------+
| rno | sname   | salary  | grade       |  dno  |
+-----+---------+---------+-------------+-------+
| 101 | Gauri   |  1550.02| Distinction |    5  |
| 102 | Vidya   | 970.00  | First Class |    4  |
| 103 | Aditi   | 900.00  | Second Class|    1  |
| 111 | Ishwari |  1000.00| Distinction |   11  |
+-----+---------+---------+-------------+-------+
4 rows in set (0.01 sec)


