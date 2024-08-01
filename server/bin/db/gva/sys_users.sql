create table sys_users
(
    id           bigint unsigned auto_increment
        primary key,
    created_at   datetime(3)                                                              null,
    updated_at   datetime(3)                                                              null,
    deleted_at   datetime(3)                                                              null,
    uuid         varchar(191)                                                             null comment '用户UUID',
    username     varchar(191)                                                             null comment '用户登录名',
    password     varchar(191)                                                             null comment '用户登录密码',
    nick_name    varchar(191)    default '系统用户'                                       null comment '用户昵称',
    side_mode    varchar(191)    default 'dark'                                           null comment '用户侧边主题',
    header_img   varchar(191)    default 'https://qmplusimg.henrongyi.top/gva_header.jpg' null comment '用户头像',
    base_color   varchar(191)    default '#fff'                                           null comment '基础颜色',
    authority_id bigint unsigned default 888                                              null comment '用户角色ID',
    phone        varchar(191)                                                             null comment '用户手机号',
    email        varchar(191)                                                             null comment '用户邮箱',
    enable       bigint          default 1                                                null comment '用户是否被冻结 1正常 2冻结'
);

create index idx_sys_users_deleted_at
    on sys_users (deleted_at);

create index idx_sys_users_username
    on sys_users (username);

create index idx_sys_users_uuid
    on sys_users (uuid);

INSERT INTO gva.sys_users (id, created_at, updated_at, deleted_at, uuid, username, password, nick_name, side_mode, header_img, base_color, authority_id, phone, email, enable) VALUES (1, '2024-07-25 12:18:13.623', '2024-08-01 17:50:13.875', null, '52517759-3d4b-41d7-af52-a67a21048542', 'admin', '$2a$10$cAPF81zgbTJi3xwjz/P07OfBIa/XO284FXJ8iRQmKPCrE6oVvp3eu', '超管', 'dark', 'https://qmplusimg.henrongyi.top/gva_header.jpg', '#fff', 888, '17611111111', '333333333@qq.com', 1);
INSERT INTO gva.sys_users (id, created_at, updated_at, deleted_at, uuid, username, password, nick_name, side_mode, header_img, base_color, authority_id, phone, email, enable) VALUES (2, '2024-07-25 12:18:13.623', '2024-08-01 15:47:30.169', null, '4c4bb57f-7722-4961-9323-5e0aaf8d55f0', 'a303176530', '$2a$10$GdVMGiYgy2Bv5E1zdE17buLLK7Yy0.aBwjLzzwF3Jfxi.aUHjd1Gi', '用户1', 'dark', 'https:///qmplusimg.henrongyi.top/1572075907logo.png', '#fff', 888, '17611111111', '333333333@qq.com', 2);
