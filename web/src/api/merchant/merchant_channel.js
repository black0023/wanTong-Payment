import service from '@/utils/request'

// @Tags MerchantChannel
// @Summary 创建商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.MerchantChannel true "创建商户通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /merchant_channel/createMerchantChannel [post]
export const createMerchantChannel = (data) => {
  return service({
    url: '/merchant_channel/createMerchantChannel',
    method: 'post',
    data
  })
}

// @Tags MerchantChannel
// @Summary 删除商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.MerchantChannel true "删除商户通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /merchant_channel/deleteMerchantChannel [delete]
export const deleteMerchantChannel = (params) => {
  return service({
    url: '/merchant_channel/deleteMerchantChannel',
    method: 'delete',
    params
  })
}

// @Tags MerchantChannel
// @Summary 批量删除商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除商户通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /merchant_channel/deleteMerchantChannel [delete]
export const deleteMerchantChannelByIds = (params) => {
  return service({
    url: '/merchant_channel/deleteMerchantChannelByIds',
    method: 'delete',
    params
  })
}

// @Tags MerchantChannel
// @Summary 更新商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.MerchantChannel true "更新商户通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /merchant_channel/updateMerchantChannel [put]
export const updateMerchantChannel = (data) => {
  return service({
    url: '/merchant_channel/updateMerchantChannel',
    method: 'put',
    data
  })
}

// @Tags MerchantChannel
// @Summary 用id查询商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.MerchantChannel true "用id查询商户通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /merchant_channel/findMerchantChannel [get]
export const findMerchantChannel = (params) => {
  return service({
    url: '/merchant_channel/findMerchantChannel',
    method: 'get',
    params
  })
}

// @Tags MerchantChannel
// @Summary 分页获取商户通道列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取商户通道列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /merchant_channel/getMerchantChannelList [get]
export const getMerchantChannelList = (params) => {
  return service({
    url: '/merchant_channel/getMerchantChannelList',
    method: 'get',
    params
  })
}

export const updateMerchantChannelList = (data) => {
  return service({
    url: '/merchant_channel/updateMerchantChannelList',
    method: 'post',
    data
  })
}


