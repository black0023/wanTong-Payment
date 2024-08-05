import service from '@/utils/request'

// @Tags PayTemplate
// @Summary 创建通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayTemplate true "创建通道模板"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /pay_template/createPayTemplate [post]
export const createPayTemplate = (data) => {
  return service({
    url: '/pay_template/createPayTemplate',
    method: 'post',
    data
  })
}

// @Tags PayTemplate
// @Summary 删除通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayTemplate true "删除通道模板"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /pay_template/deletePayTemplate [delete]
export const deletePayTemplate = (params) => {
  return service({
    url: '/pay_template/deletePayTemplate',
    method: 'delete',
    params
  })
}

// @Tags PayTemplate
// @Summary 批量删除通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除通道模板"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /pay_template/deletePayTemplate [delete]
export const deletePayTemplateByIds = (params) => {
  return service({
    url: '/pay_template/deletePayTemplateByIds',
    method: 'delete',
    params
  })
}

// @Tags PayTemplate
// @Summary 更新通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PayTemplate true "更新通道模板"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /pay_template/updatePayTemplate [put]
export const updatePayTemplate = (data) => {
  return service({
    url: '/pay_template/updatePayTemplate',
    method: 'put',
    data
  })
}

// @Tags PayTemplate
// @Summary 用id查询通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PayTemplate true "用id查询通道模板"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /pay_template/findPayTemplate [get]
export const findPayTemplate = (params) => {
  return service({
    url: '/pay_template/findPayTemplate',
    method: 'get',
    params
  })
}

// @Tags PayTemplate
// @Summary 分页获取通道模板列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取通道模板列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /pay_template/getPayTemplateList [get]
export const getPayTemplateList = (params) => {
  return service({
    url: '/pay_template/getPayTemplateList',
    method: 'get',
    params
  })
}
