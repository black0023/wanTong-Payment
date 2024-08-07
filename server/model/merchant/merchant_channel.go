// 自动生成模板MerchantChannel
package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
	
)

// 商户通道 结构体  MerchantChannel
type MerchantChannel struct {
 global.GVA_MODEL 
      MchNo  string `json:"mch_no" form:"mch_no" gorm:"column:mch_no;comment:商户号;size:20;" binding:"required"`  //商户号 
      PayChannel  string `json:"pay_channel" form:"pay_channel" gorm:"column:pay_channel;comment:支付通道;size:20;" binding:"required"`  //支付通道 
      PayCode  string `json:"pay_code" form:"pay_code" gorm:"column:pay_code;comment:通道编码;size:20;" binding:"required"`  //通道编码 
      Fee  *float64 `json:"fee" form:"fee" gorm:"column:fee;comment:通道费率;" binding:"required"`  //通道费率 
      Enable  *int `json:"enable" form:"enable" gorm:"column:enable;comment:启用;" binding:"required"`  //启用 
}


// TableName 商户通道 MerchantChannel自定义表名 merchant_channel
func (MerchantChannel) TableName() string {
  return "merchant_channel"
}

