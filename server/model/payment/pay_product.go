// 自动生成模板PayProduct
package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
	
)

// 支付产品 结构体  PayProduct
type PayProduct struct {
 global.GVA_MODEL 
      PayName  string `json:"pay_name" form:"pay_name" gorm:"column:pay_name;comment:产品名称;size:128;" binding:"required"`  //产品名称 
      PayCode  string `json:"pay_code" form:"pay_code" gorm:"column:pay_code;comment:产品编码;size:128;" binding:"required"`  //产品编码 
      Enable  *int `json:"enable" form:"enable" gorm:"default:1;column:enable;comment:启用;"`  //启用 
      CreatedBy  uint   `gorm:"column:created_by;comment:创建者"`
      UpdatedBy  uint   `gorm:"column:updated_by;comment:更新者"`
      DeletedBy  uint   `gorm:"column:deleted_by;comment:删除者"`
}


// TableName 支付产品 PayProduct自定义表名 pay_product
func (PayProduct) TableName() string {
  return "pay_product"
}

