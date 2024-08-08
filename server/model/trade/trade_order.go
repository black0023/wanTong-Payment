// 自动生成模板TradeOrder
package trade

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
	
)

// 交易订单 结构体  TradeOrder
type TradeOrder struct {
 global.GVA_MODEL 
      MchNo  string `json:"mch_no" form:"mch_no" gorm:"column:mch_no;comment:商户号;size:20;" binding:"required"`  //商户号 
      MchName  string `json:"mch_name" form:"mch_name" gorm:"column:mch_name;comment:商户名;size:30;" binding:"required"`  //商户名 
      PlatformOrder  string `json:"platform_order" form:"platform_order" gorm:"column:platform_order;comment:平台订单号;size:50;" binding:"required"`  //平台订单号 
      MerchantOrder  string `json:"merchant_order" form:"merchant_order" gorm:"column:merchant_order;comment:商户订单号;size:50;" binding:"required"`  //商户订单号 
      ProductId  string `json:"product_id" form:"product_id" gorm:"column:product_id;comment:支付产品;size:10;" binding:"required"`  //支付产品 
      ProductCode  string `json:"product_code" form:"product_code" gorm:"column:product_code;comment:产品编码;size:10;" binding:"required"`  //产品编码 
      ChannelId  string `json:"channel_id" form:"channel_id" gorm:"column:channel_id;comment:通道ID;size:10;" binding:"required"`  //通道ID 
      ChannelCode  string `json:"channel_code" form:"channel_code" gorm:"column:channel_code;comment:通道编码;size:10;" binding:"required"`  //通道编码 
      Amount  *int `json:"amount" form:"amount" gorm:"column:amount;comment:金额;" binding:"required"`  //金额 
      Status  string `json:"status" form:"status" gorm:"column:status;comment:订单状态;" binding:"required"`  //订单状态 
      NotifyUrl  string `json:"notify_url" form:"notify_url" gorm:"column:notify_url;comment:回调地址;type:text;"`  //回调地址 
      ReturnUrl  string `json:"return_url" form:"return_url" gorm:"column:return_url;comment:跳转地址;type:text;"`  //跳转地址 
      ExtParam  string `json:"ext_param" form:"ext_param" gorm:"column:ext_param;comment:扩展参数;type:text;"`  //扩展参数 
      SuccessTime  *time.Time `json:"success_time" form:"success_time" gorm:"column:success_time;comment:成功时间;"`  //成功时间 
      CallbackTime  *time.Time `json:"callback_time" form:"callback_time" gorm:"column:callback_time;comment:回调时间;"`  //回调时间 
      CallbackCount  *int `json:"callback_count" form:"callback_count" gorm:"column:callback_count;comment:回调次数;"`  //回调次数 
      SubjectTit  string `json:"subject_tit" form:"subject_tit" gorm:"column:subject_tit;comment:商品标题;size:50;"`  //商品标题 
      SubjectDesc  string `json:"subject_desc" form:"subject_desc" gorm:"column:subject_desc;comment:商品描述;size:100;"`  //商品描述 
}


// TableName 交易订单 TradeOrder自定义表名 trade_order
func (TradeOrder) TableName() string {
  return "trade_order"
}

