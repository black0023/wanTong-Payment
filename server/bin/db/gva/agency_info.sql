create table agency_info
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)      null,
    updated_at datetime(3)      null,
    deleted_at datetime(3)      null,
    account    varchar(30)      null comment '代理账号',
    nick_name  varchar(30)      null comment '代理昵称',
    balance    double default 0 null comment '余额',
    enable     bigint default 1 null comment '启用'
);

create index idx_agency_info_deleted_at
    on agency_info (deleted_at);

INSERT INTO gva.agency_info (id, created_at, updated_at, deleted_at, account, nick_name, balance, enable) VALUES (1, '2024-08-06 13:20:22.553', '2024-08-06 13:21:57.059', null, 'testAgency', '测试代理', 1000000, 1);
