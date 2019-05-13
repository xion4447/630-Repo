CREATE TABLE test_new_table (
    table_name varchar2(231)
);
INSERT INTO test_new_table(table_name)
SELECT table_name
FROM   all_tables
FETCH FIRST 5 ROWS ONLY;
