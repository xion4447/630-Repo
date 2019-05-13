-- 1
SELECT
    entity_name
FROM
    all_ents;

-- 2
SELECT
    attribute_name
FROM
    all_atts;

-- 3
SELECT
    relationship.relationship_name,
    relationship.entity_name_1,
    relationship.entity_name_2
FROM
    relationship;

-- 4
SELECT
    relationship.relationship_name,
    relationship.entity_name_1,
    relationship.entity_name_2,
    relationship.cardinality_1,
    relationship.cardinality_2
FROM
    relationship
ORDER BY
    relationship.entity_name_1,
    relationship.cardinality_1,
    relationship.relationship_name,
    relationship.cardinality_2,
    relationship.entity_name_2;

-- 5
SELECT
    system.relationship.relationship_name
FROM
    system.relationship
WHERE
    cardinality_1 = '1'
    AND cardinality_2 = '1';
    
-- 6
SELECT
    system.relationship.relationship_name
FROM
    system.relationship
WHERE
    (cardinality_1 = '1'
    AND cardinality_2 = 'M')
    OR (cardinality_1 = 'M'
    AND cardinality_2 = '1');

-- 7
SELECT
    system.relationship.relationship_name
FROM
    system.relationship
WHERE
    (cardinality_1 = 'M'
    AND cardinality_2 = 'N')
    OR (cardinality_1 = 'N'
    AND cardinality_2 = 'M');

-- 8
SELECT
    system.relatt.*
FROM
    system.relatt;

-- 9
SELECT ALL_RELS.RELATIONSHIP_NAME FROM ALL_RELS
FULL JOIN RELATT ON all_rels.relationship_name = relatt.relationship_name
WHERE relatt.relationship_name IS NULL;

-- 10
SELECT all_ents.entity_name, isa.entity_name_1 FROM all_ents
JOIN isa ON isa.entity_name_2 = all_ents.entity_name;

-- 11
SELECT isa.entity_name_1, all_ents.entity_name FROM all_ents
JOIN isa ON isa.entity_name_2 = all_ents.entity_name;

-- 12
select * from entkey;


-- 13
SELECT all_ents.entity_name FROM all_ents
FULL JOIN entkey on all_ents.entity_name = entkey.entity_name
WHERE entkey."keys" is null;

-- 14
SELECT
    system.attribute.attribute_name,
    system.attribute.data_type
FROM
    system.attribute;

-- 15
SELECT derived_attribute, attribute_name FROM attribute
WHERE derived_attribute is not null;

-- 16
Select attribute_name
From attdatetype
Where data_type='DATE'
;

-- 17
Select attribute_name
From ENTATT
Where entity_name='employee'
;

-- 18
SELECT attribute_name
FROM RELATT;

-- 19
SELECT distinct entity_name_2
FROM Relationship
WHERE relationship.entity_name_1='temphourly'
union
SELECT distinct entity_name_1
FROM Relationship
WHERE relationship.entity_name_2='temphourly';

-- 20
select distinct r2.entity_name_2 as entity_name
from relationship r1
join relationship r2 on (r1.entity_name_2 = r2.entity_name_1) 
where (r1.entity_name_1 = 'temphourly')
union
select distinct r2.entity_name_1 as entity_name
from relationship r1
join relationship r2 on (r1.entity_name_2 = r2.entity_name_2) 
where (r1.entity_name_1 = 'temphourly' and r2.entity_name_1 <> 'temphourly')
union
select distinct r2.entity_name_1 as entity_name
from relationship r1
join relationship r2 on (r1.entity_name_1 = r2.entity_name_1) 
where (r1.entity_name_2 = 'temphourly' and r2.entity_name_1 <> 'temphourly')
union
select distinct r2.entity_name_2 as entity_name
from relationship r1
join relationship r2 on (r1.entity_name_1 = r2.entity_name_2) 
where (r1.entity_name_2 = 'temphourly' and r2.entity_name_2 <> 'temphourly');

-- 21
SELECT
    attribute_name
FROM
    entatt
WHERE
    entity_name= 'store' or entity_name= 'region'
;

-- 22
SELECT relent.entity_name_1 from relent
WHERE relent.entity_name_2  = 'product';

-- 23
SELECT isa.entity_name_2 FROM isa
WHERE isa.entity_name_1 = 'employee'; 

-- 24
SELECT entatt.entity_name FROM entatt
group by entity_name
having count(attribute_name) = 3;

-- 25
SELECT parent_attribute, attribute_name
FROM attribute
WHERE Parent_attribute is NOT NULL;

-- 26
SELECT 'parent ' || entity_name_1, 'child ' || Entity_name_2
FROM ISA;

-- 27
select at.table_name, LISTAGG(atc.column_name, ', ')
WITHIN GROUP (ORDER BY atc.column_name) "columns"
from all_tables at
join all_tab_cols atc on atc.table_name = at.table_name
where at.table_name in ('ISA', 'HAS_RELATIONSHIP', 'HAS_ATTRBIUTE', 'HAS_RELATIONSHIP_ATTRIBUTE', 'ATTRIBUTE','RELATIONSHIP', 'ENTITY')
group by at.table_name;
