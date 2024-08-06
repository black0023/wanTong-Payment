package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type AgencyInfoRouter struct {
}

// InitAgencyInfoRouter 初始化 代理信息 路由信息
func (s *AgencyInfoRouter) InitAgencyInfoRouter(Router *gin.RouterGroup,PublicRouter *gin.RouterGroup) {
	agency_infoRouter := Router.Group("agency_info").Use(middleware.OperationRecord())
	agency_infoRouterWithoutRecord := Router.Group("agency_info")
	agency_infoRouterWithoutAuth := PublicRouter.Group("agency_info")

	var agency_infoApi = v1.ApiGroupApp.MerchantApiGroup.AgencyInfoApi
	{
		agency_infoRouter.POST("createAgencyInfo", agency_infoApi.CreateAgencyInfo)   // 新建代理信息
		agency_infoRouter.DELETE("deleteAgencyInfo", agency_infoApi.DeleteAgencyInfo) // 删除代理信息
		agency_infoRouter.DELETE("deleteAgencyInfoByIds", agency_infoApi.DeleteAgencyInfoByIds) // 批量删除代理信息
		agency_infoRouter.PUT("updateAgencyInfo", agency_infoApi.UpdateAgencyInfo)    // 更新代理信息
	}
	{
		agency_infoRouterWithoutRecord.GET("findAgencyInfo", agency_infoApi.FindAgencyInfo)        // 根据ID获取代理信息
		agency_infoRouterWithoutRecord.GET("getAgencyInfoList", agency_infoApi.GetAgencyInfoList)  // 获取代理信息列表
	}
	{
	    agency_infoRouterWithoutAuth.GET("getAgencyInfoPublic", agency_infoApi.GetAgencyInfoPublic)  // 获取代理信息列表
	}
}
