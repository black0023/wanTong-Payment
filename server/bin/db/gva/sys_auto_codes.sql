create table sys_auto_codes
(
    id           bigint unsigned auto_increment
        primary key,
    created_at   datetime(3)  null,
    updated_at   datetime(3)  null,
    deleted_at   datetime(3)  null,
    package_name varchar(191) null comment '包名',
    label        varchar(191) null comment '展示名',
    `desc`       varchar(191) null comment '描述'
);

create index idx_sys_auto_codes_deleted_at
    on sys_auto_codes (deleted_at);

INSERT INTO gva.sys_auto_codes (id, created_at, updated_at, deleted_at, package_name, label, `desc`) VALUES (1, '2024-07-25 15:42:02.538', '2024-07-25 15:42:02.538', null, 'merchant', 'merchant', '商户模块');
INSERT INTO gva.sys_auto_codes (id, created_at, updated_at, deleted_at, package_name, label, `desc`) VALUES (2, '2024-08-01 15:15:11.119', '2024-08-01 15:15:11.119', null, 'payment', 'payment', '支付模块');
