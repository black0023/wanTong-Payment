import service from '@/utils/request'

// @Tags AgencyInfo
// @Summary 创建代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.AgencyInfo true "创建代理信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /agency_info/createAgencyInfo [post]
export const createAgencyInfo = (data) => {
  return service({
    url: '/agency_info/createAgencyInfo',
    method: 'post',
    data
  })
}

// @Tags AgencyInfo
// @Summary 删除代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.AgencyInfo true "删除代理信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /agency_info/deleteAgencyInfo [delete]
export const deleteAgencyInfo = (params) => {
  return service({
    url: '/agency_info/deleteAgencyInfo',
    method: 'delete',
    params
  })
}

// @Tags AgencyInfo
// @Summary 批量删除代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除代理信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /agency_info/deleteAgencyInfo [delete]
export const deleteAgencyInfoByIds = (params) => {
  return service({
    url: '/agency_info/deleteAgencyInfoByIds',
    method: 'delete',
    params
  })
}

// @Tags AgencyInfo
// @Summary 更新代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.AgencyInfo true "更新代理信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /agency_info/updateAgencyInfo [put]
export const updateAgencyInfo = (data) => {
  return service({
    url: '/agency_info/updateAgencyInfo',
    method: 'put',
    data
  })
}

// @Tags AgencyInfo
// @Summary 用id查询代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.AgencyInfo true "用id查询代理信息"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /agency_info/findAgencyInfo [get]
export const findAgencyInfo = (params) => {
  return service({
    url: '/agency_info/findAgencyInfo',
    method: 'get',
    params
  })
}

// @Tags AgencyInfo
// @Summary 分页获取代理信息列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取代理信息列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /agency_info/getAgencyInfoList [get]
export const getAgencyInfoList = (params) => {
  return service({
    url: '/agency_info/getAgencyInfoList',
    method: 'get',
    params
  })
}
