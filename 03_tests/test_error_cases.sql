SET SERVEROUTPUT ON SIZE UNLIMITED;
-- Each expected error is handled separately; no failed operation is committed.
DECLARE v_rows NUMBER;
BEGIN
 BEGIN a4_register_student(101,'Duplicate','duplicate@example.edu',v_rows);
 EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('EXPECTED duplicate: '||SQLERRM); END;
 BEGIN a4_update_grade(1001,150);
 EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('EXPECTED invalid grade: '||SQLERRM); END;
 BEGIN a4_update_grade(9999,80);
 EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('EXPECTED missing enrollment: '||SQLERRM); END;
 BEGIN a4_student_report(9999);
 EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('EXPECTED missing student: '||SQLERRM); END;
 BEGIN DBMS_OUTPUT.PUT_LINE(a4_student_average(9999));
 EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('EXPECTED invalid average: '||SQLERRM); END;
 BEGIN a4_bulk_bonus(10,-5);
 EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('EXPECTED invalid bonus: '||SQLERRM); END;
END;
/
-- Demonstrates predefined TOO_MANY_ROWS using the sample data.
DECLARE v_name a4_students.full_name%TYPE;
BEGIN
 BEGIN
  SELECT full_name INTO v_name FROM a4_students WHERE student_id IN (101,102);
 EXCEPTION WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('EXPECTED TOO_MANY_ROWS'); END;
END;
/
