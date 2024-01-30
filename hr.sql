/*-----------------------------------------------Creating a Sample HR Database---------------------------------------------------
--------The data used in creating this report is from FP20 data challenge. The data has been normalized in to different tables and relationships established between them.----
*/

-- Deleting any existence of a database called hr
DROP DATABASE IF EXISTS hr_data;

-- Creating a database called hr-----
CREATE DATABASE hr_data;

USE hr_data;

-- Creating jobs table, adding data types and constraints to different columns-------
CREATE TABLE jobs (
	Job_id INT PRIMARY KEY,
	job_title VARCHAR(100) NOT NULL,
	min_salary NUMERIC(9, 2) NOT NULL,
	max_salary NUMERIC(9, 2) NOT NULL
);

-- Creating department table, I made sure that each department is unique to prevent data duplication. I added data types and constraints to different columns-------
CREATE TABLE department(
	dept_id INT PRIMARY KEY AUTO_INCREMENT,
	dept_name VARCHAR(50) NOT NULL,
	UNIQUE (dept_name)
);

-- Creating branch table, adding data types and constraints to different columns-------
CREATE TABLE branch(
	branch_id CHAR(3) PRIMARY KEY,
	branch_name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL
);

-- Creating employees table, adding data types and constraints to different columns-------
CREATE TABLE employees(
	emp_id INTEGER PRIMARY KEY NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender ENUM ('M', 'F') NOT NULL,
	email VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	emp_age SMALLINT NOT NULL,
	marital_status VARCHAR(15),
	hire_date DATE NOT NULL,
	branch_id CHAR(3) NOT NULL,
	job_id INT NOT NULL,
	dept_id INT NOT NULL,
	annual_salary NUMERIC(9,2) NOT NULL,
	bonus NUMERIC(9,2) NOT NULL,
	FOREIGN KEY(job_id) REFERENCES jobs(job_id),
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	FOREIGN KEY (branch_id) REFERENCES branch(branch_id)

);

-- Creating job_history table, adding data types and constraints to different columns-------
CREATE TABLE job_history(
	emp_id INT NOT NULL,
	job_id INT NOT NULL,
	dept_id INT NOT NULL,
	hire_date DATE NOT NULL,
	leave_date DATE,
	leave_reason VARCHAR(50),
	emp_sat INT NOT NULL,
	performance VARCHAR(100),
	manager ENUM('Yes', 'No') NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE CASCADE,
	PRIMARY KEY(emp_id)
);


