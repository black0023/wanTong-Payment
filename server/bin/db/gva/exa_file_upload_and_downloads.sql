create table exa_file_upload_and_downloads
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)  null,
    updated_at datetime(3)  null,
    deleted_at datetime(3)  null,
    name       varchar(191) null comment '文件名',
    url        varchar(191) null comment '文件地址',
    tag        varchar(191) null comment '文件标签',
    `key`      varchar(191) null comment '编号'
);

create index idx_exa_file_upload_and_downloads_deleted_at
    on exa_file_upload_and_downloads (deleted_at);

INSERT INTO gva.exa_file_upload_and_downloads (id, created_at, updated_at, deleted_at, name, url, tag, `key`) VALUES (1, '2024-07-25 12:18:13.641', '2024-07-25 12:18:13.641', null, '10.png', 'https://qmplusimg.henrongyi.top/gvalogo.png', 'png', '158787308910.png');
INSERT INTO gva.exa_file_upload_and_downloads (id, created_at, updated_at, deleted_at, name, url, tag, `key`) VALUES (2, '2024-07-25 12:18:13.641', '2024-07-25 12:18:13.641', null, 'logo.png', 'https://qmplusimg.henrongyi.top/1576554439myAvatar.png', 'png', '1587973709logo.png');
