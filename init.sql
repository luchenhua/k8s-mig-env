CREATE TABLE tbl_user (
    id SERIAL NOT NULL,
    uuid VARCHAR(50) NULL,
    first_name VARCHAR(20) NULL,
    last_name VARCHAR(20) NULL,
    gender VARCHAR(10) NULL,
    mobile VARCHAR(20) NULL,
    email VARCHAR(50) NULL,
    opt_in SMALLINT,
    is_deleted SMALLINT,
    CONSTRAINT tbl_user_pkey PRIMARY KEY (id),
    CONSTRAINT tbl_user_unique UNIQUE (mobile, uuid)
);
ALTER TABLE tbl_user
SET UNLOGGED;
ALTER TABLE tbl_user DROP CONSTRAINT tbl_user_pkey;
ALTER TABLE tbl_user DROP CONSTRAINT tbl_user_unique;