CREATE VIEW  All_Ents AS
select entity_name from entity;

CREATE VIEW  All_Atts AS
select attribute_name from attribute;

CREATE VIEW  All_Keys AS
select e.entity_name, a.attribute_name
from entity e
join has_attrbiute ha on ha.entity_name = e.entity_name
join attribute a on ha.attribute_name = a.attribute_name
where a.attribute_type is null;

CREATE VIEW  All_Rels AS
select relationship_name from relationship;

CREATE VIEW  EntAtt AS
select entity_name, attribute_name from has_attrbiute
union
select entity_name, a.attribute_name from has_attrbiute ha
join attribute a on a.parent_attribute = ha.attribute_name;

CREATE VIEW  RelEnt AS
select relationship_name, entity_name_1, entity_name_2 from relationship;


CREATE VIEW  RelAtt AS
select * from has_relationship_attribute;

CREATE VIEW  AttDateType AS
select attribute_name, data_type from attribute;


CREATE VIEW  EntKey AS
select e.entity_name, LISTAGG(a.attribute_name, ', ')
WITHIN GROUP (ORDER BY a.attribute_name) "keys"
from entity e
join has_attrbiute hs on hs.entity_name = e.entity_name
join attribute a on hs.attribute_name = a.attribute_name
where a.attribute_type = 'primary'
group by e.entity_name;

CREATE VIEW  KeyAttr AS
select ae.attribute_name, ak.attribute_name as "attribute_key"
from attribute ae
join attribute ak on ae.attribute_name = ak.parent_attribute;
