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

sample data

```
create table cities
(
name       varchar(50),
country    varchar(50),
population integer,
pincode    integer
);

insert into cities(name, country, population, pincode)
values ('trl', 'india', 10000, 602001);
insert into cities(name, country, population, pincode)
values ('sbc', 'india', 9999, 506001);
```

concat

```
select concat(name, ', ', cities.country) from cities;
```

concat using ||

```
select name || ', ' || country from cities;
```

to upper

```
select upper(name) from cities;
```

to lower

```
select lower(name) from cities;
```

get length

```
select length(name) from cities;
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
  *Foreign Key : Primary key from another table , keyword: REFERENCES
  *Auto_Increment : SERIAL

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

## _JOINS    (use sample data)_

Syntax:

```
select <COLUMN> from <MAIN_TABLE> 
join <JOIN_TABLE> on 
<JOIN_TABLE>.ID = <MAIN_TABLE>.id;
```

### _Join /Inner Join:_

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

