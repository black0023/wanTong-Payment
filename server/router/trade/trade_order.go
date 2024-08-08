package trade

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type TradeOrderRouter struct {
}

// InitTradeOrderRouter 初始化 交易订单 路由信息
func (s *TradeOrderRouter) InitTradeOrderRouter(Router *gin.RouterGroup,PublicRouter *gin.RouterGroup) {
	trade_orderRouter := Router.Group("trade_order").Use(middleware.OperationRecord())
	trade_orderRouterWithoutRecord := Router.Group("trade_order")
	trade_orderRouterWithoutAuth := PublicRouter.Group("trade_order")

	var trade_orderApi = v1.ApiGroupApp.TradeApiGroup.TradeOrderApi
	{
		trade_orderRouter.POST("createTradeOrder", trade_orderApi.CreateTradeOrder)   // 新建交易订单
		trade_orderRouter.DELETE("deleteTradeOrder", trade_orderApi.DeleteTradeOrder) // 删除交易订单
		trade_orderRouter.DELETE("deleteTradeOrderByIds", trade_orderApi.DeleteTradeOrderByIds) // 批量删除交易订单
		trade_orderRouter.PUT("updateTradeOrder", trade_orderApi.UpdateTradeOrder)    // 更新交易订单
	}
	{
		trade_orderRouterWithoutRecord.GET("findTradeOrder", trade_orderApi.FindTradeOrder)        // 根据ID获取交易订单
		trade_orderRouterWithoutRecord.GET("getTradeOrderList", trade_orderApi.GetTradeOrderList)  // 获取交易订单列表
	}
	{
	    trade_orderRouterWithoutAuth.GET("getTradeOrderPublic", trade_orderApi.GetTradeOrderPublic)  // 获取交易订单列表
	}
}
