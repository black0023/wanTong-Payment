package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type MerchantInfoRouter struct {
}

// InitMerchantInfoRouter 初始化 商户信息 路由信息
func (s *MerchantInfoRouter) InitMerchantInfoRouter(Router *gin.RouterGroup, PublicRouter *gin.RouterGroup) {
	merchantInfoRouter := Router.Group("merchantInfo").Use(middleware.OperationRecord())
	merchantInfoRouterWithoutRecord := Router.Group("merchantInfo")
	merchantInfoRouterWithoutAuth := PublicRouter.Group("merchantInfo")

	var merchantInfoApi = v1.ApiGroupApp.MerchantApiGroup.MerchantInfoApi
	{
		merchantInfoRouter.POST("createMerchantInfo", merchantInfoApi.CreateMerchantInfo)             // 新建商户信息
		merchantInfoRouter.DELETE("deleteMerchantInfo", merchantInfoApi.DeleteMerchantInfo)           // 删除商户信息
		merchantInfoRouter.DELETE("deleteMerchantInfoByIds", merchantInfoApi.DeleteMerchantInfoByIds) // 批量删除商户信息
		merchantInfoRouter.PUT("updateMerchantInfo", merchantInfoApi.UpdateMerchantInfo)              // 更新商户信息
	}
	{
		merchantInfoRouterWithoutRecord.GET("findMerchantInfo", merchantInfoApi.FindMerchantInfo)           // 根据ID获取商户信息
		merchantInfoRouterWithoutRecord.GET("getMerchantInfoList", merchantInfoApi.GetMerchantInfoList)     // 获取商户信息列表
		merchantInfoRouterWithoutRecord.GET("refreshMerchantApiKey", merchantInfoApi.RefreshMerchantApiKey) // 刷新商户ApiKey
	}
	{
		merchantInfoRouterWithoutAuth.GET("getMerchantInfoPublic", merchantInfoApi.GetMerchantInfoPublic) // 获取商户信息列表
	}
}
