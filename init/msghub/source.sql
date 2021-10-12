-- DROP SCHEMA messagehub;
CREATE SCHEMA messagehub AUTHORIZATION test001;
ALTER USER test001 IN DATABASE messagehub SET search_path to messagehub;

-- messagehub.logs_table definition
-- Drop table
-- DROP TABLE messagehub.logs_table;
CREATE TABLE messagehub.logs_table (
    id uuid NOT NULL,
    created_at timestamp NULL,
    updated_at timestamp NULL,
    communication_channel varchar(255) NOT NULL,
    email varchar(255) NULL,
    event_code varchar(255) NOT NULL,
    event_name varchar(255) NOT NULL,
    event_parameters jsonb NULL,
    mobile_no varchar(255) NULL,
    we_chat_open_id varchar(255) NULL,
    sequence_id varchar(255) NOT NULL,
    status varchar(255) NOT NULL,
    system_id varchar(255) NOT NULL,
    template_id varchar(255) NULL,
    ref_sequence_id varchar(255) NULL,
    CONSTRAINT logs_table_pkey PRIMARY KEY (id),
    CONSTRAINT ref_sequence_id_index UNIQUE (ref_sequence_id),
    CONSTRAINT sequence_id_index UNIQUE (sequence_id)
);
CREATE INDEX communication_channel_index ON messagehub.logs_table USING btree (communication_channel);
CREATE INDEX created_at_index ON messagehub.logs_table USING brin (created_at);
CREATE INDEX created_index ON messagehub.logs_table USING btree (created_at);
CREATE INDEX email_index ON messagehub.logs_table USING btree (email);
CREATE INDEX event_code_index ON messagehub.logs_table USING btree (event_code);
CREATE INDEX event_name_index ON messagehub.logs_table USING btree (event_name);
CREATE INDEX mobile_index ON messagehub.logs_table USING btree (mobile_no);
CREATE INDEX mobile_no_index ON messagehub.logs_table USING btree (mobile_no);
CREATE INDEX open_id_index ON messagehub.logs_table USING btree (we_chat_open_id);
CREATE INDEX status_index ON messagehub.logs_table USING btree (status);
CREATE INDEX system_id_index ON messagehub.logs_table USING btree (system_id);
CREATE INDEX template_id_index ON messagehub.logs_table USING btree (template_id);
CREATE INDEX we_chat_open_id_index ON messagehub.logs_table USING btree (we_chat_open_id);

-- messagehub.tbl_event_type definition
-- Drop table
-- DROP TABLE messagehub.tbl_event_type;
CREATE TABLE messagehub.tbl_event_type (
    uuid varchar(255) NOT NULL,
    country_code varchar(255) NULL,
    creator varchar(255) NULL,
    enable_status int4 NULL,
    event_code varchar(255) NOT NULL,
    event_name varchar(255) NULL,
    event_param jsonb NULL,
    gmt_created timestamp NULL,
    gmt_modified timestamp NULL,
    is_deleted int4 NULL,
    modifier varchar(255) NULL,
    notify_url varchar(255) NULL,
    remark varchar(255) NULL,
    sequence_id varchar(255) NOT NULL,
    system_id varchar(255) NULL,
    CONSTRAINT tbl_event_type_pkey PRIMARY KEY (uuid),
    CONSTRAINT uk_ph89fdc0hijhadxhnccg9aso1 UNIQUE (event_code),
    CONSTRAINT uk_tqn3ixxx73j9efpwyv81ty6t1 UNIQUE (sequence_id)
);
CREATE INDEX index_tbl_event_type_event_code ON messagehub.tbl_event_type USING btree (event_code);
CREATE INDEX index_tbl_event_type_system_id ON messagehub.tbl_event_type USING btree (system_id);
CREATE INDEX index_tbl_event_type_uuid ON messagehub.tbl_event_type USING btree (uuid);
CREATE INDEX tbl_event_type_indexes ON messagehub.tbl_event_type USING btree (uuid, event_code, system_id);

-- messagehub.tbl_subscription definition
-- Drop table
-- DROP TABLE messagehub.tbl_subscription;
CREATE TABLE messagehub.tbl_subscription (
    id serial NOT NULL,
    uuid varchar(50) NULL,
    person_id varchar(50) NULL,
    subscription_times int4 NULL DEFAULT 1,
    biz_ref_id varchar(50) NULL,
    system_id varchar(30) NULL,
    subscribe_channel int4 NULL,
    template_id varchar(50) NULL,
    template_type int4 NULL,
    user_id varchar(50) NULL,
    expire_time timestamp NULL,
    created_time timestamp NULL DEFAULT now(),
    details jsonb NULL,
    app_id varchar(50) NULL,
    CONSTRAINT tbl_subscription_pk PRIMARY KEY (id),
    CONSTRAINT tbl_subscription_un UNIQUE (
        person_id,
        biz_ref_id,
        system_id,
        template_id,
        user_id,
        app_id
    )
);

