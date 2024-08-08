import service from '@/utils/request'

// @Tags TradeOrder
// @Summary 创建交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TradeOrder true "创建交易订单"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /trade_order/createTradeOrder [post]
export const createTradeOrder = (data) => {
  return service({
    url: '/trade_order/createTradeOrder',
    method: 'post',
    data
  })
}

// @Tags TradeOrder
// @Summary 删除交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TradeOrder true "删除交易订单"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /trade_order/deleteTradeOrder [delete]
export const deleteTradeOrder = (params) => {
  return service({
    url: '/trade_order/deleteTradeOrder',
    method: 'delete',
    params
  })
}

// @Tags TradeOrder
// @Summary 批量删除交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除交易订单"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /trade_order/deleteTradeOrder [delete]
export const deleteTradeOrderByIds = (params) => {
  return service({
    url: '/trade_order/deleteTradeOrderByIds',
    method: 'delete',
    params
  })
}

// @Tags TradeOrder
// @Summary 更新交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TradeOrder true "更新交易订单"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /trade_order/updateTradeOrder [put]
export const updateTradeOrder = (data) => {
  return service({
    url: '/trade_order/updateTradeOrder',
    method: 'put',
    data
  })
}

// @Tags TradeOrder
// @Summary 用id查询交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.TradeOrder true "用id查询交易订单"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /trade_order/findTradeOrder [get]
export const findTradeOrder = (params) => {
  return service({
    url: '/trade_order/findTradeOrder',
    method: 'get',
    params
  })
}

// @Tags TradeOrder
// @Summary 分页获取交易订单列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取交易订单列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /trade_order/getTradeOrderList [get]
export const getTradeOrderList = (params) => {
  return service({
    url: '/trade_order/getTradeOrderList',
    method: 'get',
    params
  })
}
