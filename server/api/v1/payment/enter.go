package payment

import "github.com/flipped-aurora/gin-vue-admin/server/service"

type ApiGroup struct {
	PayProductApi
	PayTemplateApi
	PayChannelApi
}

var (
	pay_channelService  = service.ServiceGroupApp.PaymentServiceGroup.PayChannelService
	pay_productService  = service.ServiceGroupApp.PaymentServiceGroup.PayProductService
	pay_templateService = service.ServiceGroupApp.PaymentServiceGroup.PayTemplateService
)
