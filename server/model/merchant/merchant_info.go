// 自动生成模板MerchantInfo
package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
)

// 商户信息 结构体  MerchantInfo
type MerchantInfo struct {
	global.GVA_MODEL
	MchNo     string     `json:"mch_no" form:"mch_no" gorm:"primarykey;column:mch_no;comment:商户号;size:20;"`                   //商户号
	MchAcc    string     `json:"mch_acc" form:"mch_acc" gorm:"column:mach_acc;comment:商户账号;size:50;" binding:"required"`      //商户账号
	NickName  string     `json:"nick_name" form:"nick_name" gorm:"column:nick_name;comment:昵称;size:50;" binding:"required"`   //昵称
	AgencyId  string     `json:"agency_id" form:"agency_id" gorm:"column:agency_id;comment:上级代理;size:10;" binding:"required"` //上级代理
	Remark    string     `json:"remark" form:"remark" gorm:"column:remark;comment:备注;size:100;"`                              //备注
	ApiKey    string     `json:"api_key" form:"api_key" gorm:"column:api_key;comment:Api秘钥;size:128;"`                        //Api秘钥
	Balance   *float64   `json:"balance" form:"balance" gorm:"default:0.0;column:balance;comment:余额;"`                        //余额
	Enable    *int       `json:"enable" form:"enable" gorm:"default:1;column:enable;comment:启用;"`                             //启用
	LastLogin *time.Time `json:"last_login" form:"last_login" gorm:"column:last_login;comment:最后登录;"`                         //最后登录
	LoginIp   string     `json:"login_ip" form:"login_ip" gorm:"column:login_ip;comment:登录IP;size:20;"`                       //登录IP
}

// TableName 商户信息 MerchantInfo自定义表名 merchant_info
func (MerchantInfo) TableName() string {
	return "merchant_info"
}
