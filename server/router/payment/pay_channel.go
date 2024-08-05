package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PayChannelRouter struct {
}

// InitPayChannelRouter 初始化 支付通道 路由信息
func (s *PayChannelRouter) InitPayChannelRouter(Router *gin.RouterGroup,PublicRouter *gin.RouterGroup) {
	pay_channelRouter := Router.Group("pay_channel").Use(middleware.OperationRecord())
	pay_channelRouterWithoutRecord := Router.Group("pay_channel")
	pay_channelRouterWithoutAuth := PublicRouter.Group("pay_channel")

	var pay_channelApi = v1.ApiGroupApp.PaymentApiGroup.PayChannelApi
	{
		pay_channelRouter.POST("createPayChannel", pay_channelApi.CreatePayChannel)   // 新建支付通道
		pay_channelRouter.DELETE("deletePayChannel", pay_channelApi.DeletePayChannel) // 删除支付通道
		pay_channelRouter.DELETE("deletePayChannelByIds", pay_channelApi.DeletePayChannelByIds) // 批量删除支付通道
		pay_channelRouter.PUT("updatePayChannel", pay_channelApi.UpdatePayChannel)    // 更新支付通道
	}
	{
		pay_channelRouterWithoutRecord.GET("findPayChannel", pay_channelApi.FindPayChannel)        // 根据ID获取支付通道
		pay_channelRouterWithoutRecord.GET("getPayChannelList", pay_channelApi.GetPayChannelList)  // 获取支付通道列表
	}
	{
	    pay_channelRouterWithoutAuth.GET("getPayChannelPublic", pay_channelApi.GetPayChannelPublic)  // 获取支付通道列表
	}
}
