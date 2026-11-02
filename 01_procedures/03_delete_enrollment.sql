CREATE OR REPLACE PROCEDURE a4_delete_enrollment(p_enrollment_id IN NUMBER) IS
BEGIN
 DELETE FROM a4_enrollments WHERE enrollment_id=p_enrollment_id;
 IF SQL%NOTFOUND THEN
  DBMS_OUTPUT.PUT_LINE('No enrollment deleted: '||p_enrollment_id);
 ELSE
  DBMS_OUTPUT.PUT_LINE('Deleted rows: '||SQL%ROWCOUNT);
 END IF;
EXCEPTION WHEN OTHERS THEN RAISE;
END;
/
