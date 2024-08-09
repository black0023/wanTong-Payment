create table casbin_rule
(
    id    bigint unsigned auto_increment
        primary key,
    ptype varchar(100) null,
    v0    varchar(100) null,
    v1    varchar(100) null,
    v2    varchar(100) null,
    v3    varchar(100) null,
    v4    varchar(100) null,
    v5    varchar(100) null,
    constraint idx_casbin_rule
        unique (ptype, v0, v1, v2, v3, v4, v5)
);

INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2911, 'p', '888', '/agency_info/createAgencyInfo', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2912, 'p', '888', '/agency_info/deleteAgencyInfo', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2913, 'p', '888', '/agency_info/deleteAgencyInfoByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2915, 'p', '888', '/agency_info/findAgencyInfo', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2916, 'p', '888', '/agency_info/getAgencyInfoList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2914, 'p', '888', '/agency_info/updateAgencyInfo', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2807, 'p', '888', '/api/createApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2808, 'p', '888', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2813, 'p', '888', '/api/deleteApisByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2811, 'p', '888', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2812, 'p', '888', '/api/getApiById', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2810, 'p', '888', '/api/getApiList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2809, 'p', '888', '/api/updateApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2814, 'p', '888', '/authority/copyAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2815, 'p', '888', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2816, 'p', '888', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2818, 'p', '888', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2819, 'p', '888', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2817, 'p', '888', '/authority/updateAuthority', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2883, 'p', '888', '/authorityBtn/canRemoveAuthorityBtn', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2882, 'p', '888', '/authorityBtn/getAuthorityBtn', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2881, 'p', '888', '/authorityBtn/setAuthorityBtn', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2855, 'p', '888', '/autoCode/createPackage', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2852, 'p', '888', '/autoCode/createPlug', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2849, 'p', '888', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2857, 'p', '888', '/autoCode/delPackage', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2861, 'p', '888', '/autoCode/delSysHistory', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2851, 'p', '888', '/autoCode/getColumn', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2847, 'p', '888', '/autoCode/getDB', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2858, 'p', '888', '/autoCode/getMeta', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2856, 'p', '888', '/autoCode/getPackage', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2860, 'p', '888', '/autoCode/getSysHistory', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2848, 'p', '888', '/autoCode/getTables', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2853, 'p', '888', '/autoCode/installPlugin', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2850, 'p', '888', '/autoCode/preview', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2854, 'p', '888', '/autoCode/pubPlug', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2859, 'p', '888', '/autoCode/rollback', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2821, 'p', '888', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2820, 'p', '888', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2844, 'p', '888', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2845, 'p', '888', '/customer/customer', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2843, 'p', '888', '/customer/customer', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2842, 'p', '888', '/customer/customer', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2846, 'p', '888', '/customer/customerList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2880, 'p', '888', '/email/emailTest', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2832, 'p', '888', '/fileUploadAndDownload/breakpointContinue', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2833, 'p', '888', '/fileUploadAndDownload/breakpointContinueFinish', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2836, 'p', '888', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2837, 'p', '888', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2831, 'p', '888', '/fileUploadAndDownload/findFile', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2838, 'p', '888', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2834, 'p', '888', '/fileUploadAndDownload/removeChunk', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2835, 'p', '888', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2796, 'p', '888', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2822, 'p', '888', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2830, 'p', '888', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2824, 'p', '888', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2826, 'p', '888', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2828, 'p', '888', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2823, 'p', '888', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2829, 'p', '888', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2827, 'p', '888', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2825, 'p', '888', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2917, 'p', '888', '/merchantInfo/createMerchantInfo', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2918, 'p', '888', '/merchantInfo/deleteMerchantInfo', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2919, 'p', '888', '/merchantInfo/deleteMerchantInfoByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2921, 'p', '888', '/merchantInfo/findMerchantInfo', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2922, 'p', '888', '/merchantInfo/getMerchantInfoList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2923, 'p', '888', '/merchantInfo/refreshMerchantApiKey', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2920, 'p', '888', '/merchantInfo/updateMerchantInfo', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2924, 'p', '888', '/merchant_channel/createMerchantChannel', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2925, 'p', '888', '/merchant_channel/deleteMerchantChannel', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2926, 'p', '888', '/merchant_channel/deleteMerchantChannelByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2928, 'p', '888', '/merchant_channel/findMerchantChannel', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2929, 'p', '888', '/merchant_channel/getMerchantChannelList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2927, 'p', '888', '/merchant_channel/updateMerchantChannel', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2930, 'p', '888', '/merchant_channel/updateMerchantChannelList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2905, 'p', '888', '/pay_channel/createPayChannel', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2906, 'p', '888', '/pay_channel/deletePayChannel', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2907, 'p', '888', '/pay_channel/deletePayChannelByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2909, 'p', '888', '/pay_channel/findPayChannel', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2910, 'p', '888', '/pay_channel/getPayChannelList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2908, 'p', '888', '/pay_channel/updatePayChannel', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2893, 'p', '888', '/pay_product/createPayProduct', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2894, 'p', '888', '/pay_product/deletePayProduct', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2895, 'p', '888', '/pay_product/deletePayProductByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2897, 'p', '888', '/pay_product/findPayProduct', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2898, 'p', '888', '/pay_product/getPayProductList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2896, 'p', '888', '/pay_product/updatePayProduct', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2899, 'p', '888', '/pay_template/createPayTemplate', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2900, 'p', '888', '/pay_template/deletePayTemplate', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2901, 'p', '888', '/pay_template/deletePayTemplateByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2903, 'p', '888', '/pay_template/findPayTemplate', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2904, 'p', '888', '/pay_template/getPayTemplateList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2902, 'p', '888', '/pay_template/updatePayTemplate', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2878, 'p', '888', '/simpleUploader/checkFileMd5', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2879, 'p', '888', '/simpleUploader/mergeFileMd5', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2877, 'p', '888', '/simpleUploader/upload', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2867, 'p', '888', '/sysDictionary/createSysDictionary', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2868, 'p', '888', '/sysDictionary/deleteSysDictionary', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2870, 'p', '888', '/sysDictionary/findSysDictionary', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2871, 'p', '888', '/sysDictionary/getSysDictionaryList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2869, 'p', '888', '/sysDictionary/updateSysDictionary', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2863, 'p', '888', '/sysDictionaryDetail/createSysDictionaryDetail', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2864, 'p', '888', '/sysDictionaryDetail/deleteSysDictionaryDetail', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2865, 'p', '888', '/sysDictionaryDetail/findSysDictionaryDetail', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2866, 'p', '888', '/sysDictionaryDetail/getSysDictionaryDetailList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2862, 'p', '888', '/sysDictionaryDetail/updateSysDictionaryDetail', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2884, 'p', '888', '/sysExportTemplate/createSysExportTemplate', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2885, 'p', '888', '/sysExportTemplate/deleteSysExportTemplate', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2886, 'p', '888', '/sysExportTemplate/deleteSysExportTemplateByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2890, 'p', '888', '/sysExportTemplate/exportExcel', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2891, 'p', '888', '/sysExportTemplate/exportTemplate', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2888, 'p', '888', '/sysExportTemplate/findSysExportTemplate', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2889, 'p', '888', '/sysExportTemplate/getSysExportTemplateList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2892, 'p', '888', '/sysExportTemplate/importExcel', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2887, 'p', '888', '/sysExportTemplate/updateSysExportTemplate', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2872, 'p', '888', '/sysOperationRecord/createSysOperationRecord', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2875, 'p', '888', '/sysOperationRecord/deleteSysOperationRecord', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2876, 'p', '888', '/sysOperationRecord/deleteSysOperationRecordByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2873, 'p', '888', '/sysOperationRecord/findSysOperationRecord', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2874, 'p', '888', '/sysOperationRecord/getSysOperationRecordList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2839, 'p', '888', '/system/getServerInfo', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2840, 'p', '888', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2841, 'p', '888', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2931, 'p', '888', '/trade_order/createTradeOrder', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2932, 'p', '888', '/trade_order/deleteTradeOrder', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2933, 'p', '888', '/trade_order/deleteTradeOrderByIds', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2935, 'p', '888', '/trade_order/findTradeOrder', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2936, 'p', '888', '/trade_order/getTradeOrderList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2934, 'p', '888', '/trade_order/updateTradeOrder', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2798, 'p', '888', '/user/admin_register', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2804, 'p', '888', '/user/changePassword', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2797, 'p', '888', '/user/deleteUser', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2802, 'p', '888', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2799, 'p', '888', '/user/getUserList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2806, 'p', '888', '/user/resetPassword', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2801, 'p', '888', '/user/setSelfInfo', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2803, 'p', '888', '/user/setUserAuthorities', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2805, 'p', '888', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2800, 'p', '888', '/user/setUserInfo', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (100, 'p', '8881', '/api/createApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (103, 'p', '8881', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (105, 'p', '8881', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (102, 'p', '8881', '/api/getApiById', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (101, 'p', '8881', '/api/getApiList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (104, 'p', '8881', '/api/updateApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (106, 'p', '8881', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (107, 'p', '8881', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (108, 'p', '8881', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (109, 'p', '8881', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (127, 'p', '8881', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (126, 'p', '8881', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (133, 'p', '8881', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (134, 'p', '8881', '/customer/customer', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (131, 'p', '8881', '/customer/customer', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (132, 'p', '8881', '/customer/customer', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (135, 'p', '8881', '/customer/customerList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (124, 'p', '8881', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (125, 'p', '8881', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (123, 'p', '8881', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (122, 'p', '8881', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (128, 'p', '8881', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (112, 'p', '8881', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (114, 'p', '8881', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (116, 'p', '8881', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (118, 'p', '8881', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (113, 'p', '8881', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (110, 'p', '8881', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (115, 'p', '8881', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (111, 'p', '8881', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (117, 'p', '8881', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (129, 'p', '8881', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (130, 'p', '8881', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (99, 'p', '8881', '/user/admin_register', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (119, 'p', '8881', '/user/changePassword', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (136, 'p', '8881', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (120, 'p', '8881', '/user/getUserList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (121, 'p', '8881', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (138, 'p', '9528', '/api/createApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (141, 'p', '9528', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (143, 'p', '9528', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (140, 'p', '9528', '/api/getApiById', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (139, 'p', '9528', '/api/getApiList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (142, 'p', '9528', '/api/updateApi', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (144, 'p', '9528', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (145, 'p', '9528', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (146, 'p', '9528', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (147, 'p', '9528', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (174, 'p', '9528', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (165, 'p', '9528', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (164, 'p', '9528', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (172, 'p', '9528', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (170, 'p', '9528', '/customer/customer', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (171, 'p', '9528', '/customer/customer', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (169, 'p', '9528', '/customer/customer', 'PUT', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (173, 'p', '9528', '/customer/customerList', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (162, 'p', '9528', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (163, 'p', '9528', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (161, 'p', '9528', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (160, 'p', '9528', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (166, 'p', '9528', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (150, 'p', '9528', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (152, 'p', '9528', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (154, 'p', '9528', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (156, 'p', '9528', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (151, 'p', '9528', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (148, 'p', '9528', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (153, 'p', '9528', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (149, 'p', '9528', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (155, 'p', '9528', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (167, 'p', '9528', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (168, 'p', '9528', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (137, 'p', '9528', '/user/admin_register', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (157, 'p', '9528', '/user/changePassword', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (175, 'p', '9528', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (158, 'p', '9528', '/user/getUserList', 'POST', '', '', '');
INSERT INTO gva.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (159, 'p', '9528', '/user/setUserAuthority', 'POST', '', '', '');