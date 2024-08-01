package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PayProductRouter struct {
}

// InitPayProductRouter 初始化 支付产品 路由信息
func (s *PayProductRouter) InitPayProductRouter(Router *gin.RouterGroup,PublicRouter *gin.RouterGroup) {
	pay_productRouter := Router.Group("pay_product").Use(middleware.OperationRecord())
	pay_productRouterWithoutRecord := Router.Group("pay_product")
	pay_productRouterWithoutAuth := PublicRouter.Group("pay_product")

	var pay_productApi = v1.ApiGroupApp.PaymentApiGroup.PayProductApi
	{
		pay_productRouter.POST("createPayProduct", pay_productApi.CreatePayProduct)   // 新建支付产品
		pay_productRouter.DELETE("deletePayProduct", pay_productApi.DeletePayProduct) // 删除支付产品
		pay_productRouter.DELETE("deletePayProductByIds", pay_productApi.DeletePayProductByIds) // 批量删除支付产品
		pay_productRouter.PUT("updatePayProduct", pay_productApi.UpdatePayProduct)    // 更新支付产品
	}
	{
		pay_productRouterWithoutRecord.GET("findPayProduct", pay_productApi.FindPayProduct)        // 根据ID获取支付产品
		pay_productRouterWithoutRecord.GET("getPayProductList", pay_productApi.GetPayProductList)  // 获取支付产品列表
	}
	{
	    pay_productRouterWithoutAuth.GET("getPayProductPublic", pay_productApi.GetPayProductPublic)  // 获取支付产品列表
	}
}
