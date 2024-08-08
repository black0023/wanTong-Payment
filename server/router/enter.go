package router

import (
	"github.com/flipped-aurora/gin-vue-admin/server/router/example"
	"github.com/flipped-aurora/gin-vue-admin/server/router/merchant"
	"github.com/flipped-aurora/gin-vue-admin/server/router/payment"
	"github.com/flipped-aurora/gin-vue-admin/server/router/system"
	"github.com/flipped-aurora/gin-vue-admin/server/router/trade"
)

type RouterGroup struct {
	System   system.RouterGroup
	Example  example.RouterGroup
	Merchant merchant.RouterGroup
	Payment  payment.RouterGroup
	Trade    trade.RouterGroup
}

var RouterGroupApp = new(RouterGroup)
