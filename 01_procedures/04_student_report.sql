CREATE OR REPLACE PROCEDURE a4_student_report(p_student_id IN NUMBER) IS
 v_student a4_students%ROWTYPE;
 CURSOR c_grades IS
  SELECT c.course_name,e.grade FROM a4_enrollments e
  JOIN a4_courses c ON c.course_id=e.course_id
  WHERE e.student_id=p_student_id ORDER BY c.course_name;
 v_course a4_courses.course_name%TYPE;
 v_grade a4_enrollments.grade%TYPE;
BEGIN
 SELECT * INTO v_student FROM a4_students WHERE student_id=p_student_id;
 DBMS_OUTPUT.PUT_LINE('Student: '||v_student.full_name||' ('||v_student.student_id||')');
 OPEN c_grades;
 LOOP
  FETCH c_grades INTO v_course,v_grade;
  EXIT WHEN c_grades%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(v_course||': '||NVL(TO_CHAR(v_grade),'Not graded'));
 END LOOP;
 DBMS_OUTPUT.PUT_LINE('Courses fetched: '||c_grades%ROWCOUNT);
 CLOSE c_grades;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
  IF c_grades%ISOPEN THEN CLOSE c_grades; END IF;
  RAISE_APPLICATION_ERROR(-20005,'Student not found');
 WHEN OTHERS THEN
  IF c_grades%ISOPEN THEN CLOSE c_grades; END IF;
  RAISE;
END;
/
