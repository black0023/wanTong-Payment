package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
	
)

type TradeOrderSearch struct{
    
        StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
        EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    
                      MchNo  string `json:"mch_no" form:"mch_no" `
                      MchName  string `json:"mch_name" form:"mch_name" `
                      PlatformOrder  string `json:"platform_order" form:"platform_order" `
                      MerchantOrder  string `json:"merchant_order" form:"merchant_order" `
                      ProductId  string `json:"product_id" form:"product_id" `
                      ChannelId  string `json:"channel_id" form:"channel_id" `
    request.PageInfo
}
