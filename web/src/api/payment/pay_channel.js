import service from '@/utils/request'

// @Tags PayChannel
// @Summary 创建支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayChannel true "创建支付通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /pay_channel/createPayChannel [post]
export const createPayChannel = (data) => {
  return service({
    url: '/pay_channel/createPayChannel',
    method: 'post',
    data
  })
}

// @Tags PayChannel
// @Summary 删除支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayChannel true "删除支付通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /pay_channel/deletePayChannel [delete]
export const deletePayChannel = (params) => {
  return service({
    url: '/pay_channel/deletePayChannel',
    method: 'delete',
    params
  })
}

// @Tags PayChannel
// @Summary 批量删除支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除支付通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /pay_channel/deletePayChannel [delete]
export const deletePayChannelByIds = (params) => {
  return service({
    url: '/pay_channel/deletePayChannelByIds',
    method: 'delete',
    params
  })
}

// @Tags PayChannel
// @Summary 更新支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayChannel true "更新支付通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /pay_channel/updatePayChannel [put]
export const updatePayChannel = (data) => {
  return service({
    url: '/pay_channel/updatePayChannel',
    method: 'put',
    data
  })
}

// @Tags PayChannel
// @Summary 用id查询支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PayChannel true "用id查询支付通道"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /pay_channel/findPayChannel [get]
export const findPayChannel = (params) => {
  return service({
    url: '/pay_channel/findPayChannel',
    method: 'get',
    params
  })
}

// @Tags PayChannel
// @Summary 分页获取支付通道列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取支付通道列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /pay_channel/getPayChannelList [get]
export const getPayChannelList = (params) => {
  return service({
    url: '/pay_channel/getPayChannelList',
    method: 'get',
    params
  })
}
