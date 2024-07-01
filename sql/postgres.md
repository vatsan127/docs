# _Postgres_

----

## _Database_

```
create database test_db;
```

```
drop database test_db;
```

---- 

## _String Operators_

concat

```
select concat(id, ',', name) from students ;
```

concat using ||

```
select id  || ',' || name from students ;
```

to upper

```
select upper(name) from students ;
```

to lower

```
select lower(name) from students ;
```

get length

```
select length(name) from students;
```

----

## _Comparison_

execution of a query

```
select name     from cities         where population > 9999
|   third       |    first          |       second         |
```

first the 'from cities' is executed,
then 'where population > 9999' is executed
and finally 'select name'

operators : = , > , < , >= , <= , <> , != , in , between , not in

----

## _Constraints_

* Primary key : Uniquely Identifies a record in a table
* Foreign Key : Primary key from another table , keyword: REFERENCES
* Auto_Increment : SERIAL

sample data

```
create table students(
id SERIAL,
name varchar(50),
PRIMARY KEY (id)
);

create table details(
id SERIAL PRIMARY KEY ,
details varchar(1000),
student_id int REFERENCES students(id) -- foreign Key

);

```

---

## _On Delete Options_

* ON DELETE RESTRICT
* ON DELETE NO ACTION
* ON DELETE CASCADE
* ON DELETE SET NULL
* ON DELETE SET DEFAULT

Syntax:

 ```
     create table <TABLE_NAME>(
        COLUMN 1 PRIMARY KEY,
        COLUMN 2 <DATA_TYPE>,
        COLUMN 3 <DATA_TYPE> REFERENCES <FOREIGN_KEY> <ON_DELETE_OPTION>
    );
``` 

example:

```
    create table details(
        id SERIAL PRIMARY KEY ,
        details varchar(1000),
        user_id int REFERENCES students(id)  ON DELETE CASCADE
    ) ;
```

----

## _JOINS_

Syntax:

```
select <COLUMN> from <MAIN_TABLE> 
join <JOIN_TABLE> on 
<JOIN_TABLE>.ID = <MAIN_TABLE>.id;
```

### _Join / Inner Join:_

* Rows with reference in both tables will only be present

```
select name , details from students 
JOIN student_info on students.id = student_info.student_id;
```

### _Left Join_

* Rows with no reference to Joined table will also be selected from the Main table.

```
select name , details from students 
left join student_info on student_info.student_id = students.id;
```

### _Right Join_

* Rows with no reference to Main table will also be selected from the Joined table.

```
select name , details from students 
right join student_info on student_info.student_id = students.id;
```

### _Full Join_

* All data without any refernce to Main or Joined tables will also be selected

```
select name , details from students 
full join student_info on student_info.student_id = students.id;
```

### _Group By_

* find the set of all unique user_id
* takes each row and assign it to a group based on its user_id
* can only select the grouped the column

```
select student_id  from student_info group by student_id;
```

----

### _Aggregate Func_

* count(<column_name>) null values are not counted
* count(*) get total number of rows with null values
* sum()
* avg()
* min()
* max()

----

### _Combine GroupBy and AggregateFunc_

```
select student_id, max(id) from student_info group by student_id;
```

returns student_id and max value of the student_info.id, grouped by student_id.

----

## _having:_

* filters set of groups
* can be used on grouped columns or can be used with Aggregate Func
* AggregateFunc can be used with columns other than grouped columns

examples:

```
select student_id, count(id) as no_student_of_Details  from student_info  
group by student_id 
having student_id >  0;
```

example with aggregateFunc:

```
select student_id from student_info  
group by student_id 
having  count(id)  > 2;
```

returns student id with more 2 student_details_info

----

## _Unions:_

* (QUERY_1) UNION (QUERY_2)  - removes duplicates
* UNION ALL - does not remove duplicate
* INTERSECT: find the rows in common AND removes duplicates
* INTERSECT ALL: does not remove duplicates
* EXCEPT: find the rows present that are present in first query but not second query,query order matters , Removes
  duplicates
* EXCEPT ALL: does not remove duplicate

**Note: Selected columns order and datatype should be same!!**

Syntax:

```
SELECT column_1, column_2
FROM table_name_1
UNION
SELECT column_1, column_2
FROM table_name_2;
```

### _Union_ :

```
select id from students 
union
select student_id from student_info si ;
```

### _Intersect_ :

```
select id from students 
intersect
select student_id from student_info si ;
```

### _Except_ :

```
select id from students 
except
select student_id from student_info si ;
```