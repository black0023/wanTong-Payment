import service from '@/utils/request'

// @Tags PayProduct
// @Summary 创建支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayProduct true "创建支付产品"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /pay_product/createPayProduct [post]
export const createPayProduct = (data) => {
  return service({
    url: '/pay_product/createPayProduct',
    method: 'post',
    data
  })
}

// @Tags PayProduct
// @Summary 删除支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayProduct true "删除支付产品"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /pay_product/deletePayProduct [delete]
export const deletePayProduct = (params) => {
  return service({
    url: '/pay_product/deletePayProduct',
    method: 'delete',
    params
  })
}

// @Tags PayProduct
// @Summary 批量删除支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除支付产品"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /pay_product/deletePayProduct [delete]
export const deletePayProductByIds = (params) => {
  return service({
    url: '/pay_product/deletePayProductByIds',
    method: 'delete',
    params
  })
}

// @Tags PayProduct
// @Summary 更新支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayProduct true "更新支付产品"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /pay_product/updatePayProduct [put]
export const updatePayProduct = (data) => {
  return service({
    url: '/pay_product/updatePayProduct',
    method: 'put',
    data
  })
}

// @Tags PayProduct
// @Summary 用id查询支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PayProduct true "用id查询支付产品"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /pay_product/findPayProduct [get]
export const findPayProduct = (params) => {
  return service({
    url: '/pay_product/findPayProduct',
    method: 'get',
    params
  })
}

// @Tags PayProduct
// @Summary 分页获取支付产品列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取支付产品列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /pay_product/getPayProductList [get]
export const getPayProductList = (params) => {
  return service({
    url: '/pay_product/getPayProductList',
    method: 'get',
    params
  })
}