-- messagehub.tbl_subscription_archieve definition
-- Drop table
-- DROP TABLE messagehub.tbl_subscription_archieve;
CREATE TABLE messagehub.tbl_subscription_archieve (
    id serial NOT NULL,
    uuid varchar(50) NULL,
    person_id varchar(50) NULL,
    subscription_times int4 NULL DEFAULT 1,
    biz_ref_id varchar(50) NULL,
    system_id varchar(30) NULL,
    subscribe_channel int4 NULL,
    template_id varchar(50) NULL,
    template_type int4 NULL,
    user_id varchar(50) NULL,
    expire_time timestamp NULL,
    created_time timestamp NULL DEFAULT now(),
    details jsonb NULL,
    app_id varchar(50) NULL,
    CONSTRAINT tbl_subscription_archieve_pk PRIMARY KEY (id),
    CONSTRAINT tbl_subscription_archieve_un UNIQUE (
        person_id,
        biz_ref_id,
        system_id,
        template_id,
        user_id,
        app_id
    )
);

-- messagehub.tbl_template_email definition
-- Drop table
-- DROP TABLE messagehub.tbl_template_email;
CREATE TABLE messagehub.tbl_template_email (
    uuid varchar(255) NOT NULL,
    "attributes" jsonb NULL,
    communication_channel varchar(255) NULL,
    "content" varchar(255) NULL,
    country_code varchar(255) NULL,
    document_name varchar(255) NULL,
    document_url varchar(255) NULL,
    edm_channel varchar(255) NULL,
    event_code varchar(255) NULL,
    event_name varchar(255) NULL,
    event_type varchar(255) NULL,
    gmt_created timestamp NULL,
    gmt_modified timestamp NULL,
    is_deleted int4 NULL,
    language_code varchar(255) NULL,
    last_effective_time timestamp NULL,
    modifier varchar(255) NULL,
    start_effective_time timestamp NULL,
    subject varchar(255) NULL,
    CONSTRAINT tbl_template_email_pkey PRIMARY KEY (uuid)
);
CREATE INDEX index_tbl_template_email_event_code ON messagehub.tbl_template_email USING btree (event_code);
CREATE INDEX index_tbl_template_email_uuid ON messagehub.tbl_template_email USING btree (uuid);
CREATE INDEX tbl_template_email_indexes ON messagehub.tbl_template_email USING btree (uuid, event_code);

-- messagehub.tbl_template_sms definition
-- Drop table
-- DROP TABLE messagehub.tbl_template_sms;
CREATE TABLE messagehub.tbl_template_sms (
    uuid varchar(255) NOT NULL,
    "attributes" jsonb NULL,
    channel varchar(255) NULL,
    communication_channel varchar(255) NULL,
    "content" varchar(255) NULL,
    country_code varchar(255) NULL,
    creator varchar(255) NULL,
    event_code varchar(255) NULL,
    event_name varchar(255) NULL,
    event_type varchar(255) NULL,
    gmt_created timestamp NULL,
    gmt_modified timestamp NULL,
    is_deleted int4 NULL,
    language_code varchar(255) NULL,
    last_effective_time timestamp NULL,
    modifier varchar(255) NULL,
    start_effective_time timestamp NULL,
    CONSTRAINT tbl_template_sms_pkey PRIMARY KEY (uuid)
);
CREATE INDEX index_tbl_template_sms_event_code ON messagehub.tbl_template_sms USING btree (event_code);
CREATE INDEX index_tbl_template_sms_uuid ON messagehub.tbl_template_sms USING btree (uuid);
CREATE INDEX tbl_template_sms_indexes ON messagehub.tbl_template_sms USING btree (uuid, event_code);

-- messagehub.tbl_template_wechat definition
-- Drop table
-- DROP TABLE messagehub.tbl_template_wechat;
CREATE TABLE messagehub.tbl_template_wechat (
    id serial NOT NULL,
    uuid varchar(50) NULL,
    official_account varchar(30) NULL,
    subject varchar(30) NULL,
    "content" varchar(255) NULL,
    card_connection varchar(30) NULL,
    small_routine varchar(30) NULL,
    page_path varchar(100) NULL,
    remark varchar(255) NULL,
    start_effective_time timestamp NULL,
    last_effective_time timestamp NULL,
    gmt_created timestamp NULL,
    creator varchar(30) NULL,
    gmt_modified timestamp NULL,
    modifier varchar(30) NULL,
    is_deleted int2 NULL,
    event_code varchar(50) NULL,
    event_name varchar(50) NULL,
    country_code varchar(10) NULL,
    language_code varchar(10) NULL,
    communication_channel varchar(10) NULL,
    "attributes" jsonb NULL,
    event_type varchar(255) NULL,
    CONSTRAINT tbl_template_wechat_pkey PRIMARY KEY (id)
);
CREATE INDEX index_tbl_template_wechat_event_code ON messagehub.tbl_template_wechat USING btree (event_code);
CREATE INDEX index_tbl_template_wechat_uuid ON messagehub.tbl_template_wechat USING btree (uuid);
CREATE INDEX tbl_template_wechat_indexes ON messagehub.tbl_template_wechat USING btree (uuid, event_code);
