create table sys_dictionary_details
(
    id                bigint unsigned auto_increment
        primary key,
    created_at        datetime(3)     null,
    updated_at        datetime(3)     null,
    deleted_at        datetime(3)     null,
    label             varchar(191)    null comment '展示值',
    value             varchar(191)    null comment '字典值',
    extend            varchar(191)    null comment '扩展值',
    status            tinyint(1)      null comment '启用状态',
    sort              bigint          null comment '排序标记',
    sys_dictionary_id bigint unsigned null comment '关联标记'
);

create index idx_sys_dictionary_details_deleted_at
    on sys_dictionary_details (deleted_at);

INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (1, '2024-07-25 12:18:13.466', '2024-07-25 12:18:13.466', null, '男', '1', '', 1, 1, 1);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (2, '2024-07-25 12:18:13.466', '2024-07-25 12:18:13.466', null, '女', '2', '', 1, 2, 1);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (3, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'smallint', '1', 'mysql', 1, 1, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (4, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'mediumint', '2', 'mysql', 1, 2, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (5, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int', '3', 'mysql', 1, 3, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (6, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'bigint', '4', 'mysql', 1, 4, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (7, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int2', '5', 'pgsql', 1, 5, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (8, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int4', '6', 'pgsql', 1, 6, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (9, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int6', '7', 'pgsql', 1, 7, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (10, '2024-07-25 12:18:13.468', '2024-07-25 12:18:13.468', null, 'int8', '8', 'pgsql', 1, 8, 2);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (11, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'date', '', '', 1, 0, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (12, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'time', '1', 'mysql', 1, 1, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (13, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'year', '2', 'mysql', 1, 2, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (14, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'datetime', '3', 'mysql', 1, 3, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (15, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'timestamp', '5', 'mysql', 1, 5, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (16, '2024-07-25 12:18:13.470', '2024-07-25 12:18:13.470', null, 'timestamptz', '6', 'pgsql', 1, 5, 3);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (17, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'float', '', '', 1, 0, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (18, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'double', '1', 'mysql', 1, 1, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (19, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'decimal', '2', 'mysql', 1, 2, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (20, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'numeric', '3', 'pgsql', 1, 3, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (21, '2024-07-25 12:18:13.472', '2024-07-25 12:18:13.472', null, 'smallserial', '4', 'pgsql', 1, 4, 4);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (22, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'char', '', '', 1, 0, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (23, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'varchar', '1', 'mysql', 1, 1, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (24, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'tinyblob', '2', 'mysql', 1, 2, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (25, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'tinytext', '3', 'mysql', 1, 3, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (26, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'text', '4', 'mysql', 1, 4, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (27, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'blob', '5', 'mysql', 1, 5, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (28, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'mediumblob', '6', 'mysql', 1, 6, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (29, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'mediumtext', '7', 'mysql', 1, 7, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (30, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'longblob', '8', 'mysql', 1, 8, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (31, '2024-07-25 12:18:13.474', '2024-07-25 12:18:13.474', null, 'longtext', '9', 'mysql', 1, 9, 5);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (32, '2024-07-25 12:18:13.476', '2024-07-25 12:18:13.476', null, 'tinyint', '1', 'mysql', 1, 0, 6);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (33, '2024-07-25 12:18:13.476', '2024-07-25 12:18:13.476', null, 'bool', '2', 'pgsql', 1, 0, 6);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (34, '2024-08-01 14:19:16.121', '2024-08-01 16:51:34.019', null, '支付宝', '1', '', 1, 0, 7);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (35, '2024-08-01 14:19:25.523', '2024-08-01 16:51:39.193', null, '微信', '2', '', 1, 0, 7);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (36, '2024-08-01 14:19:38.071', '2024-08-01 16:51:45.681', null, '云闪付', '3', '', 1, 0, 7);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (37, '2024-08-01 14:25:49.873', '2024-08-01 16:52:02.183', null, '四方支付', '4', '', 1, 0, 7);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (38, '2024-08-01 16:50:46.994', '2024-08-01 16:52:15.882', null, 'MD5', '1', '', 1, 0, 8);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (39, '2024-08-01 16:50:55.208', '2024-08-01 16:52:20.459', null, 'RSA', '2', '', 1, 0, 8);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (40, '2024-08-01 16:55:12.601', '2024-08-01 16:55:12.601', null, 'JSON', '1', '', 1, 0, 9);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (41, '2024-08-01 16:55:19.636', '2024-08-01 16:55:19.636', null, 'FORM', '2', '', 1, 0, 9);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (42, '2024-08-01 17:12:09.930', '2024-08-01 17:12:09.930', null, '商户号', '1', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (43, '2024-08-01 17:13:40.976', '2024-08-01 17:14:47.139', null, '签名', '2', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (44, '2024-08-01 17:14:03.462', '2024-08-01 17:14:03.462', null, 'AppID', '3', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (45, '2024-08-01 17:15:12.916', '2024-08-01 17:15:12.916', '2024-08-01 17:16:04.917', '下单地址', '4', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (46, '2024-08-01 17:15:24.671', '2024-08-01 17:15:24.671', '2024-08-01 17:16:06.934', '查单地址', '5', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (47, '2024-08-01 17:15:55.959', '2024-08-01 17:16:11.784', null, '金额', '4', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (48, '2024-08-01 17:16:38.627', '2024-08-01 17:16:38.627', null, '商户订单号', '5', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (49, '2024-08-01 17:16:54.217', '2024-08-01 17:16:54.217', null, '三方订单号', '6', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (50, '2024-08-01 17:17:42.608', '2024-08-01 17:17:42.608', null, '商品标题', '7', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (51, '2024-08-01 17:17:54.055', '2024-08-01 17:17:54.055', null, '商品描述', '8', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (52, '2024-08-01 17:18:09.620', '2024-08-01 17:18:09.620', null, '回调地址', '9', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (53, '2024-08-01 17:19:41.062', '2024-08-01 17:19:41.062', null, '跳转地址', '10', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (54, '2024-08-01 17:25:06.782', '2024-08-01 17:25:06.782', null, '固定值', '11', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (55, '2024-08-01 17:36:59.408', '2024-08-01 17:36:59.408', null, '返回编码', '12', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (56, '2024-08-01 17:37:12.505', '2024-08-01 17:37:12.505', null, '返回信息', '13', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (57, '2024-08-01 17:37:22.864', '2024-08-01 17:37:22.864', null, '支付链接', '14', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (58, '2024-08-01 17:38:13.160', '2024-08-01 17:38:13.160', null, '字符串', '1', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (59, '2024-08-01 17:38:22.610', '2024-08-01 17:38:22.610', null, '整型', '2', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (60, '2024-08-01 17:38:35.626', '2024-08-01 17:38:35.626', null, '浮点型', '3', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (61, '2024-08-01 17:38:52.061', '2024-08-01 17:38:52.061', null, '布尔型', '4', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (62, '2024-08-01 17:39:26.233', '2024-08-01 17:39:26.233', null, '日期', '5', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (63, '2024-08-01 17:39:37.130', '2024-08-01 17:39:37.130', null, '日期时间', '6', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (64, '2024-08-01 17:40:02.169', '2024-08-01 17:40:02.169', null, '时间戳(秒)', '7', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (65, '2024-08-01 17:40:12.227', '2024-08-01 17:40:12.227', null, '时间戳(毫秒)', '8', '', 1, 0, 12);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (66, '2024-08-01 17:41:09.349', '2024-08-01 17:41:09.349', null, '订单状态', '15', '', 1, 0, 10);
INSERT INTO gva.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (67, '2024-08-01 17:41:25.322', '2024-08-01 17:41:25.322', null, '时间', '16', '', 1, 0, 10);
