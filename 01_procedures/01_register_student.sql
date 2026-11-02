CREATE OR REPLACE PROCEDURE a4_register_student(
 p_id IN NUMBER,p_name IN VARCHAR2,p_email IN VARCHAR2,p_rows OUT NUMBER
) IS
 TYPE student_rec IS RECORD (sid NUMBER, sname VARCHAR2(100), semail VARCHAR2(120));
 v_student student_rec;
BEGIN
 IF p_id IS NULL OR TRIM(p_name) IS NULL THEN
  RAISE_APPLICATION_ERROR(-20001,'Student ID and name are required');
 END IF;
 v_student.sid := p_id; v_student.sname := p_name; v_student.semail := p_email;
 INSERT INTO a4_students(student_id,full_name,email)
 VALUES(v_student.sid,v_student.sname,v_student.semail);
 p_rows := SQL%ROWCOUNT;
 IF SQL%FOUND THEN DBMS_OUTPUT.PUT_LINE('Student registered: '||v_student.sname); END IF;
EXCEPTION
 WHEN DUP_VAL_ON_INDEX THEN RAISE_APPLICATION_ERROR(-20002,'Student ID or email already exists');
 WHEN OTHERS THEN RAISE;
END;
/
