create table sys_base_menus
(
    id           bigint unsigned auto_increment
        primary key,
    created_at   datetime(3)     null,
    updated_at   datetime(3)     null,
    deleted_at   datetime(3)     null,
    menu_level   bigint unsigned null,
    parent_id    bigint unsigned null comment '父菜单ID',
    path         varchar(191)    null comment '路由path',
    name         varchar(191)    null comment '路由name',
    hidden       tinyint(1)      null comment '是否在列表隐藏',
    component    varchar(191)    null comment '对应前端文件路径',
    sort         bigint          null comment '排序标记',
    active_name  varchar(191)    null comment '附加属性',
    keep_alive   tinyint(1)      null comment '附加属性',
    default_menu tinyint(1)      null comment '附加属性',
    title        varchar(191)    null comment '附加属性',
    icon         varchar(191)    null comment '附加属性',
    close_tab    tinyint(1)      null comment '附加属性'
);

create index idx_sys_base_menus_deleted_at
    on sys_base_menus (deleted_at);

INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (1, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'dashboard', 'dashboard', 0, 'view/dashboard/index.vue', 1, '', 0, 0, '仪表盘', 'odometer', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (2, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'about', 'about', 0, 'view/about/index.vue', 9, '', 0, 0, '关于我们', 'info-filled', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (3, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'admin', 'superAdmin', 0, 'view/superAdmin/index.vue', 3, '', 0, 0, '超级管理员', 'user', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (4, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 3, 'authority', 'authority', 0, 'view/superAdmin/authority/authority.vue', 1, '', 0, 0, '角色管理', 'avatar', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (5, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 3, 'menu', 'menu', 0, 'view/superAdmin/menu/menu.vue', 2, '', 1, 0, '菜单管理', 'tickets', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (6, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 3, 'api', 'api', 0, 'view/superAdmin/api/api.vue', 3, '', 1, 0, 'api管理', 'platform', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (7, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 3, 'user', 'user', 0, 'view/superAdmin/user/user.vue', 4, '', 0, 0, '用户管理', 'coordinate', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (8, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 3, 'dictionary', 'dictionary', 0, 'view/superAdmin/dictionary/sysDictionary.vue', 5, '', 0, 0, '字典管理', 'notebook', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (9, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 3, 'operation', 'operation', 0, 'view/superAdmin/operation/sysOperationRecord.vue', 6, '', 0, 0, '操作历史', 'pie-chart', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (10, '2024-07-25 12:18:13.478', '2024-08-05 17:58:19.264', null, 0, 0, 'person', 'person', 0, 'view/person/person.vue', 4, '', 0, 0, '个人信息', 'message', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (11, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'example', 'example', 0, 'view/example/index.vue', 7, '', 0, 0, '示例文件', 'management', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (12, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 11, 'upload', 'upload', 0, 'view/example/upload/upload.vue', 5, '', 0, 0, '媒体库（上传下载）', 'upload', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (13, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 11, 'breakpoint', 'breakpoint', 0, 'view/example/breakpoint/breakpoint.vue', 6, '', 0, 0, '断点续传', 'upload-filled', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (14, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 11, 'customer', 'customer', 0, 'view/example/customer/customer.vue', 7, '', 0, 0, '客户列表（资源示例）', 'avatar', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (15, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'systemTools', 'systemTools', 0, 'view/systemTools/index.vue', 5, '', 0, 0, '系统工具', 'tools', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (16, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 15, 'autoCode', 'autoCode', 0, 'view/systemTools/autoCode/index.vue', 1, '', 1, 0, '代码生成器', 'cpu', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (17, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 15, 'formCreate', 'formCreate', 0, 'view/systemTools/formCreate/index.vue', 2, '', 1, 0, '表单生成器', 'magic-stick', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (18, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 15, 'system', 'system', 0, 'view/systemTools/system/system.vue', 3, '', 0, 0, '系统配置', 'operation', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (19, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 15, 'autoCodeAdmin', 'autoCodeAdmin', 0, 'view/systemTools/autoCodeAdmin/index.vue', 1, '', 0, 0, '自动化代码管理', 'magic-stick', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (20, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 15, 'autoCodeEdit/:id', 'autoCodeEdit', 1, 'view/systemTools/autoCode/index.vue', 0, '', 0, 0, '自动化代码-${id}', 'magic-stick', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (21, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 15, 'autoPkg', 'autoPkg', 0, 'view/systemTools/autoPkg/autoPkg.vue', 0, '', 0, 0, '自动化package', 'folder', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (22, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'https://www.gin-vue-admin.com', 'https://www.gin-vue-admin.com', 0, '/', 0, '', 0, 0, '官方网站', 'customer-gva', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (23, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'state', 'state', 0, 'view/system/state.vue', 8, '', 0, 0, '服务器状态', 'cloudy', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (24, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 0, 'plugin', 'plugin', 0, 'view/routerHolder.vue', 6, '', 0, 0, '插件系统', 'cherry', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (25, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 24, 'https://plugin.gin-vue-admin.com/', 'https://plugin.gin-vue-admin.com/', 0, 'https://plugin.gin-vue-admin.com/', 0, '', 0, 0, '插件市场', 'shop', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (26, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 24, 'installPlugin', 'installPlugin', 0, 'view/systemTools/installPlugin/index.vue', 1, '', 0, 0, '插件安装', 'box', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (27, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 24, 'autoPlug', 'autoPlug', 0, 'view/systemTools/autoPlug/autoPlug.vue', 2, '', 0, 0, '插件模板', 'folder', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (28, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 24, 'pubPlug', 'pubPlug', 0, 'view/systemTools/pubPlug/pubPlug.vue', 3, '', 0, 0, '打包插件', 'files', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (29, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 24, 'plugin-email', 'plugin-email', 0, 'plugin/email/view/index.vue', 4, '', 0, 0, '邮件插件', 'message', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (30, '2024-07-25 12:18:13.478', '2024-07-25 12:18:13.478', null, 0, 15, 'exportTemplate', 'exportTemplate', 0, 'view/systemTools/exportTemplate/exportTemplate.vue', 10, '', 0, 0, '表格模板', 'reading', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (31, '2024-07-25 15:53:05.679', '2024-07-25 15:59:55.967', '2024-08-06 10:52:57.788', 0, 0, 'merchant', 'merchant', 0, 'view/merchant/merchant_info/merchant_info.vue', 0, '', 0, 0, '商户信息', 'briefcase', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (32, '2024-07-25 15:57:29.654', '2024-07-25 15:57:29.654', '2024-07-25 16:01:55.566', 0, 31, 'merchantList', 'merchantList', 0, 'view/merchant/merchant/merchant_info.vue', 0, '', 0, 0, '商户列表', 'office-building', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (35, '2024-08-01 15:22:50.067', '2024-08-01 15:22:50.067', '2024-08-01 15:32:27.557', 0, 0, 'pay_product', 'pay_product', 0, 'view/payment/pay_product/pay_product.vue', 0, '', 0, 0, '支付产品', '', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (36, '2024-08-01 15:32:41.470', '2024-08-01 15:55:29.104', null, 0, 37, 'pay_product', 'pay_product', 0, 'view/payment/pay_product/pay_product.vue', 0, '', 0, 0, '支付产品', 'credit-card', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (37, '2024-08-01 15:55:08.145', '2024-08-01 15:55:08.145', null, 0, 0, 'payment', 'payment', 0, 'view/payment/index.vue', 2, '', 0, 0, '支付管理', 'box', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (38, '2024-08-05 15:07:34.454', '2024-08-05 15:11:39.899', '2024-08-05 15:12:31.376', 0, 37, 'pay_template', 'pay_template', 0, 'view/payment/pay_template/pay_template.vue', 0, '', 0, 0, '通道模板', 'document', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (39, '2024-08-05 15:12:59.486', '2024-08-05 15:13:36.256', '2024-08-05 15:14:38.976', 0, 37, 'pay_template', 'pay_template', 0, 'view/payment/pay_template/pay_template.vue', 0, '', 0, 0, '通道模板', 'document-copy', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (40, '2024-08-05 15:15:28.181', '2024-08-05 15:15:44.941', '2024-08-05 15:58:12.832', 0, 37, 'pay_template', 'pay_template', 0, 'view/payment/pay_template/pay_template.vue', 0, '', 0, 0, '通道模板', 'document-copy', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (41, '2024-08-05 15:59:52.914', '2024-08-05 16:02:05.556', '2024-08-05 16:52:19.160', 0, 37, 'pay_template', 'pay_template', 0, 'view/payment/pay_template/pay_template.vue', 0, '', 0, 0, '通道模板', 'document-copy', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (42, '2024-08-05 16:56:56.243', '2024-08-05 16:57:42.818', null, 0, 37, 'pay_template', 'pay_template', 0, 'view/payment/pay_template/pay_template.vue', 0, '', 0, 0, '通道模板', 'document-copy', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (43, '2024-08-05 20:08:14.034', '2024-08-05 20:09:35.085', '2024-08-05 20:10:51.567', 0, 37, 'pay_channel', 'pay_channel', 0, 'view/payment/pay_channel/pay_channel.vue', 0, '', 0, 0, '支付通道', 'money', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (44, '2024-08-05 20:12:16.979', '2024-08-05 20:12:57.490', null, 0, 37, 'pay_channel', 'pay_channel', 0, 'view/payment/pay_channel/pay_channel.vue', 0, '', 0, 0, '支付通道', 'money', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (45, '2024-08-06 10:53:46.014', '2024-08-06 10:53:46.014', '2024-08-06 15:04:12.443', 0, 0, 'merchant', 'merchant', 0, 'view/merchant/index.vue', 0, '', 0, 0, '商户管理', 'ship', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (46, '2024-08-06 10:54:45.772', '2024-08-06 10:54:45.772', '2024-08-06 14:56:16.737', 0, 45, 'merchant_info', 'merchant_info', 0, 'view/merchant/merchant_info/merchant_info.vue', 0, '', 0, 0, '商户信息', 'shop', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (47, '2024-08-06 11:28:05.390', '2024-08-06 11:28:49.116', '2024-08-06 14:28:59.625', 0, 45, 'agency_info', 'agency_info', 0, 'view/merchant/agency_info/agency_info.vue', 0, '', 0, 0, '代理信息', 'trophy', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (48, '2024-08-06 14:29:44.108', '2024-08-06 15:19:45.623', null, 0, 56, 'agency_info', 'agency_info', 0, 'view/merchant/agency_info/agency_info.vue', 0, '', 0, 0, '代理信息', 'help-filled', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (55, '2024-08-06 15:10:13.359', '2024-08-06 15:19:40.070', null, 0, 56, 'merchantInfo', 'merchantInfo', 0, 'view/merchant/merchant_info/merchant_info.vue', 0, '', 0, 0, '商户信息', 'goods-filled', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (56, '2024-08-06 15:19:30.561', '2024-08-06 15:19:30.561', null, 0, 0, 'merchant', 'merchant', 0, 'view/merchant/index.vue', 0, '', 0, 0, '商户管理', 'office-building', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (57, '2024-08-07 10:35:54.561', '2024-08-07 10:37:28.409', null, 0, 56, 'merchant_channel', 'merchant_channel', 0, 'view/merchant/merchant_channel/merchant_channel.vue', 0, '', 0, 0, '商户通道', 'money', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (58, '2024-08-08 15:00:38.341', '2024-08-08 15:00:38.341', '2024-08-08 15:09:44.624', 0, 0, 'trade_order', 'trade_order', 0, 'view/trade/trade_order/trade_order.vue', 0, '', 0, 0, '交易订单', '', 0);
INSERT INTO gva.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab) VALUES (59, '2024-08-08 18:54:15.900', '2024-08-08 18:54:15.900', null, 0, 0, 'trade_order', 'trade_order', 0, 'view/trade/trade_order/trade_order.vue', 0, '', 0, 0, '交易订单', '', 0);
