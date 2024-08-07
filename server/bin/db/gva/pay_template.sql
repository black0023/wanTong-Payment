create table pay_template
(
    id              bigint unsigned auto_increment
        primary key,
    created_at      datetime(3)  null,
    updated_at      datetime(3)  null,
    deleted_at      datetime(3)  null,
    template_name   varchar(50)  null comment '模板名称',
    mch_no          varchar(50)  null comment '商户号',
    mch_acc         varchar(50)  null comment '商户登录账号',
    `app-Id`        varchar(128) null comment 'AppId',
    sign_type       varchar(191) null comment '签名类型',
    md5_key         varchar(128) null comment 'MD5秘钥',
    rsa_pub         varchar(512) null comment 'RSA公钥',
    rsa_priv        varchar(512) null comment 'RSA私钥',
    order_url       varchar(256) null comment '下单接口',
    query_url       varchar(256) null comment '查单接口',
    callback_ip     varchar(128) null comment '回调IP',
    subject_title   varchar(50)  null comment '商品标题',
    subject_desc    varchar(50)  null comment '商品描述',
    remark          varchar(128) null comment '备注',
    success_status  varchar(20)  null comment '订单成功编码',
    callback_str    varchar(20)  null comment '订单成功返回',
    request_type    varchar(191) null comment '调用类型',
    callback_type   varchar(191) null comment '回调类型',
    order_fields    text         null comment '下单参数',
    query_fields    text         null comment '查单参数',
    callback_fields text         null comment '回调参数',
    order_response  text         null comment '下单返回参数',
    query_response  text         null comment '查单返回参数',
    amount_type     varchar(191) null comment '金额类型'
);

create index idx_pay_template_deleted_at
    on pay_template (deleted_at);

INSERT INTO gva.pay_template (id, created_at, updated_at, deleted_at, template_name, mch_no, mch_acc, `app-Id`, sign_type, md5_key, rsa_pub, rsa_priv, order_url, query_url, callback_ip, subject_title, subject_desc, remark, success_status, callback_str, request_type, callback_type, order_fields, query_fields, callback_fields, order_response, query_response, amount_type) VALUES (1, '2024-08-05 17:04:03.730', '2024-08-05 17:04:03.730', null, '测试商户', 'M15389529441', 'wantong888', '', '1', '842f93b8-d051-4f72-a3ed-ae6f8ed00020', '', '', 'https://fsapi.yishang8.xyz/api/pay_in/create_order', 'https://fsapi.yishang8.xyz/api/pay_in/query_order', '146.190.98.243', '', '', '', '1', 'success', '1', '1', '[{"paramType":"1","fieldType":"1","fieldName":"mchNo","fieldValue":""},{"paramType":"4","fieldType":"2","fieldName":"amount","fieldValue":""},{"paramType":"2","fieldType":"1","fieldName":"sign","fieldValue":""}]', '[]', '[]', '[]', '[]', '1');
