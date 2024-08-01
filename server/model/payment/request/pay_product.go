package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
	
)

type PayProductSearch struct{
    
        StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
        EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    
                      PayName  string `json:"pay_name" form:"pay_name" `
                      PayCode  string `json:"pay_code" form:"pay_code" `
                      Enable  *int `json:"enable" form:"enable" `
    request.PageInfo
}
