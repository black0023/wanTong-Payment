package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
	
)

type MerchantInfoSearch struct{
    
        StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
        EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    
                      MchNo  string `json:"mch_no" form:"mch_no" `
                      MchAcc  string `json:"mch_acc" form:"mch_acc" `
                      NickName  string `json:"nick_name" form:"nick_name" `
    request.PageInfo
}
