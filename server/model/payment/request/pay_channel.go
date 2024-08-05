package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
	
)

type PayChannelSearch struct{
    
        StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
        EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    
                      ChannelName  string `json:"channel_name" form:"channel_name" `
                      ProductId  *int `json:"product_id" form:"product_id" `
                      TemplateId  *int `json:"template_id" form:"template_id" `
                      PaymentCode  string `json:"payment_code" form:"payment_code" `
    request.PageInfo
}
