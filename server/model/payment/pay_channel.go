// 自动生成模板PayChannel
package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// 支付通道 结构体  PayChannel
type PayChannel struct {
	global.GVA_MODEL
	ChannelName string   `json:"channel_name" form:"channel_name" gorm:"column:channel_name;comment:通道名称;size:50;" binding:"required"` //通道名称
	ProductId   string   `json:"product_id" form:"product_id" gorm:"column:product_id;comment:产品ID;size:20;" binding:"required"`       //产品ID
	TemplateId  string   `json:"template_id" form:"template_id" gorm:"column:template_id;comment:通道模板ID;size:20;" binding:"required"`  //通道模板ID
	PaymentCode string   `json:"payment_code" form:"payment_code" gorm:"column:payment_code;comment:支付编码;size:20;" binding:"required"` //支付编码
	AmountRange string   `json:"amount_range" form:"amount_range" gorm:"column:amount_range;comment:金额范围;size:200;"`                   //金额范围
	PayFee      *float64 `json:"fee" form:"fee" gorm:"column:fee;comment:通道费率;"`                                                       //通道费率
	Remark      string   `json:"remark" form:"remark" gorm:"column:remark;comment:备注;size:100;"`                                       //备注
	Enable      *int     `json:"enable" form:"enable" gorm:"default:1;column:enable;comment:启用;"`                                      //启用
}

// TableName 支付通道 PayChannel自定义表名 pay_channel
func (PayChannel) TableName() string {
	return "pay_channel"
}
