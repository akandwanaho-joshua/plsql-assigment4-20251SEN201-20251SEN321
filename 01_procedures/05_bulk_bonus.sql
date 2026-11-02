CREATE OR REPLACE PROCEDURE a4_bulk_bonus(p_course_id IN NUMBER,p_bonus IN NUMBER) IS
 TYPE id_tab IS TABLE OF a4_enrollments.enrollment_id%TYPE;
 TYPE grade_tab IS TABLE OF a4_enrollments.grade%TYPE;
 v_ids id_tab; v_grades grade_tab;
 e_bulk EXCEPTION;
 PRAGMA EXCEPTION_INIT(e_bulk,-24381);
BEGIN
 IF p_bonus IS NULL OR p_bonus < 0 OR p_bonus > 20 THEN
  RAISE_APPLICATION_ERROR(-20006,'Bonus must be between 0 and 20');
 END IF;
 SELECT enrollment_id,grade BULK COLLECT INTO v_ids,v_grades
 FROM a4_enrollments WHERE course_id=p_course_id AND grade IS NOT NULL;
 IF v_ids.COUNT=0 THEN
  DBMS_OUTPUT.PUT_LINE('No graded enrollments for course '||p_course_id);
  RETURN;
 END IF;
 FORALL i IN 1..v_ids.COUNT SAVE EXCEPTIONS
  UPDATE a4_enrollments SET grade=LEAST(100,v_grades(i)+p_bonus)
  WHERE enrollment_id=v_ids(i);
 DBMS_OUTPUT.PUT_LINE('Bulk updated: '||SQL%ROWCOUNT);
EXCEPTION
 WHEN e_bulk THEN
  FOR j IN 1..SQL%BULK_EXCEPTIONS.COUNT LOOP
   DBMS_OUTPUT.PUT_LINE('Bulk error index '||SQL%BULK_EXCEPTIONS(j).ERROR_INDEX||
    ', ORA-'||SQL%BULK_EXCEPTIONS(j).ERROR_CODE);
  END LOOP;
  RAISE;
 WHEN OTHERS THEN RAISE;
END;
/
