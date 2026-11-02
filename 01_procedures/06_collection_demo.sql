CREATE OR REPLACE PROCEDURE a4_collection_demo IS
 TYPE name_map IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
 TYPE id_list IS TABLE OF NUMBER;
 v_names name_map;
 v_ids id_list := id_list(101,102,103);
 v_idx PLS_INTEGER;
BEGIN
 FOR i IN 1..v_ids.COUNT LOOP
  BEGIN
   SELECT full_name INTO v_names(v_ids(i)) FROM a4_students WHERE student_id=v_ids(i);
  EXCEPTION WHEN NO_DATA_FOUND THEN v_names(v_ids(i)):='Missing student'; END;
 END LOOP;
 v_idx := v_names.FIRST;
 WHILE v_idx IS NOT NULL LOOP
  DBMS_OUTPUT.PUT_LINE(v_idx||' -> '||v_names(v_idx));
  v_idx := v_names.NEXT(v_idx);
 END LOOP;
END;
/
