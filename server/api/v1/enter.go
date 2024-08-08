package v1

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1/example"
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1/merchant"
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1/payment"
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1/system"
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1/trade"
)

type ApiGroup struct {
	SystemApiGroup   system.ApiGroup
	ExampleApiGroup  example.ApiGroup
	MerchantApiGroup merchant.ApiGroup
	PaymentApiGroup  payment.ApiGroup
	TradeApiGroup    trade.ApiGroup
}

var ApiGroupApp = new(ApiGroup)
