# Assignment IV --- Advanced Oracle PL/SQL Programming

## Student Registration and Grading Management System

**Course:** INSY 8311 --- Database Development with PL/SQL\
**Instructor:** Eric Maniraguha\
**Class Group:** I\
**Deadline:** Monday, November 2, 2026, 11:59 PM

## Group Members

  Student name           Student ID
  ---------------------- -------------
  DUSHIMIMANA EMMANUEL   20251SEN201
  
  AKANDWANAHO JOSHUA     20251SEN321

## 1. Project Description

This project implements a Student Registration and Grading Management
System using Oracle Database and PL/SQL. It manages student details,
courses, enrollments, and grades. It demonstrates records, collections,
implicit and explicit cursors, bulk processing, stored procedures,
stored functions, and exception handling.

## 2. Main Features

-   Register students and manage enrollments.
-   Store course and student information.
-   Update grades and record grade-audit information.
-   Delete enrollment records.
-   Generate student enrollment reports.
-   Calculate student averages and academic status.
-   Demonstrate collections and bulk database processing.
-   Handle predefined and user-defined exceptions.

## 3. Database Tables

-   `A4_STUDENTS` --- student information.
-   `A4_COURSES` --- course information.
-   `A4_ENROLLMENTS` --- student course registrations and grades.
-   `A4_GRADE_AUDIT` --- grade-change audit information.

## 4. Technologies

-   Oracle Database
-   Oracle SQL Developer
-   SQL and PL/SQL
-   Git and GitHub

## 5. Project Structure

``` text
README.md
.gitignore
00_schema/
  01_create_tables.sql
  02_insert_sample_data.sql
01_procedures/
  01_register_student.sql
  02_update_grade.sql
  03_delete_enrollment.sql
  04_student_report.sql
  05_bulk_bonus.sql
  06_collection_demo.sql
02_functions/
  01_student_average.sql
  02_student_status.sql
03_tests/
  test_success_cases.sql
  test_error_cases.sql
screenshots/
docs/
  IMPLEMENTATION_NOTES.md
```

## 6. How to Run the Project

1.  Open Oracle SQL Developer and connect to the assignment schema.
2.  Execute `00_schema/01_create_tables.sql`.
3.  Execute `00_schema/02_insert_sample_data.sql`.
4.  Compile all six SQL files in `01_procedures/`.
5.  Compile both SQL files in `02_functions/`.
6.  Check that the stored objects have `VALID` status.
7.  Execute `03_tests/test_success_cases.sql` and review its output.
8.  Execute `03_tests/test_error_cases.sql` and review the expected
    exception messages.
9.  Save genuine screenshots of the actual SQL Developer results in
    `screenshots/`.

Use **Run Script (F5)** for scripts containing PL/SQL blocks,
`SET SERVEROUTPUT`, `PROMPT`, or `DBMS_OUTPUT`. Enable DBMS Output for
the active connection when needed.

Do not rerun scripts that insert existing primary keys or apply grade
changes without resetting the test data. Follow the comments and
transaction instructions in the SQL scripts.

## 7. PL/SQL Concepts Demonstrated

-   **Records:** user-defined records and `%ROWTYPE`.
-   **Collections:** PL/SQL collections for holding multiple values.
-   **Implicit cursors:** `SQL%ROWCOUNT`, `SQL%FOUND`, and
    `SQL%NOTFOUND`.
-   **Explicit cursors:** cursor declaration, opening, fetching,
    processing, and closing.
-   **Bulk processing:** `BULK COLLECT`, `FORALL`, and bulk exception
    handling.
-   **Procedures and functions:** reusable database operations and
    functions that return values.
-   **Exception handling:** predefined exceptions, a user-defined
    exception, and `RAISE_APPLICATION_ERROR`.

## 8. Testing and Screenshots

The `03_tests/` folder contains success-case and error-case scripts. The
`screenshots/` folder contains genuine screenshots captured from the
group's Oracle SQL Developer session. Screenshots should be readable and
should correspond to tests that were actually executed.

## 9. Implementation Notes

See `docs/IMPLEMENTATION_NOTES.md` for explanations of the database
design, records, collections, cursors, bulk processing, procedures,
functions, exceptions, transactions, and performance considerations.

## 10. AI Assistance Disclosure

We used ChatGPT as a learning and support tool during this assignment.
It helped us understand PL/SQL concepts, interpret the assignment
requirements, organize the project structure, draft and review parts of
the SQL code, prepare test ideas, understand Oracle errors, and prepare
documentation.

We reviewed the work, executed the SQL scripts in Oracle SQL Developer,
checked the database results, corrected issues encountered during
testing, and captured screenshots from our own execution. We are
responsible for understanding and explaining the submitted work. AI
assistance supported our learning and development; it did not replace
our responsibility for reviewing and verifying the project.

## 11. GitHub Repository


https://github.com/akandwanaho-joshua/plsql-assigment4-20251SEN201-20251SEN321/edit/main/README.md
Both group members should make meaningful contributions and commits to
the repository as required by the assignment.
