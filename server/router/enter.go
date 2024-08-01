package router

import (
	"github.com/flipped-aurora/gin-vue-admin/server/router/example"
	"github.com/flipped-aurora/gin-vue-admin/server/router/merchant"
	"github.com/flipped-aurora/gin-vue-admin/server/router/payment"
	"github.com/flipped-aurora/gin-vue-admin/server/router/system"
)

type RouterGroup struct {
	System   system.RouterGroup
	Example  example.RouterGroup
	Merchant merchant.RouterGroup
	Payment  payment.RouterGroup
}

var RouterGroupApp = new(RouterGroup)
