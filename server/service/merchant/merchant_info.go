package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/merchant"
	merchantReq "github.com/flipped-aurora/gin-vue-admin/server/model/merchant/request"
)

type MerchantInfoService struct {
}

// CreateMerchantInfo 创建商户信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantInfoService *MerchantInfoService) CreateMerchantInfo(merchantInfo *merchant.MerchantInfo) (err error) {
	err = global.GVA_DB.Create(merchantInfo).Error
	return err
}

// DeleteMerchantInfo 删除商户信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantInfoService *MerchantInfoService) DeleteMerchantInfo(ID string) (err error) {
	err = global.GVA_DB.Delete(&merchant.MerchantInfo{}, "id = ?", ID).Error
	return err
}

// DeleteMerchantInfoByIds 批量删除商户信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantInfoService *MerchantInfoService) DeleteMerchantInfoByIds(IDs []string) (err error) {
	err = global.GVA_DB.Delete(&[]merchant.MerchantInfo{}, "id in ?", IDs).Error
	return err
}

// UpdateMerchantInfo 更新商户信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantInfoService *MerchantInfoService) UpdateMerchantInfo(merchantInfo merchant.MerchantInfo) (err error) {
	err = global.GVA_DB.Model(&merchant.MerchantInfo{}).Where("id = ?", merchantInfo.ID).Updates(&merchantInfo).Error
	return err
}

// GetMerchantInfo 根据ID获取商户信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantInfoService *MerchantInfoService) GetMerchantInfo(ID string) (merchantInfo merchant.MerchantInfo, err error) {
	err = global.GVA_DB.Where("id = ?", ID).First(&merchantInfo).Error
	return
}

func (merchantInfoService *MerchantInfoService) GetMerchantInfoByMchNo(mchNo string) (merchantInfo merchant.MerchantInfo, err error) {
	err = global.GVA_DB.Where("mch_no = ?", mchNo).First(&merchantInfo).Error
	return
}

func (merchantInfoService *MerchantInfoService) GetMerchantInfoCountByMchNo(mchNo string) int {
	mchCount := int64(0)
	db := global.GVA_DB.Model(&merchant.MerchantInfo{})
	db = db.Where("mch_no = ?", mchNo)
	_ = db.Count(&mchCount).Error
	return int(mchCount)
}

// GetMerchantInfoInfoList 分页获取商户信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantInfoService *MerchantInfoService) GetMerchantInfoInfoList(info merchantReq.MerchantInfoSearch) (list []merchant.MerchantInfo, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&merchant.MerchantInfo{})
	var merchantInfos []merchant.MerchantInfo
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	if info.MchNo != "" {
		db = db.Where("mch_no = ?", info.MchNo)
	}
	if info.MchAcc != "" {
		db = db.Where("mach_acc = ?", info.MchAcc)
	}
	if info.NickName != "" {
		db = db.Where("nick_name LIKE ?", "%"+info.NickName+"%")
	}
	if info.AgencyId != "" {
		db = db.Where("agency_id = ?", info.AgencyId)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	if limit != 0 {
		db = db.Limit(limit).Offset(offset)
	}

	err = db.Find(&merchantInfos).Error
	return merchantInfos, total, err
}
