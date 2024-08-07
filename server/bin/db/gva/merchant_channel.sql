create table merchant_channel
(
    id          bigint unsigned auto_increment
        primary key,
    created_at  datetime(3) null,
    updated_at  datetime(3) null,
    deleted_at  datetime(3) null,
    mch_no      varchar(20) null comment '商户号',
    pay_channel varchar(20) null comment '支付通道',
    pay_code    varchar(20) null comment '通道编码',
    fee         double      null comment '通道费率',
    enable      bigint      null comment '启用'
);

create index idx_merchant_channel_deleted_at
    on merchant_channel (deleted_at);

INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (1, '2024-08-07 19:19:46.820', '2024-08-07 19:19:46.820', '2024-08-07 19:20:53.166', 'M16868351', '', '6666', 0, 2);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (2, '2024-08-07 19:20:53.181', '2024-08-07 19:20:53.181', '2024-08-07 19:30:08.954', 'M16868351', '', '6666', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (3, '2024-08-07 19:30:08.964', '2024-08-07 19:30:08.964', '2024-08-07 19:32:02.067', 'M16868351', '1', '6666', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (4, '2024-08-07 19:32:02.077', '2024-08-07 19:32:02.077', '2024-08-07 19:32:45.371', 'M16868351', '', '6666', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (5, '2024-08-07 19:32:45.377', '2024-08-07 19:32:45.377', '2024-08-07 19:33:39.763', 'M16868351', '1', '6666', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (6, '2024-08-07 19:33:39.769', '2024-08-07 19:56:48.436', '2024-08-07 20:06:18.203', 'M16868351', '1', '1003', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (7, '2024-08-07 19:33:49.576', '2024-08-07 19:58:54.322', null, 'M16848665', '2', '1002', 3, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (8, '2024-08-07 20:06:18.219', '2024-08-07 20:06:18.219', '2024-08-07 20:11:09.612', 'M16868351', '1', '', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (9, '2024-08-07 20:11:09.617', '2024-08-07 20:11:09.617', '2024-08-07 20:12:11.736', 'M16868351', '1', '1003', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (10, '2024-08-07 20:12:11.747', '2024-08-07 20:12:11.747', '2024-08-07 20:13:41.922', 'M16868351', '1', '1003', 10, 1);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (11, '2024-08-07 20:12:11.756', '2024-08-07 20:12:11.756', '2024-08-07 20:13:41.922', 'M16868351', '2', '1002', 0, 2);
INSERT INTO gva.merchant_channel (id, created_at, updated_at, deleted_at, mch_no, pay_channel, pay_code, fee, enable) VALUES (12, '2024-08-07 20:13:41.930', '2024-08-07 20:13:41.930', null, 'M16868351', '2', '1002', 0, 2);
