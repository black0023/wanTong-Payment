package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/merchant"
    merchantReq "github.com/flipped-aurora/gin-vue-admin/server/model/merchant/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
)

type AgencyInfoApi struct {
}

var agency_infoService = service.ServiceGroupApp.MerchantServiceGroup.AgencyInfoService


// CreateAgencyInfo 创建代理信息
// @Tags AgencyInfo
// @Summary 创建代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.AgencyInfo true "创建代理信息"
// @Success 200 {object} response.Response{msg=string} "创建成功"
// @Router /agency_info/createAgencyInfo [post]
func (agency_infoApi *AgencyInfoApi) CreateAgencyInfo(c *gin.Context) {
	var agency_info merchant.AgencyInfo
	err := c.ShouldBindJSON(&agency_info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := agency_infoService.CreateAgencyInfo(&agency_info); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteAgencyInfo 删除代理信息
// @Tags AgencyInfo
// @Summary 删除代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.AgencyInfo true "删除代理信息"
// @Success 200 {object} response.Response{msg=string} "删除成功"
// @Router /agency_info/deleteAgencyInfo [delete]
func (agency_infoApi *AgencyInfoApi) DeleteAgencyInfo(c *gin.Context) {
	ID := c.Query("ID")
	if err := agency_infoService.DeleteAgencyInfo(ID); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteAgencyInfoByIds 批量删除代理信息
// @Tags AgencyInfo
// @Summary 批量删除代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Success 200 {object} response.Response{msg=string} "批量删除成功"
// @Router /agency_info/deleteAgencyInfoByIds [delete]
func (agency_infoApi *AgencyInfoApi) DeleteAgencyInfoByIds(c *gin.Context) {
	IDs := c.QueryArray("IDs[]")
	if err := agency_infoService.DeleteAgencyInfoByIds(IDs); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateAgencyInfo 更新代理信息
// @Tags AgencyInfo
// @Summary 更新代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.AgencyInfo true "更新代理信息"
// @Success 200 {object} response.Response{msg=string} "更新成功"
// @Router /agency_info/updateAgencyInfo [put]
func (agency_infoApi *AgencyInfoApi) UpdateAgencyInfo(c *gin.Context) {
	var agency_info merchant.AgencyInfo
	err := c.ShouldBindJSON(&agency_info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := agency_infoService.UpdateAgencyInfo(agency_info); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindAgencyInfo 用id查询代理信息
// @Tags AgencyInfo
// @Summary 用id查询代理信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query merchant.AgencyInfo true "用id查询代理信息"
// @Success 200 {object} response.Response{data=object{reagency_info=merchant.AgencyInfo},msg=string} "查询成功"
// @Router /agency_info/findAgencyInfo [get]
func (agency_infoApi *AgencyInfoApi) FindAgencyInfo(c *gin.Context) {
	ID := c.Query("ID")
	if reagency_info, err := agency_infoService.GetAgencyInfo(ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"reagency_info": reagency_info}, c)
	}
}

// GetAgencyInfoList 分页获取代理信息列表
// @Tags AgencyInfo
// @Summary 分页获取代理信息列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query merchantReq.AgencyInfoSearch true "分页获取代理信息列表"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "获取成功"
// @Router /agency_info/getAgencyInfoList [get]
func (agency_infoApi *AgencyInfoApi) GetAgencyInfoList(c *gin.Context) {
	var pageInfo merchantReq.AgencyInfoSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := agency_infoService.GetAgencyInfoInfoList(pageInfo); err != nil {
	    global.GVA_LOG.Error("获取失败!", zap.Error(err))
        response.FailWithMessage("获取失败", c)
    } else {
        response.OkWithDetailed(response.PageResult{
            List:     list,
            Total:    total,
            Page:     pageInfo.Page,
            PageSize: pageInfo.PageSize,
        }, "获取成功", c)
    }
}

// GetAgencyInfoPublic 不需要鉴权的代理信息接口
// @Tags AgencyInfo
// @Summary 不需要鉴权的代理信息接口
// @accept application/json
// @Produce application/json
// @Param data query merchantReq.AgencyInfoSearch true "分页获取代理信息列表"
// @Success 200 {object} response.Response{data=object,msg=string} "获取成功"
// @Router /agency_info/getAgencyInfoPublic [get]
func (agency_infoApi *AgencyInfoApi) GetAgencyInfoPublic(c *gin.Context) {
    // 此接口不需要鉴权
    // 示例为返回了一个固定的消息接口，一般本接口用于C端服务，需要自己实现业务逻辑
    response.OkWithDetailed(gin.H{
       "info": "不需要鉴权的代理信息接口信息",
    }, "获取成功", c)
}
