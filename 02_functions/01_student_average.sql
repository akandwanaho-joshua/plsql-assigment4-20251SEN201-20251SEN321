CREATE OR REPLACE FUNCTION a4_student_average(p_student_id IN NUMBER) RETURN NUMBER IS
 v_student a4_students%ROWTYPE;
 v_average NUMBER;
BEGIN
 SELECT * INTO v_student FROM a4_students WHERE student_id=p_student_id;
 SELECT ROUND(AVG(grade),2) INTO v_average FROM a4_enrollments
 WHERE student_id=v_student.student_id;
 RETURN v_average; -- NULL indicates no graded courses, not zero.
EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20007,'Student does not exist');
 WHEN OTHERS THEN RAISE;
END;
/
