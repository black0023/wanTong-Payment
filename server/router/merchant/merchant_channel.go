package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type MerchantChannelRouter struct {
}

// InitMerchantChannelRouter 初始化 商户通道 路由信息
func (s *MerchantChannelRouter) InitMerchantChannelRouter(Router *gin.RouterGroup, PublicRouter *gin.RouterGroup) {
	merchant_channelRouter := Router.Group("merchant_channel").Use(middleware.OperationRecord())
	merchant_channelRouterWithoutRecord := Router.Group("merchant_channel")
	merchant_channelRouterWithoutAuth := PublicRouter.Group("merchant_channel")

	var merchant_channelApi = v1.ApiGroupApp.MerchantApiGroup.MerchantChannelApi
	{
		merchant_channelRouter.POST("createMerchantChannel", merchant_channelApi.CreateMerchantChannel)             // 新建商户通道
		merchant_channelRouter.POST("updateMerchantChannelList", merchant_channelApi.UpdateMerchantChannelList)     // 更新商户通道列表
		merchant_channelRouter.DELETE("deleteMerchantChannel", merchant_channelApi.DeleteMerchantChannel)           // 删除商户通道
		merchant_channelRouter.DELETE("deleteMerchantChannelByIds", merchant_channelApi.DeleteMerchantChannelByIds) // 批量删除商户通道
		merchant_channelRouter.PUT("updateMerchantChannel", merchant_channelApi.UpdateMerchantChannel)              // 更新商户通道
	}
	{
		merchant_channelRouterWithoutRecord.GET("findMerchantChannel", merchant_channelApi.FindMerchantChannel)       // 根据ID获取商户通道
		merchant_channelRouterWithoutRecord.GET("getMerchantChannelList", merchant_channelApi.GetMerchantChannelList) // 获取商户通道列表
	}
	{
		merchant_channelRouterWithoutAuth.GET("getMerchantChannelPublic", merchant_channelApi.GetMerchantChannelPublic) // 获取商户通道列表
	}
}
