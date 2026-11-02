SELECT object_name, object_type, status
FROM user_objects
WHERE object_name LIKE 'A4_%'
  AND object_type IN ('PROCEDURE', 'FUNCTION')
ORDER BY object_type, object_name;