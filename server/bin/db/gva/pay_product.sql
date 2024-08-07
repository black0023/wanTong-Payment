create table pay_product
(
    id            bigint unsigned auto_increment
        primary key,
    created_at    datetime(3)      null,
    updated_at    datetime(3)      null,
    deleted_at    datetime(3)      null,
    pay_name      varchar(128)     null comment '产品名称',
    pay_code      varchar(128)     null comment '产品编码',
    enable        bigint default 1 null comment '启用',
    fee           double           null comment '通道费率',
    created_by    bigint unsigned  null comment '创建者',
    updated_by    bigint unsigned  null comment '更新者',
    deleted_by    bigint unsigned  null comment '删除者',
    channel_count bigint           null
);

create index idx_pay_product_deleted_at
    on pay_product (deleted_at);

INSERT INTO gva.pay_product (id, created_at, updated_at, deleted_at, pay_name, pay_code, enable, fee, created_by, updated_by, deleted_by, channel_count) VALUES (1, '2024-08-01 15:37:47.009', '2024-08-05 21:18:56.838', null, '支付宝原生内层', '1003', 1, 1.03, 1, 1, 0, null);
INSERT INTO gva.pay_product (id, created_at, updated_at, deleted_at, pay_name, pay_code, enable, fee, created_by, updated_by, deleted_by, channel_count) VALUES (2, '2024-08-05 20:41:57.895', '2024-08-05 20:54:09.385', null, '支付宝原生全层', '1002', 1, 1, 1, 1, 0, null);
