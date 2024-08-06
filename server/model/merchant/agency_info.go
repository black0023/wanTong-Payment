// 自动生成模板AgencyInfo
package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
	
)

// 代理信息 结构体  AgencyInfo
type AgencyInfo struct {
 global.GVA_MODEL 
      Account  string `json:"account" form:"account" gorm:"column:account;comment:代理账号;size:30;" binding:"required"`  //代理账号 
      NickName  string `json:"nick_name" form:"nick_name" gorm:"column:nick_name;comment:代理昵称;size:30;" binding:"required"`  //代理昵称 
      Balance  *float64 `json:"balance" form:"balance" gorm:"default:0;column:balance;comment:余额;"`  //余额 
      Enable  *int `json:"enable" form:"enable" gorm:"default:1;column:enable;comment:启用;" binding:"required"`  //启用 
}


// TableName 代理信息 AgencyInfo自定义表名 agency_info
func (AgencyInfo) TableName() string {
  return "agency_info"
}

