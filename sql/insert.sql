-- insert entity
insert into entity values ('employee', 'strong');
insert into entity values ('associate', 'weak');
insert into entity values ('temphourly', 'weak');
insert into entity values ('promotion', 'strong');
insert into entity values ('contractor', 'strong');
insert into entity values ('display', 'strong');
insert into entity values ('region', 'strong');
insert into entity values ('store', 'strong');
insert into entity values ('product', 'strong');

insert into isa(entity_name_1, entity_name_2) values('employee', 'associate');
insert into isa(entity_name_1, entity_name_2) values('employee', 'temphourly');
insert into isa(entity_name_1, entity_name_2) values('temphourly', 'contractor');


insert into relationship values('hires', 'associate', 'contractor', '1', 'M');
insert into relationship values('schedules', 'associate', 'display', '1', 'M');
insert into relationship values('owns', 'associate', 'promotion', 'M', 'N');
insert into relationship values('workson', 'promotion', 'contractor', 'M', 'N');
insert into relationship values('builds', 'temphourly', 'display', 'N', 'M');
insert into relationship values('stock', 'temphourly', 'display', 'N', 'M');
insert into relationship values('designs', 'contractor', 'display', 'M', 'N');
insert into relationship values('worksin', 'associate', 'store', 'M', '1');
insert into relationship values('manages', 'associate', 'store', '1', '1');
insert into relationship values('iswithin', 'region', 'store', '1', 'M');
insert into relationship values('offers', 'store', 'product', '1', 'M');
insert into relationship values('assignto', 'temphourly', 'store', 'M', '1');
insert into relationship values('contains', 'display', 'product', '1', 'M');
insert into relationship values('d1', 'employee', 'associate', null, null);
insert into relationship values('d2', 'employee', 'temphourly', null, null);
insert into relationship values('d3', 'temphourly', 'contractor', null, null);

insert into attribute(attribute_name, attribute_type, data_type) values ('name', null, 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, parent_attribute, data_type) values ('fname', null, 'name', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, parent_attribute, data_type) values ('minit', null, 'name', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, parent_attribute, data_type) values ('lname', null, 'name', 'VARCHAR2');

insert into attribute(attribute_name, attribute_type, data_type) values ('ssn', 'primary', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('dob', null, 'NUMERIC');
insert into attribute(attribute_name, attribute_type, data_type) values ('sex', null, 'CHAR');
insert into attribute(attribute_name, attribute_type, derived_attribute, data_type) values ('age', null, 'dob', 'NUMERIC');

insert into attribute(attribute_name, attribute_type, data_type) values ('address', null , 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, parent_attribute, data_type) values ('state', null, 'address', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, parent_attribute, data_type) values ('city', null, 'address', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, parent_attribute, data_type) values ('street', null, 'address', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, parent_attribute, data_type) values ('zip', null, 'address', 'VARCHAR2');

insert into attribute(attribute_name, attribute_type, data_type) values ('aphone', null, 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('title', null, 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('aemail', null, 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('salary', null, 'NUMERIC');


insert into attribute(attribute_name, attribute_type, data_type) values ('specialty', null, 'VARCHAR2');

insert into attribute(attribute_name, attribute_type, data_type) values ('jobtitle', null, 'VARCHAR2');


insert into attribute(attribute_name, attribute_type, data_type) values ('date', null, 'DATE');


insert into attribute(attribute_name, attribute_type, data_type) values ('proname', 'primary', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('startdate', null, 'DATE');
insert into attribute(attribute_name, attribute_type, data_type) values ('enddate', null, 'DATE');

insert into attribute(attribute_name, attribute_type, data_type) values ('aisle', 'primary', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('row', 'primary', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('section', 'primary', 'VARCHAR2');

insert into attribute(attribute_name, attribute_type, data_type) values ('rname', 'primary', 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('rid#', null, 'NUMERIC');

insert into attribute(attribute_name, attribute_type, data_type) values ('store#', 'primary', 'NUMERIC');
insert into attribute(attribute_name, attribute_type, data_type) values ('size', null, 'NUMERIC');
insert into attribute(attribute_name, attribute_type, data_type) values ('saddress', null, 'VARCHAR2');

insert into attribute(attribute_name, attribute_type, data_type) values ('sku#', 'primary', 'NUMERIC');
insert into attribute(attribute_name, attribute_type, data_type) values ('prdname', null, 'VARCHAR2');
insert into attribute(attribute_name, attribute_type, data_type) values ('pgroup', null, 'VARCHAR2');



insert into has_attrbiute(entity_name, attribute_name) values ('employee', 'name');


insert into has_attrbiute(entity_name, attribute_name) values ('employee', 'ssn');
insert into has_attrbiute(entity_name, attribute_name) values ('employee', 'age');
insert into has_attrbiute(entity_name, attribute_name) values ('employee', 'dob');
insert into has_attrbiute(entity_name, attribute_name) values ('employee', 'sex');



insert into has_attrbiute(entity_name, attribute_name) values ('employee', 'address');


insert into has_attrbiute(entity_name, attribute_name) values ('associate', 'aphone');
insert into has_attrbiute(entity_name, attribute_name) values ('associate', 'title');
insert into has_attrbiute(entity_name, attribute_name) values ('associate', 'aemail');
insert into has_attrbiute(entity_name, attribute_name) values ('associate', 'salary');


insert into has_attrbiute(entity_name, attribute_name) values ('promotion', 'proname');

insert into has_attrbiute(entity_name, attribute_name) values ('associate', 'startdate');
insert into has_attrbiute(entity_name, attribute_name) values ('associate', 'enddate');

insert into has_attrbiute(entity_name, attribute_name) values ('contractor', 'specialty');


insert into has_attrbiute(entity_name, attribute_name) values ('temphourly', 'jobtitle');


insert into has_attrbiute(entity_name, attribute_name) values ('display', 'aisle');
insert into has_attrbiute(entity_name, attribute_name) values ('display', 'row');
insert into has_attrbiute(entity_name, attribute_name) values ('display', 'section');

insert into has_attrbiute(entity_name, attribute_name) values ('region', 'rname');
insert into has_attrbiute(entity_name, attribute_name) values ('region', 'rid#');

insert into has_attrbiute(entity_name, attribute_name) values ('store', 'size');
insert into has_attrbiute(entity_name, attribute_name) values ('store', 'saddress');
insert into has_attrbiute(entity_name, attribute_name) values ('store', 'store#');


insert into has_attrbiute(entity_name, attribute_name) values ('product', 'sku#');
insert into has_attrbiute(entity_name, attribute_name) values ('product', 'prdname');
insert into has_attrbiute(entity_name, attribute_name) values ('product', 'pgroup');

insert into has_relationship_attribute(relationship_name, attribute_name) values ('builds', 'date');