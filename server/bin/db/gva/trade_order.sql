create table trade_order
(
    id             bigint unsigned auto_increment
        primary key,
    created_at     datetime(3)  null,
    updated_at     datetime(3)  null,
    deleted_at     datetime(3)  null,
    mch_no         varchar(20)  null comment '商户号',
    mch_name       varchar(30)  null comment '商户名',
    platform_order varchar(50)  null comment '平台订单号',
    merchant_order varchar(50)  null comment '商户订单号',
    product_id     varchar(10)  null comment '支付产品',
    product_code   varchar(10)  null comment '产品编码',
    channel_id     varchar(10)  null comment '通道ID',
    channel_code   varchar(10)  null comment '通道编码',
    amount         bigint       null comment '金额',
    status         varchar(191) null comment '订单状态',
    notify_url     text         null comment '回调地址',
    return_url     text         null comment '跳转地址',
    ext_param      text         null comment '扩展参数',
    success_time   datetime(3)  null comment '成功时间',
    callback_time  datetime(3)  null comment '回调时间',
    callback_count bigint       null comment '回调次数',
    subject_tit    varchar(50)  null comment '商品标题',
    subject_desc   varchar(100) null comment '商品描述'
);

create index idx_trade_order_deleted_at
    on trade_order (deleted_at);

