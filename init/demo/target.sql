-- DROP SCHEMA messagehub;
CREATE SCHEMA messagehub AUTHORIZATION test001;
ALTER USER test001 IN DATABASE messagehub SET search_path to messagehub;

-- tbl_user
CREATE TABLE messagehub.tbl_user (
    id SERIAL NOT NULL,
    uuid VARCHAR(50) NULL,
    first_name VARCHAR(20) NULL,
    last_name VARCHAR(20) NULL,
    gender VARCHAR(10) NULL,
    mobile VARCHAR(20) NULL,
    email VARCHAR(50) NULL,
    opt_in BOOLEAN NOT NULL DEFAULT FALSE,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT tbl_user_pkey PRIMARY KEY (id),
    CONSTRAINT tbl_user_unique UNIQUE (mobile, uuid)
);
ALTER TABLE messagehub.tbl_user SET UNLOGGED;
-- ALTER TABLE tbl_user DROP CONSTRAINT tbl_user_pkey;
-- ALTER TABLE tbl_user DROP CONSTRAINT tbl_user_unique;

-- tbl_employee
CREATE TABLE messagehub.tbl_employee (
    id SERIAL NOT NULL,
    uuid VARCHAR(50) NULL,
    first_name VARCHAR(20) NULL,
    last_name VARCHAR(20) NULL,
    gender VARCHAR(10) NULL,
    mobile VARCHAR(20) NULL,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT tbl_employee_pkey PRIMARY KEY (id),
    CONSTRAINT tbl_employee_unique UNIQUE (mobile, uuid)
);
ALTER TABLE messagehub.tbl_employee SET UNLOGGED;
-- ALTER TABLE tbl_employee DROP CONSTRAINT tbl_employee_pkey;
-- ALTER TABLE tbl_employee DROP CONSTRAINT tbl_employee_unique;