-- tbl_user
CREATE TABLE tbl_user (
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
ALTER TABLE tbl_user
SET UNLOGGED;
ALTER TABLE tbl_user DROP CONSTRAINT tbl_user_pkey;
ALTER TABLE tbl_user DROP CONSTRAINT tbl_user_unique;
-- tbl_employee
CREATE TABLE tbl_employee (
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
ALTER TABLE tbl_employee
SET UNLOGGED;
ALTER TABLE tbl_employee DROP CONSTRAINT tbl_employee_pkey;
ALTER TABLE tbl_employee DROP CONSTRAINT tbl_employee_unique;