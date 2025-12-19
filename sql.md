# create table

## example

```sql
CREATE TABLE <TABLE_NAME> (
    <COLUMN_NAME> <TYPE>...
);
```

## types

NOT NULL - cant be unsetted (NULL)
PRIMARY - cant be 2 same
AUTO_INCREMENT - add +1 automaticly
UNSIGNED - for (BIGINT INT, SMALLINT TINYINT) make more range but cant be negative

BIGINT - Large range of integers
INT - Whole numbers (e.g., 1, 42, -5)
SMALLINT - Smaller range of integers
TINYINT - Very small integers (e.g., 0–255 in MySQL)

DECIMAL(p, s) / NUMERIC(p, s) - Fixed-point precision (e.g., money)
FLOAT(p) - Approximate floating point
REAL - Less precise float
DOUBLE - More precise float

BOOLEAN / BOOL - True/False

CHAR(n) - Fixed-length string
VARCHAR(n)/VARCHAR - Variable-length string up to n characters (max 65535)
TEXT - Long text (no strict length limit)

## modify table

```sql
ALTER TABLE table_name ADD COLUMN <column_name> <data_type>;
```

## forgien key

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL
);

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) /* make reference from table post (user_id) to users column id */
):
```

## check

```sql
CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    age INT,
    check age >= 18 /* age cant be lower than 18 */
):
```

# insert

```sql
INSERT INTO <TABLE_NAME>(columns...) VALUES (values...)
```

# select

```sql
SELECT (columns...)\* FROM <TABLE_NAME>;
```

## as

```sql
SELECT u.username, o.product
FROM users AS u
JOIN orders AS o ON u.id = o.user_id; /* as makes aliases users = u, orders = o */
```

## group by

```sql
SELECT customer, SUM(amount) AS total_spent FROM orders GROUP BY customer;
```

## order by

```sql
SELECT * FROM students ORDER BY grade ASC; /* sort by grade from min to max (DESC is from max to min) */
```

## join

```sql
select * from users join posts on users.username = posts.username;
```

## regexp'ы

### REGEXP_LIKE()

Checks if a string matches a regex.

```sql
SELECT REGEXP_LIKE('abc', '^a');  -- Returns 1 (true)
```

### REGEXP_INSTR()

Returns the index of the first match of a regex in a string.

```sql
SELECT REGEXP_INSTR('abcabc', 'b');  -- Returns 2
```

### REGEXP_REPLACE()

Replaces occurrences matching the regex.

```sql
SELECT REGEXP_REPLACE('abc123', '[0-9]+', ''); -- Returns 'abc'
```

### REGEXP_SUBSTR()

Returns the part of the string that matches the regex.

```sql
SELECT REGEXP_SUBSTR('abc123', '[0-9]+');  -- Returns '123'
```

# triggers

```sql
CREATE TRIGGER log_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  INSERT INTO employee_log(emp_id, action)
  VALUES (NEW.id, 'INSERTED');
END;
```

# windows

```sql
SELECT
  salesperson,
  region,
  amount,
  ROW_NUMBER() OVER (
    PARTITION BY region
    ORDER BY amount DESC
  ) AS row_num
FROM sales;
```

# function

```sql
CREATE OR REPLACE FUNCTION add_numbers(a INT, b INT) /* create or change */
RETURNS INT AS $$
BEGIN
  RETURN a + b;
END;
$$;
```

```sql
DELIMITER //

CREATE FUNCTION add_numbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN a + b;
END;
//

DELIMITER ;
```

# procedure

```sql
DELIMITER //

CREATE PROCEDURE add_numbers(IN a INT, IN b INT)
BEGIN
  DECLARE result INT;
  SET result = a + b;
  SELECT result AS sum;
END;
//

DELIMITER ;
```

# user

## create

```sql
CREATE USER <username> IDENTIFIED BY 'password';
```

## delete

```sql
DROP USER <username>;
```
