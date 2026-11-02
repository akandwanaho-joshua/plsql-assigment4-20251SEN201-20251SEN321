# Implementation Notes

## Student Registration and Grading Management System

**Course:** INSY 8311 --- Database Development with PL/SQL\
**Assignment:** Group Assignment IV\
**Class Group:** I\
**Group members:** DUSHIMIMANA EMMANUEL (20251SEN201) and AKANDWANAHO
JOSHUA (20251SEN321)

## 1. Application Scenario

The project implements a Student Registration and Grading Management
System. It organizes student details, course details, enrollments, and
grade information in Oracle database tables. The implementation
demonstrates the PL/SQL topics required by Assignment IV.

## 2. Database Design

The schema contains four main tables:

-   `A4_STUDENTS` stores student details.
-   `A4_COURSES` stores course details.
-   `A4_ENROLLMENTS` associates students with courses and stores
    enrollment and grade information.
-   `A4_GRADE_AUDIT` stores information about grade changes.

The table definitions and constraints are implemented in
`00_schema/01_create_tables.sql`. The sample records are inserted by
`00_schema/02_insert_sample_data.sql`. Refer to those SQL files for the
exact column definitions and constraints.

## 3. Records

A PL/SQL record groups related fields into one composite variable.

The project demonstrates a user-defined record in the
student-registration logic. This groups related student attributes so
they can be handled together.

The project also demonstrates `%ROWTYPE`. It declares a record whose
fields correspond to a database table row or cursor row. This is useful
when processing several columns together.

A record represents one structured item, whereas a collection stores
multiple elements.

## 4. Collections

The collection demonstration shows how PL/SQL can store and process
multiple values in memory. Collections are useful when a PL/SQL block
needs to group values and access them as a set.

The assignment refers to associative arrays, nested tables, and VARRAYs.
In the presentation, describe only the collection types actually
implemented in the submitted SQL files. Do not claim that a type is
demonstrated if it is not present in the code.

## 5. Implicit Cursors

Oracle creates and manages an implicit cursor automatically for SQL
statements such as `INSERT`, `UPDATE`, and `DELETE`.

The project uses implicit cursor attributes:

-   `SQL%ROWCOUNT` reports the number of rows affected by the most
    recent SQL statement.
-   `SQL%FOUND` indicates whether the most recent SQL statement affected
    or returned a row.
-   `SQL%NOTFOUND` indicates that the most recent SQL statement did not
    affect or return a row.

These attributes help procedures determine whether database operations
affected records.

## 6. Explicit Cursors

An explicit cursor is declared by the programmer for a query whose
result is processed in PL/SQL.

The student-report procedure demonstrates explicit cursor processing.
Its lifecycle is:

1.  Declare the cursor and its query.
2.  Open the cursor.
3.  Fetch rows.
4.  Process each fetched row.
5.  Stop when no more rows are available.
6.  Close the cursor.

Explicit cursors are useful when query results must be processed row by
row. The report also demonstrates record-based processing of retrieved
information.

## 7. Bulk Processing: BULK COLLECT and FORALL

The bulk-processing procedure demonstrates two PL/SQL features.

### BULK COLLECT

`BULK COLLECT` retrieves multiple rows from a SQL query into a PL/SQL
collection in a bulk operation. It can reduce repeated movement of
individual rows between the SQL and PL/SQL engines.

### FORALL

`FORALL` sends DML statements to the SQL engine in batches using values
stored in collections. It can reduce context-switching overhead compared
with executing the same DML statement repeatedly in a conventional
PL/SQL loop.

### Bulk exception handling

The implementation includes bulk DML exception handling. Where
`SAVE EXCEPTIONS` is used, Oracle makes individual failures available
through `SQL%BULK_EXCEPTIONS`.

Bulk processing can improve efficiency for suitable multi-row
operations. This project does not claim a measured performance
improvement because no controlled execution-time benchmark is included.

## 8. Stored Procedures

The project contains six procedures:

1.  `A4_REGISTER_STUDENT` --- handles student registration.
2.  `A4_UPDATE_GRADE` --- handles a grade update.
3.  `A4_DELETE_ENROLLMENT` --- handles deletion of an enrollment.
4.  `A4_STUDENT_REPORT` --- retrieves and displays a student's
    enrollment report.
5.  `A4_BULK_BONUS` --- demonstrates bulk grade processing.
6.  `A4_COLLECTION_DEMO` --- demonstrates collection processing.

The corresponding SQL files define the parameters and detailed behavior
of each procedure.

## 9. Stored Functions

The project contains two functions:

-   `A4_STUDENT_AVERAGE` calculates and returns a student's average
    grade.
-   `A4_STUDENT_STATUS` returns a student's academic status.

A function returns a value to the calling expression or PL/SQL block.

## 10. Exception Handling

Exception handling allows a PL/SQL program to respond to errors in a
controlled way.

The project demonstrates:

-   **Predefined exceptions**, including `NO_DATA_FOUND` and
    `TOO_MANY_ROWS`.
-   **A user-defined exception** for an invalid grade.
-   **Application errors** raised using `RAISE_APPLICATION_ERROR`.
-   **Bulk DML exception handling** in the bulk-processing
    implementation.

The error-test script should be executed to confirm the expected handled
messages.

## 11. Transactions and Test Data

The test scripts perform database operations to demonstrate successful
and unsuccessful cases. DML changes may become permanent when a
transaction is committed.

For repeatable testing, use a clean test schema or restore the sample
data before rerunning tests that insert the same identifiers or apply
grade changes. Do not repeatedly run a grade-bonus procedure on the same
data unless repeated bonuses are intended.

Run the success-case script and verify its results before capturing
screenshots. Then run the error-case script and review the expected
handled errors.

## 12. Testing Evidence

The project includes:

-   `03_tests/test_success_cases.sql` for successful operations and
    demonstrations.
-   `03_tests/test_error_cases.sql` for exception and error-handling
    tests.
-   `screenshots/` for genuine output captured from Oracle SQL
    Developer.

Screenshots should show the relevant script output or query result
clearly. Include only screenshots that correspond to tests actually
executed.

## 13. Performance Considerations

The project demonstrates bulk processing as a way to reduce repeated
SQL-to-PL/SQL context switches when processing multiple rows.

-   Use ordinary SQL and implicit cursors for straightforward DML.
-   Use explicit cursors when row-by-row processing is needed.
-   Use `BULK COLLECT` to fetch multiple rows into collections.
-   Use `FORALL` for bulk DML using collection values.
-   For large result sets, fetching in batches can help control memory
    use.

No numerical performance claim is made because the project does not
include benchmark measurements comparing row-by-row and bulk execution.

## 14. Final Verification

The implementation should be considered verified only after the group
has compiled all stored objects, executed both test scripts, checked the
actual database results, and captured the corresponding screenshots in
Oracle SQL Developer.

Both group members are responsible for understanding the submitted code
and being able to explain it during the presentation.
