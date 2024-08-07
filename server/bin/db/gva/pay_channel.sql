create table pay_channel
(
    id           bigint unsigned auto_increment
        primary key,
    created_at   datetime(3)      null,
    updated_at   datetime(3)      null,
    deleted_at   datetime(3)      null,
    channel_name varchar(50)      null comment '通道名称',
    product_id   varchar(20)      null comment '产品ID',
    template_id  varchar(20)      null comment '通道模板ID',
    payment_code varchar(20)      null comment '支付编码',
    amount_range varchar(200)     null comment '金额范围',
    fee          double           null comment '通道费率',
    remark       varchar(100)     null comment '备注',
    enable       bigint default 1 null comment '启用'
);

create index idx_pay_channel_deleted_at
    on pay_channel (deleted_at);

INSERT INTO gva.pay_channel (id, created_at, updated_at, deleted_at, channel_name, product_id, template_id, payment_code, amount_range, fee, remark, enable) VALUES (1, '2024-08-05 20:30:32.331', '2024-08-06 16:22:25.784', null, '测试通道1', '1', '1', '6666', '100-2000', 3, '', 1);
INSERT INTO gva.pay_channel (id, created_at, updated_at, deleted_at, channel_name, product_id, template_id, payment_code, amount_range, fee, remark, enable) VALUES (2, '2024-08-05 20:42:42.330', '2024-08-05 20:42:53.468', null, '测试通道2', '2', '1', '8888', '100,200,300', 10, '我是备注', 1);
INSERT INTO gva.pay_channel (id, created_at, updated_at, deleted_at, channel_name, product_id, template_id, payment_code, amount_range, fee, remark, enable) VALUES (3, '2024-08-05 21:49:35.810', '2024-08-05 21:49:35.810', null, '测试通道3', '1', '1', '555', '', 20, '', 1);
