-- All_Ents
select entity_name from entity;

-- All_Atts
select attribute_name from attribute;

-- All_Keys
select ac.table_name, acc.column_name
from all_constraints ac
join all_cons_columns  acc on ac.constraint_name = acc.constraint_name
where ac.constraint_type = 'P' 
order by ac.table_name;

-- All_Rels
select relationship_name from relationship;

-- EntAtt
select entity_name, attribute_name from has_attrbiute;

-- RelEnt
select relationship_name, entity_name_1, entity_name_2 from relationship;

-- RelAtt
select * from has_relationship_attribute;

-- AttDateType
