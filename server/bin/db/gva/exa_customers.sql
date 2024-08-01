create table exa_customers
(
    id                    bigint unsigned auto_increment
        primary key,
    created_at            datetime(3)     null,
    updated_at            datetime(3)     null,
    deleted_at            datetime(3)     null,
    customer_name         varchar(191)    null comment '客户名',
    customer_phone_data   varchar(191)    null comment '客户手机号',
    sys_user_id           bigint unsigned null comment '管理ID',
    sys_user_authority_id bigint unsigned null comment '管理角色ID'
);

create index idx_exa_customers_deleted_at
    on exa_customers (deleted_at);

INSERT INTO gva.exa_customers (id, created_at, updated_at, deleted_at, customer_name, customer_phone_data, sys_user_id, sys_user_authority_id) VALUES (1, '2024-08-01 15:24:37.977', '2024-08-01 15:24:37.977', null, '1', '1', 1, 888);
