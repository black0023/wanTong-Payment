create table merchant_info
(
    id         bigint unsigned auto_increment,
    created_at datetime(3)          null,
    updated_at datetime(3)          null,
    deleted_at datetime(3)          null,
    mch_no     varchar(20)          not null comment '商户号',
    mach_acc   varchar(50)          null comment '商户账号',
    nick_name  varchar(50)          null comment '昵称',
    agency_id  varchar(10)          null comment '上级代理',
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

INSERT INTO gva.merchant_info (id, created_at, updated_at, deleted_at, mch_no, mach_acc, nick_name, agency_id, remark, api_key, balance, enable, last_login, login_ip) VALUES (1, '2024-08-06 15:55:08.910', '2024-08-06 16:25:41.993', null, 'M16868351', 'testMch', '测试商户', '1', '', '11BE3BD1CC35CE52A3870C41BC8623CC', 99, 1, '2024-08-06 15:52:58.942', '');
INSERT INTO gva.merchant_info (id, created_at, updated_at, deleted_at, mch_no, mach_acc, nick_name, agency_id, remark, api_key, balance, enable, last_login, login_ip) VALUES (2, '2024-08-06 16:35:41.583', '2024-08-06 16:35:41.583', null, 'M16848665', 'testMch2', '测试商户2', '1', '', 'F486DC21AE9713ECA4F9ECDDA600E0EA', 1000, 1, null, '');
