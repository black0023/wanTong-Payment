package service

import (
	"github.com/flipped-aurora/gin-vue-admin/server/service/example"
	"github.com/flipped-aurora/gin-vue-admin/server/service/merchant"
	"github.com/flipped-aurora/gin-vue-admin/server/service/payment"
	"github.com/flipped-aurora/gin-vue-admin/server/service/system"
	"github.com/flipped-aurora/gin-vue-admin/server/service/trade"
)

type ServiceGroup struct {
	SystemServiceGroup   system.ServiceGroup
	ExampleServiceGroup  example.ServiceGroup
	MerchantServiceGroup merchant.ServiceGroup
	PaymentServiceGroup  payment.ServiceGroup
	TradeServiceGroup    trade.ServiceGroup
}

var ServiceGroupApp = new(ServiceGroup)
