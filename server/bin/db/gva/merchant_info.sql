create table merchant_info
(
    id         bigint unsigned auto_increment,
    created_at datetime(3)          null,
    updated_at datetime(3)          null,
    deleted_at datetime(3)          null,
    mch_no     varchar(20)          not null comment '商户号',
    mach_acc   varchar(50)          null comment '商户账号',
    password   varchar(128)         null comment '密码',
    nick_name  varchar(50)          null comment '昵称',
    remark     varchar(100)         null comment '备注',
    api_key    varchar(128)         null comment 'Api秘钥',
    balance    double     default 0 null comment '余额',
    enable     tinyint(1) default 1 null comment '启用',
    last_login datetime(3)          null comment '最后登录',
    login_ip   varchar(20)          null comment '登录IP',
    primary key (id, mch_no)
);

create index idx_merchant_info_deleted_at
    on merchant_info (deleted_at);

INSERT INTO gva.merchant_info (id, created_at, updated_at, deleted_at, mch_no, mach_acc, password, nick_name, remark, api_key, balance, enable, last_login, login_ip) VALUES (1, '2024-07-25 17:05:31.913', '2024-07-25 17:05:31.913', null, 'M16840303', 'testAcc', '$2a$10$spjq6PfMA3h27p0NqHZ85OYNQUWXDGjJs20uLMow45U0en1xj9ueW', 'test', '测试', 'fuck you', 0, 1, '2024-07-25 17:05:17.882', '');
