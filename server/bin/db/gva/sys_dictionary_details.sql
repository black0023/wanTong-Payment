create table sys_dictionary_details
(
    id                bigint unsigned auto_increment
        primary key,
    created_at        datetime(3)     null,
    updated_at        datetime(3)     null,
    deleted_at        datetime(3)     null,
    label             varchar(191)    null comment '展示值',
    value             varchar(191)    null comment '字典值',
    extend            varchar(191)    null comment '扩展值',
    status            tinyint(1)      null comment '启用状态',
    sort              bigint          null comment '排序标记',
    sys_dictionary_id bigint unsigned null comment '关联标记'
);

create index idx_sys_dictionary_details_deleted_at
    on sys_dictionary_details (deleted_at);

INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (1, '2024-07-25 12:18:13.466', '2024-07-25 12:18:13.466', null, '男', '1', '', 1, 1, 1);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (2, '2024-07-25 12:18:13.466', '2024-07-25 12:18:13.466', null, '女', '2', '', 1, 2, 1);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (3, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'smallint', '1', 'mysql', 1, 1, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (4, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'mediumint', '2', 'mysql', 1, 2, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (5, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int', '3', 'mysql', 1, 3, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (6, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'bigint', '4', 'mysql', 1, 4, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (7, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int2', '5', 'pgsql', 1, 5, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (8, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int4', '6', 'pgsql', 1, 6, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (9, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int6', '7', 'pgsql', 1, 7, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (10, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int8', '8', 'pgsql', 1, 8, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (11, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'date', '', '', 1, 0, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (12, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'time', '1', 'mysql', 1, 1, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (13, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'year', '2', 'mysql', 1, 2, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (14, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'datetime', '3', 'mysql', 1, 3, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (15, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'timestamp', '5', 'mysql', 1, 5, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (16, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'timestamptz', '6', 'pgsql', 1, 5, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (17, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'float', '', '', 1, 0, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (18, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'double', '1', 'mysql', 1, 1, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (19, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'decimal', '2', 'mysql', 1, 2, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (20, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'numeric', '3', 'pgsql', 1, 3, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (21, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'smallserial', '4', 'pgsql', 1, 4, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (22, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'char', '', '', 1, 0, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (23, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'varchar', '1', 'mysql', 1, 1, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (24, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'tinyblob', '2', 'mysql', 1, 2, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (25, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'tinytext', '3', 'mysql', 1, 3, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (26, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'text', '4', 'mysql', 1, 4, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (27, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'blob', '5', 'mysql', 1, 5, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (28, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'mediumblob', '6', 'mysql', 1, 6, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (29, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'mediumtext', '7', 'mysql', 1, 7, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (30, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'longblob', '8', 'mysql', 1, 8, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (31, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'longtext', '9', 'mysql', 1, 9, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (32, '2024-07-25 12:18:13.476', '2024-07-25 12:18:13.476', null, 'tinyint', '1', 'mysql', 1, 0, 6);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (33, '2024-07-25 12:18:13.476', '2024-07-25 12:18:13.476', null, 'bool', '2', 'pgsql', 1, 0, 6);
