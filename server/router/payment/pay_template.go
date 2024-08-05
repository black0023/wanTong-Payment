package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PayTemplateRouter struct {
}

// InitPayTemplateRouter 初始化 通道模板 路由信息
func (s *PayTemplateRouter) InitPayTemplateRouter(Router *gin.RouterGroup,PublicRouter *gin.RouterGroup) {
	pay_templateRouter := Router.Group("pay_template").Use(middleware.OperationRecord())
	pay_templateRouterWithoutRecord := Router.Group("pay_template")
	pay_templateRouterWithoutAuth := PublicRouter.Group("pay_template")

	var pay_templateApi = v1.ApiGroupApp.PaymentApiGroup.PayTemplateApi
	{
		pay_templateRouter.POST("createPayTemplate", pay_templateApi.CreatePayTemplate)   // 新建通道模板
		pay_templateRouter.DELETE("deletePayTemplate", pay_templateApi.DeletePayTemplate) // 删除通道模板
		pay_templateRouter.DELETE("deletePayTemplateByIds", pay_templateApi.DeletePayTemplateByIds) // 批量删除通道模板
		pay_templateRouter.PUT("updatePayTemplate", pay_templateApi.UpdatePayTemplate)    // 更新通道模板
	}
	{
		pay_templateRouterWithoutRecord.GET("findPayTemplate", pay_templateApi.FindPayTemplate)        // 根据ID获取通道模板
		pay_templateRouterWithoutRecord.GET("getPayTemplateList", pay_templateApi.GetPayTemplateList)  // 获取通道模板列表
	}
	{
	    pay_templateRouterWithoutAuth.GET("getPayTemplatePublic", pay_templateApi.GetPayTemplatePublic)  // 获取通道模板列表
	}
}
