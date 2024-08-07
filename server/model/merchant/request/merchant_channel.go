package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
	
)

type MerchantChannelSearch struct{
    
        StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
        EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    
                      MchNo  string `json:"mch_no" form:"mch_no" `
                      PayChannel  string `json:"pay_channel" form:"pay_channel" `
                      PayCode  string `json:"pay_code" form:"pay_code" `
    request.PageInfo
}
