DECLARE
  TYPE nt_type IS TABLE OF VARCHAR2(100);
  nt nt_type := nt_type ('isa', 'has_relationship', 'has_attrbiute', 'has_relationship_attribute', 'attribute', 'relationship', 'entity');
BEGIN
  FOR i in 1..nt.count LOOP
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || nt(i);
    EXCEPTION
       WHEN OTHERS THEN
          IF SQLCODE != -942 THEN
             RAISE;
          END IF;
    END;      
  END LOOP;
END;
/
CREATE TABLE entity (
    entity_name VARCHAR2(256),
    entity_type VARCHAR2(100),
    CONSTRAINT entity_pk PRIMARY KEY (entity_name)
);

CREATE TABLE isa (
    isa_id          NUMERIC(10) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    entity_name_1   VARCHAR2(256),
    entity_name_2   VARCHAR2(256),
    CONSTRAINT isa_id_pk PRIMARY KEY (isa_id),
    CONSTRAINT entity_1_entity_fk FOREIGN KEY (entity_name_1) REFERENCES entity (entity_name) ON DELETE CASCADE,
    CONSTRAINT entity_2_entity_fk FOREIGN KEY (entity_name_2) REFERENCES entity (entity_name) ON DELETE CASCADE,
    CONSTRAINT unique_entity_1_entity_2 UNIQUE (entity_name_1, entity_name_2)
);

CREATE TABLE relationship (
    relationship_name   VARCHAR2(256),
    entity_name_1       VARCHAR2(256),
    entity_name_2       VARCHAR2(256),
    cardinality_1       CHAR(1),
    cardinality_2       CHAR(1),
    CONSTRAINT relationship_name_pk PRIMARY KEY (relationship_name),
    CONSTRAINT entity_1_relationship_fk FOREIGN KEY (entity_name_1) REFERENCES entity (entity_name) ON DELETE CASCADE,
    CONSTRAINT entity_2_relationship_fk FOREIGN KEY (entity_name_2) REFERENCES entity (entity_name) ON DELETE CASCADE
);

CREATE TABLE has_relationship (
    has_relationship_id    NUMERIC(10) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    entity_name            VARCHAR2(256) NOT NULL,
    relationship_name      VARCHAR2(256) NOT NULL,
    CONSTRAINT has_relationship_pk PRIMARY KEY (has_relationship_id),
    CONSTRAINT entity_has_relationship_fk FOREIGN KEY (entity_name) REFERENCES entity (entity_name) ON DELETE CASCADE,
    CONSTRAINT relationship_has_relationship_fk FOREIGN KEY (relationship_name) REFERENCES relationship (relationship_name) ON DELETE CASCADE
);

CREATE TABLE attribute (
    attribute_name VARCHAR2(256),
    attrbiute_type VARCHAR2(100),
    parent_attribute VARCHAR2(256),
    derived_attribute VARCHAR2(256),
    CONSTRAINT attribute_name_pk PRIMARY KEY (attribute_name),
    CONSTRAINT attribute_attribute_fk FOREIGN KEY (parent_attribute) REFERENCES attribute (attribute_name) ON DELETE CASCADE,
    CONSTRAINT derived_attribute_fk FOREIGN KEY (derived_attribute) REFERENCES attribute (attribute_name) ON DELETE CASCADE
);

CREATE TABLE has_attrbiute (
    has_attribute_id    NUMERIC(10) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    entity_name         VARCHAR2(256) NOT NULL,
    attribute_name      VARCHAR2(256) NOT NULL,
    CONSTRAINT has_attribute_pk PRIMARY KEY (has_attribute_id),
    CONSTRAINT entity_has_attribute_fk FOREIGN KEY (entity_name) REFERENCES entity (entity_name) ON DELETE CASCADE,
    CONSTRAINT attribute_has_attribute_fk FOREIGN KEY (attribute_name) REFERENCES attribute (attribute_name) ON DELETE CASCADE
);

CREATE TABLE has_relationship_attribute (
    has_relationship_attribute_id    NUMERIC(10) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    relationship_name   VARCHAR2(256) NOT NULL,
    attribute_name      VARCHAR2(256) NOT NULL,
    CONSTRAINT has_relationship_attribute_id_pk PRIMARY KEY (has_relationship_attribute_id),
    CONSTRAINT relationship_has_relationship_attribute_fk FOREIGN KEY (relationship_name) REFERENCES relationship (relationship_name) ON DELETE CASCADE,
    CONSTRAINT attribute_has_relationship_attribute_fk FOREIGN KEY (attribute_name) REFERENCES attribute (attribute_name) ON DELETE CASCADE
);