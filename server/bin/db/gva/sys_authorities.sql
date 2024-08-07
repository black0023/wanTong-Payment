create table sys_authorities
(
    created_at     datetime(3)                      null,
    updated_at     datetime(3)                      null,
    deleted_at     datetime(3)                      null,
    authority_id   bigint unsigned auto_increment comment '角色ID'
        primary key,
    authority_name varchar(191)                     null comment '角色名',
    parent_id      bigint unsigned                  null comment '父角色ID',
    default_router varchar(191) default 'dashboard' null comment '默认菜单',
    constraint uni_sys_authorities_authority_id
        unique (authority_id)
);

INSERT INTO gva.sys_authorities (created_at, updated_at, deleted_at, authority_id, authority_name, parent_id, default_router) VALUES ('2024-07-25 12:18:13.451', '2024-08-07 10:37:35.010', null, 888, '普通用户', 0, 'dashboard');
INSERT INTO gva.sys_authorities (created_at, updated_at, deleted_at, authority_id, authority_name, parent_id, default_router) VALUES ('2024-07-25 12:18:13.451', '2024-07-25 12:18:13.639', null, 8881, '普通用户子角色', 888, 'dashboard');
INSERT INTO gva.sys_authorities (created_at, updated_at, deleted_at, authority_id, authority_name, parent_id, default_router) VALUES ('2024-07-25 12:18:13.451', '2024-07-25 12:18:13.635', null, 9528, '测试角色', 0, 'dashboard');
