package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/payment"
    paymentReq "github.com/flipped-aurora/gin-vue-admin/server/model/payment/request"
    "gorm.io/gorm"
)

type PayProductService struct {
}

// CreatePayProduct 创建支付产品记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_productService *PayProductService) CreatePayProduct(pay_product *payment.PayProduct) (err error) {
	err = global.GVA_DB.Create(pay_product).Error
	return err
}

// DeletePayProduct 删除支付产品记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_productService *PayProductService)DeletePayProduct(ID string,userID uint) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
	    if err := tx.Model(&payment.PayProduct{}).Where("id = ?", ID).Update("deleted_by", userID).Error; err != nil {
              return err
        }
        if err = tx.Delete(&payment.PayProduct{},"id = ?",ID).Error; err != nil {
              return err
        }
        return nil
	})
	return err
}

// DeletePayProductByIds 批量删除支付产品记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_productService *PayProductService)DeletePayProductByIds(IDs []string,deleted_by uint) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
	    if err := tx.Model(&payment.PayProduct{}).Where("id in ?", IDs).Update("deleted_by", deleted_by).Error; err != nil {
            return err
        }
        if err := tx.Where("id in ?", IDs).Delete(&payment.PayProduct{}).Error; err != nil {
            return err
        }
        return nil
    })
	return err
}

// UpdatePayProduct 更新支付产品记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_productService *PayProductService)UpdatePayProduct(pay_product payment.PayProduct) (err error) {
	err = global.GVA_DB.Model(&payment.PayProduct{}).Where("id = ?",pay_product.ID).Updates(&pay_product).Error
	return err
}

// GetPayProduct 根据ID获取支付产品记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_productService *PayProductService)GetPayProduct(ID string) (pay_product payment.PayProduct, err error) {
	err = global.GVA_DB.Where("id = ?", ID).First(&pay_product).Error
	return
}

// GetPayProductInfoList 分页获取支付产品记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_productService *PayProductService)GetPayProductInfoList(info paymentReq.PayProductSearch) (list []payment.PayProduct, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&payment.PayProduct{})
    var pay_products []payment.PayProduct
    // 如果有条件搜索 下方会自动创建搜索语句
    if info.StartCreatedAt !=nil && info.EndCreatedAt !=nil {
     db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
    }
    if info.PayName != "" {
        db = db.Where("pay_name = ?",info.PayName)
    }
    if info.PayCode != "" {
        db = db.Where("pay_code = ?",info.PayCode)
    }
    if info.Enable != nil {
        db = db.Where("enable = ?",info.Enable)
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }

	if limit != 0 {
       db = db.Limit(limit).Offset(offset)
    }
	
	err = db.Find(&pay_products).Error
	return  pay_products, total, err
}