package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/payment"
	paymentReq "github.com/flipped-aurora/gin-vue-admin/server/model/payment/request"
)

type PayChannelService struct {
}

// CreatePayChannel 创建支付通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_channelService *PayChannelService) CreatePayChannel(pay_channel *payment.PayChannel) (err error) {
	err = global.GVA_DB.Create(pay_channel).Error
	return err
}

// DeletePayChannel 删除支付通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_channelService *PayChannelService) DeletePayChannel(ID string) (err error) {
	err = global.GVA_DB.Delete(&payment.PayChannel{}, "id = ?", ID).Error
	return err
}

// DeletePayChannelByIds 批量删除支付通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_channelService *PayChannelService) DeletePayChannelByIds(IDs []string) (err error) {
	err = global.GVA_DB.Delete(&[]payment.PayChannel{}, "id in ?", IDs).Error
	return err
}

// UpdatePayChannel 更新支付通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_channelService *PayChannelService) UpdatePayChannel(pay_channel payment.PayChannel) (err error) {
	err = global.GVA_DB.Model(&payment.PayChannel{}).Where("id = ?", pay_channel.ID).Updates(&pay_channel).Error
	return err
}

// GetPayChannel 根据ID获取支付通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_channelService *PayChannelService) GetPayChannel(ID string) (pay_channel payment.PayChannel, err error) {
	err = global.GVA_DB.Where("id = ?", ID).First(&pay_channel).Error
	return
}

func (pay_channelService *PayChannelService) GetCountByProductId(ID string) (int64, error) {
	channelCount := int64(0)
	db := global.GVA_DB.Model(&payment.PayChannel{})
	db = db.Where("product_id = ? AND enable = 1", ID)
	err := db.Count(&channelCount).Error
	return channelCount, err
}

// GetPayChannelInfoList 分页获取支付通道记录
// Author [piexlmax](https://github.com/piexlmax)
func (pay_channelService *PayChannelService) GetPayChannelInfoList(info paymentReq.PayChannelSearch) (list []payment.PayChannel, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&payment.PayChannel{})
	var pay_channels []payment.PayChannel
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	if info.ChannelName != "" {
		db = db.Where("channel_name LIKE ?", "%"+info.ChannelName+"%")
	}
	if info.ProductId != nil {
		db = db.Where("product_id = ?", info.ProductId)
	}
	if info.TemplateId != nil {
		db = db.Where("template_id = ?", info.TemplateId)
	}
	if info.PaymentCode != "" {
		db = db.Where("payment_code = ?", info.PaymentCode)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	if limit != 0 {
		db = db.Limit(limit).Offset(offset)
	}

	err = db.Find(&pay_channels).Error
	return pay_channels, total, err
}
