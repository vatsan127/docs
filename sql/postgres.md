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

### _Join / Inner Join_

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

## _Combine GroupBy and AggregateFunc_

```
select student_id, max(id) from student_info group by student_id;
```

returns student_id and max value of the student_info.id, grouped by student_id.

----

## _having_

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

## _Unions_ || _Intersect_ || _Except_

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

### _Union_

```
select id from students 
union
select student_id from student_info si ;
```

### _Intersect_

```
select id from students 
intersect
select student_id from student_info si ;
```

### _Except_

```
select id from students 
except
select student_id from student_info si ;
```

----

## PostgreSQL Data Types

### NUMERIC TYPES

1. **`SERIAL`** - Auto-incrementing integer often used as the ID column of a table.
2. **`INTEGER`** (`INT`) - Stores an integer without a decimal. It ranges from -2,147,483,648 to 2,147,483,647.
3. **`NUMERIC(p, s)`** - Stores a number with a specified precision (`p`) and scale (`s`). This type is very accurate,
   often used for financial calculations.
   For example, `NUMERIC(10, 2)` can store up to 10 digits with 2 decimal places.
4. **`DOUBLE PRECISION`** - Stores a floating-point number. It is less precise than `NUMERIC` but is faster for
   calculations where perfect precision isn't necessary.

### CHARACTER TYPES

1. **`CHAR(n)`** - Stores a fixed-length string of `n` characters. If the string is shorter than `n`, it is padded with
   spaces.
2. **`VARCHAR(n)`** - Stores a variable-length string with a maximum length of `n` characters.
   For example, `VARCHAR(40)` can store a string up to 40 characters long.
3. **`VARCHAR`** - Stores a variable-length string with no specified maximum length. PostgreSQL allows a string of any
   length unless a limit is imposed.
4. **`TEXT`** - Stores a variable-length string of any length. There is no performance difference between `TEXT` and
   `VARCHAR`, but `TEXT` is typically used when the string length is not constrained.

### BOOLEAN TYPE

1. **`TRUE`**: Acceptable inputs - `true`, `'yes'`, `'on'`, `1`, `'t'`, `'y'`
2. **`FALSE`**: Acceptable inputs - `false`, `'no'`, `'off'`, `0`, `'f'`, `'n'`
3. **`NULL`**: Represents the absence of a value.

### DATE AND TIME TYPES

1. **`DATE`** - Stores a date without time. Format: `YYYY-MM-DD`.
   Example:
   ```sql
      SELECT '1990-11-20'::DATE;
    * ```
2. **`TIME`** - Stores time without a date. Format: `HH:MM:SS[.MS]`. Example:

   ```sql
   SELECT '01:23:00'::TIME AS AM, '13:23:00'::TIME AS PM;
   ```

3. **`TIME WITH TIME ZONE`** (`TIMETZ`) - Stores time with a time zone. Example:

   ```sql
    SELECT '01:23:00-05'::TIMETZ AS AM, '13:23:00+05'::TIMETZ AS PM;
   ```

4. **`TIMESTAMP`** - Stores date and time without time zone. Example:

   ```sql
    SELECT '1990-11-20 13:23:00'::TIMESTAMP;
   ```
5. **`TIMESTAMP WITH TIME ZONE`** (`TIMESTAMPTZ`) - Stores date and time with time zone. Example:
   ```sql
   SELECT '1990-11-20 13:23:00-05'::TIMESTAMPTZ;
   ```
    * The timestamp is interpreted as `13:23` in the `-05:00` time zone.
    * PostgreSQL converts it to UTC by adding 5 hours.
    * Then it adjusts the UTC time to your session's time zone (e.g., `+05:30` for `Asia/Kolkata`).
    * This results in `1990-11-20 23:53:00 +0530`.

6. Convert System Time to UTC Time:

   ```sql
   SELECT CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS utc_time;
   ```

## PostgreSQL Indexing and Query Analysis

### Creating an Index

   ```sql
   CREATE INDEX <INDEX_NAME> ON < TABLE_NAME > (< COLUMN_NAME >);
   ```

### Dropping an index

   ```sql
    DROP INDEX <INDEX_NAME>;
   ```

### Query Analysis

* does not run the query
   ```sql
   EXECUTE <QUERY>;
   ```
* analyze and run the query
   ```sql
   EXPLAIN ANALYZE <QUERY>;
   ```

