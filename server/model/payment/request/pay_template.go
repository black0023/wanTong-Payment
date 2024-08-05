package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
	
)

type PayTemplateSearch struct{
    
        StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
        EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    
                      TemplateName  string `json:"template_name" form:"template_name" `
                      MchNo  string `json:"mch_no" form:"mch_no" `
                      AppId  string `json:"app_id" form:"app_id" `
                      Md5Key  string `json:"md5_key" form:"md5_key" `
    request.PageInfo
}
