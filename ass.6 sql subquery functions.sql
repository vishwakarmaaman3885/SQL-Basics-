										--  SQL Functions
                                       --   Assignment Questions
--  Note : Create a table in MySQL Workbench using the following code : 
-- SQL Code to Create the Table   

Create database students;
use students;

CREATE TABLE Student_Performance (
student_id INT PRIMARY KEY,
name VARCHAR(50),
course VARCHAR(30),
score INT,
attendance INT,
mentor VARCHAR(50),
join_date DATE,
city VARCHAR(50)
);      

INSERT INTO Student_Performance
(student_id, name, course, score, attendance, mentor, join_date, city)
VALUES
(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', '2023-06-12', 'Mumbai'),
(102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma', '2023-07-01', 'Delhi'),
(103, 'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair', '2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. Iyer', '2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms. Nair', '2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer', '2023-05-28', 'Pune'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms. Kapoor', '2023-06-15', 'Delhi'),
(108, 'Meera Pillai', 'Tableau', 82, 87, 'Ms. Kapoor', '2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr. Sharma', '2023-07-05', 'Chennai'),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr. Iyer', '2023-05-27', 'Bengaluru'),
(111, 'Siddharth Jain', 'Python', 85, 90, 'Ms. Nair', '2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor', '2023-06-10', 'Pune'),
(113, 'Rohan Gupta', 'SQL', 89, 91, 'Mr. Iyer', '2023-05-25', 'Delhi'),
(114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma', '2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair', '2023-07-12', 'Hyderabad');        



SHOW TABLES;
select *    
from  Student_Performance;       

-- Assignment Questions   

-- Question 1 : Create a ranking of students based on score (highest first). 
-- solution:-

select *, Dense_rank () over ( order by highest_score desc) as rank_students
from (select name,course, student_id, attendance, mentor, join_date, city, max(score) as highest_score
from student_performance
group by student_id, name, course, attendance, mentor, join_date, city
) as a;



-- Question 2 : Show each student's score and the previous student’s score (based on score order).
-- solution-

SELECT student_id, name, score,
LAG(score) OVER (ORDER BY score DESC) AS prev_score
FROM student_performance;


-- Question 3 : Convert all student names to uppercase and extract the month name from join_date.
-- solution-

SELECT 
UPPER(name) AS name_upper, 
MONTHNAME(join_date) AS join_month
FROM student_performance;


-- Question 4 : Show each student's name and the next student’s attendance (ordered by attendance).
-- solution-

SELECT student_id, name, attendance, score, course,
LEAD(attendance) OVER (ORDER BY attendance ASC) AS next_attendance
FROM student_performance;


-- Question 5 : Assign students into 4 performance groups using NTILE().
-- solution-

SELECT student_id, name, score,  course,
NTILE(4) OVER (ORDER BY score DESC) AS performance_group
FROM student_performance;


-- Question 6 : For each course, assign a row number based on attendance (highest first).
-- solution-

SELECT course, student_id, name, attendance, score,
ROW_NUMBER() OVER ( PARTITION BY course 
ORDER BY attendance DESC
    ) AS attendance_rank
FROM student_performance;


-- Question 7 : Calculate the number of days each student has been enrolled (from join_date to today).
-- (Assume current date = '2025-01-01').
-- solution-

SELECT student_id, name, join_date, score, course,
DATEDIFF('2025-01-01', join_date) AS days_enrolled
FROM student_performance;


-- Question 8 : Format join_date as “Month Year” (e.g., “June 2023”).
-- solution-

SELECT student_id,name, score, course,
DATE_FORMAT(join_date, '%M %Y') AS formatted_date
FROM student_performance;


-- Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes.
-- solution-

SELECT Student_id, name,  score, course,
REPLACE(city, 'Mumbai', 'MUM') AS city_display
FROM student_performance;


-- Question 10 : For each course, find the highest score using FIRST_VALUE().
-- solution-

SELECT student_id, name, score, course,
FIRST_VALUE(score) OVER (PARTITION BY student_id 
ORDER BY score DESC) AS highest_score
FROM student_performance;

























 
  