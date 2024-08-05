package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/payment"
    paymentReq "github.com/flipped-aurora/gin-vue-admin/server/model/payment/request"
)

type PayTemplateService struct {
}

// CreatePayTemplate 创建通道模板记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_templateService *PayTemplateService) CreatePayTemplate(pay_template *payment.PayTemplate) (err error) {
	err = global.GVA_DB.Create(pay_template).Error
	return err
}

// DeletePayTemplate 删除通道模板记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_templateService *PayTemplateService)DeletePayTemplate(ID string) (err error) {
	err = global.GVA_DB.Delete(&payment.PayTemplate{},"id = ?",ID).Error
	return err
}

// DeletePayTemplateByIds 批量删除通道模板记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_templateService *PayTemplateService)DeletePayTemplateByIds(IDs []string) (err error) {
	err = global.GVA_DB.Delete(&[]payment.PayTemplate{},"id in ?",IDs).Error
	return err
}

// UpdatePayTemplate 更新通道模板记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_templateService *PayTemplateService)UpdatePayTemplate(pay_template payment.PayTemplate) (err error) {
	err = global.GVA_DB.Model(&payment.PayTemplate{}).Where("id = ?",pay_template.ID).Updates(&pay_template).Error
	return err
}

// GetPayTemplate 根据ID获取通道模板记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_templateService *PayTemplateService)GetPayTemplate(ID string) (pay_template payment.PayTemplate, err error) {
	err = global.GVA_DB.Where("id = ?", ID).First(&pay_template).Error
	return
}

// GetPayTemplateInfoList 分页获取通道模板记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_templateService *PayTemplateService)GetPayTemplateInfoList(info paymentReq.PayTemplateSearch) (list []payment.PayTemplate, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&payment.PayTemplate{})
    var pay_templates []payment.PayTemplate
    // 如果有条件搜索 下方会自动创建搜索语句
    if info.StartCreatedAt !=nil && info.EndCreatedAt !=nil {
     db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
    }
    if info.TemplateName != "" {
        db = db.Where("template_name = ?",info.TemplateName)
    }
    if info.MchNo != "" {
        db = db.Where("mch_no = ?",info.MchNo)
    }
    if info.AppId != "" {
        db = db.Where("app-Id = ?",info.AppId)
    }
    if info.Md5Key != "" {
        db = db.Where("md5_key = ?",info.Md5Key)
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }

	if limit != 0 {
       db = db.Limit(limit).Offset(offset)
    }
	
	err = db.Find(&pay_templates).Error
	return  pay_templates, total, err
}