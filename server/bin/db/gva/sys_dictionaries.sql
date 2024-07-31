create table sys_dictionaries
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)  null,
    updated_at datetime(3)  null,
    deleted_at datetime(3)  null,
    name       varchar(191) null comment '字典名（中）',
    type       varchar(191) null comment '字典名（英）',
    status     tinyint(1)   null comment '状态',
    `desc`     varchar(191) null comment '描述'
);

create index idx_sys_dictionaries_deleted_at
    on sys_dictionaries (deleted_at);

INSERT INTO gva.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (1, '2024-07-25 12:18:13.463', '2024-07-25 12:18:13.465', null, '性别', 'gender', 1, '性别字典');
INSERT INTO gva.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (2, '2024-07-25 12:18:13.463', '2024-07-25 12:18:13.467', null, '数据库int类型', 'int', 1, 'int类型对应的数据库类型');
INSERT INTO gva.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (3, '2024-07-25 12:18:13.463', '2024-07-25 12:18:13.470', null, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型');
INSERT INTO gva.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (4, '2024-07-25 12:18:13.463', '2024-07-25 12:18:13.472', null, '数据库浮点型', 'float64', 1, '数据库浮点型');
INSERT INTO gva.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (5, '2024-07-25 12:18:13.463', '2024-07-25 12:18:13.474', null, '数据库字符串', 'string', 1, '数据库字符串');
INSERT INTO gva.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (6, '2024-07-25 12:18:13.463', '2024-07-25 12:18:13.476', null, '数据库bool类型', 'bool', 1, '数据库bool类型');
INSERT INTO gva.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (7, '2024-07-25 15:47:41.062', '2024-07-25 15:47:41.062', null, '通道类型', 'channelType', 1, '通道类型');
