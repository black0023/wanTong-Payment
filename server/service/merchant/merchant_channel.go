package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/merchant"
	merchantReq "github.com/flipped-aurora/gin-vue-admin/server/model/merchant/request"
)

type MerchantChannelService struct {
}

// CreateMerchantChannel 创建商户通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchant_channelService *MerchantChannelService) CreateMerchantChannel(merchant_channel *merchant.MerchantChannel) (err error) {
	err = global.GVA_DB.Create(merchant_channel).Error
	return err
}

// DeleteMerchantChannel 删除商户通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchant_channelService *MerchantChannelService) DeleteMerchantChannel(ID string) (err error) {
	err = global.GVA_DB.Delete(&merchant.MerchantChannel{}, "id = ?", ID).Error
	return err
}

// DeleteMerchantChannelByIds 批量删除商户通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchant_channelService *MerchantChannelService) DeleteMerchantChannelByIds(IDs []string) (err error) {
	err = global.GVA_DB.Delete(&[]merchant.MerchantChannel{}, "id in ?", IDs).Error
	return err
}

func (merchant_channelService *MerchantChannelService) DeleteMerchantAllChannel(mchNo string) (err error) {
	err = global.GVA_DB.Delete(&[]merchant.MerchantChannel{}, "mch_no = ?", mchNo).Error
	return err
}

// UpdateMerchantChannel 更新商户通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchant_channelService *MerchantChannelService) UpdateMerchantChannel(merchant_channel merchant.MerchantChannel) (err error) {
	err = global.GVA_DB.Model(&merchant.MerchantChannel{}).Where("id = ?", merchant_channel.ID).Updates(&merchant_channel).Error
	return err
}

// GetMerchantChannel 根据ID获取商户通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchant_channelService *MerchantChannelService) GetMerchantChannel(ID string) (merchant_channel merchant.MerchantChannel, err error) {
	err = global.GVA_DB.Where("id = ?", ID).First(&merchant_channel).Error
	return
}

// GetMerchantChannelInfoList 分页获取商户通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchant_channelService *MerchantChannelService) GetMerchantChannelInfoList(info merchantReq.MerchantChannelSearch) (list []merchant.MerchantChannel, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&merchant.MerchantChannel{})
	var merchant_channels []merchant.MerchantChannel
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	if info.MchNo != "" {
		db = db.Where("mch_no = ?", info.MchNo)
	}
	if info.PayChannel != "" {
		db = db.Where("pay_channel = ?", info.PayChannel)
	}
	if info.PayCode != "" {
		db = db.Where("pay_code = ?", info.PayCode)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	if limit != 0 {
		db = db.Limit(limit).Offset(offset)
	}

	err = db.Find(&merchant_channels).Error
	return merchant_channels, total, err
}
