import service from '@/utils/request'

// @Tags MerchantInfo
// @Summary 创建商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.MerchantInfo true "创建商户信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /merchantInfo/createMerchantInfo [post]
export const createMerchantInfo = (data) => {
  return service({
    url: '/merchantInfo/createMerchantInfo',
    method: 'post',
    data
  })
}

// @Tags MerchantInfo
// @Summary 删除商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.MerchantInfo true "删除商户信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /merchantInfo/deleteMerchantInfo [delete]
export const deleteMerchantInfo = (params) => {
  return service({
    url: '/merchantInfo/deleteMerchantInfo',
    method: 'delete',
    params
  })
}

// @Tags MerchantInfo
// @Summary 批量删除商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除商户信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /merchantInfo/deleteMerchantInfo [delete]
export const deleteMerchantInfoByIds = (params) => {
  return service({
    url: '/merchantInfo/deleteMerchantInfoByIds',
    method: 'delete',
    params
  })
}

// @Tags MerchantInfo
// @Summary 更新商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.MerchantInfo true "更新商户信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /merchantInfo/updateMerchantInfo [put]
export const updateMerchantInfo = (data) => {
  return service({
    url: '/merchantInfo/updateMerchantInfo',
    method: 'put',
    data
  })
}

// @Tags MerchantInfo
// @Summary 用id查询商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.MerchantInfo true "用id查询商户信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /merchantInfo/findMerchantInfo [get]
export const findMerchantInfo = (params) => {
  return service({
    url: '/merchantInfo/findMerchantInfo',
    method: 'get',
    params
  })
}

export const refreshMerchantApiKey = (params) => {
  return service({
    url: '/merchantInfo/refreshMerchantApiKey',
    method: 'get',
    params
  })
}


// @Tags MerchantInfo
// @Summary 分页获取商户信息列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取商户信息列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /merchantInfo/getMerchantInfoList [get]
export const getMerchantInfoList = (params) => {
  return service({
    url: '/merchantInfo/getMerchantInfoList',
    method: 'get',
    params
  })
}
