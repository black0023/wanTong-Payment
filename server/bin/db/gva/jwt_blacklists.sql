create table jwt_blacklists
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3) null,
    updated_at datetime(3) null,
    deleted_at datetime(3) null,
    jwt        text        null comment 'jwt'
);

create index idx_jwt_blacklists_deleted_at
    on jwt_blacklists (deleted_at);

