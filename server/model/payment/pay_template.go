// 自动生成模板PayTemplate
package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
	
)

// 通道模板 结构体  PayTemplate
type PayTemplate struct {
 global.GVA_MODEL 
      TemplateName  string `json:"template_name" form:"template_name" gorm:"column:template_name;comment:模板名称;size:50;" binding:"required"`  //模板名称 
      MchNo  string `json:"mch_no" form:"mch_no" gorm:"column:mch_no;comment:商户号;size:50;" binding:"required"`  //商户号 
      MchAcc  string `json:"mch_acc" form:"mch_acc" gorm:"column:mch_acc;comment:商户登录账号;size:50;"`  //商户名 
      AppId  string `json:"app_id" form:"app_id" gorm:"column:app-Id;comment:AppId;size:128;"`  //AppId 
      SignType  string `json:"sign_type" form:"sign_type" gorm:"column:sign_type;comment:签名类型;" binding:"required"`  //签名类型 
      Md5Key  string `json:"md5_key" form:"md5_key" gorm:"column:md5_key;comment:MD5秘钥;size:128;"`  //MD5秘钥 
      RsaPub  string `json:"rsa_pub" form:"rsa_pub" gorm:"column:rsa_pub;comment:RSA公钥;size:512;"`  //RSA公钥 
      RsaPriv  string `json:"rsa_priv" form:"rsa_priv" gorm:"column:rsa_priv;comment:RSA私钥;size:512;"`  //RSA私钥 
      OrderUrl  string `json:"order_url" form:"order_url" gorm:"column:order_url;comment:下单接口;size:256;" binding:"required"`  //下单接口 
      QueryUrl  string `json:"query_url" form:"query_url" gorm:"column:query_url;comment:查单接口;size:256;"`  //查单接口 
      CallbackIP  string `json:"callback_ip" form:"callback_ip" gorm:"column:callback_ip;comment:回调IP;size:128;"`  //回调IP 
      SubjectTitle  string `json:"subject_title" form:"subject_title" gorm:"column:subject_title;comment:商品标题;size:50;"`  //商品标题 
      SubjectDesc  string `json:"subject_desc" form:"subject_desc" gorm:"column:subject_desc;comment:商品描述;size:50;"`  //商品描述 
      Remark  string `json:"remark" form:"remark" gorm:"column:remark;comment:备注;size:128;"`  //备注 
      SuccessStatus  string `json:"success_status" form:"success_status" gorm:"column:success_status;comment:订单成功编码;size:20;" binding:"required"`  //订单成功编码 
      CallbackStr  string `json:"callback_str" form:"callback_str" gorm:"column:callback_str;comment:订单成功返回;size:20;" binding:"required"`  //回调成功返回 
      RequestType  string `json:"request_type" form:"request_type" gorm:"column:request_type;comment:调用类型;" binding:"required"`  //调用类型 
      CallbackType  string `json:"callback_type" form:"callback_type" gorm:"column:callback_type;comment:回调类型;" binding:"required"`  //回调类型 
      OrderFields  string `json:"order_fields" form:"order_fields" gorm:"column:order_fields;comment:下单参数;type:text;" binding:"required"`  //下单参数 
      QueryFields  string `json:"query_fields" form:"query_fields" gorm:"column:query_fields;comment:查单参数;type:text;"`  //查单参数 
      CallbackFields  string `json:"callback_fields" form:"callback_fields" gorm:"column:callback_fields;comment:回调参数;type:text;" binding:"required"`  //回调参数 
      OrderResponse  string `json:"order_response" form:"order_response" gorm:"column:order_response;comment:下单返回参数;type:text;" binding:"required"`  //下单返回参数 
      QueryResponse  string `json:"query_response" form:"query_response" gorm:"column:query_response;comment:查单返回参数;type:text;"`  //查单返回参数 
      AmountType  string `json:"amount_type" form:"amount_type" gorm:"column:amount_type;comment:金额类型;" binding:"required"`  //金额类型 
}


// TableName 通道模板 PayTemplate自定义表名 pay_template
func (PayTemplate) TableName() string {
  return "pay_template"
}

