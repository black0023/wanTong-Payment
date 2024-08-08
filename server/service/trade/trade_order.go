package trade

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/trade"
    tradeReq "github.com/flipped-aurora/gin-vue-admin/server/model/trade/request"
)

type TradeOrderService struct {
}

// CreateTradeOrder 创建交易订单记录
// Author [piexlmax](https://github.com/piexlmax)
func (trade_orderService *TradeOrderService) CreateTradeOrder(trade_order *trade.TradeOrder) (err error) {
	err = global.GVA_DB.Create(trade_order).Error
	return err
}

// DeleteTradeOrder 删除交易订单记录
// Author [piexlmax](https://github.com/piexlmax)
func (trade_orderService *TradeOrderService)DeleteTradeOrder(ID string) (err error) {
	err = global.GVA_DB.Delete(&trade.TradeOrder{},"id = ?",ID).Error
	return err
}

// DeleteTradeOrderByIds 批量删除交易订单记录
// Author [piexlmax](https://github.com/piexlmax)
func (trade_orderService *TradeOrderService)DeleteTradeOrderByIds(IDs []string) (err error) {
	err = global.GVA_DB.Delete(&[]trade.TradeOrder{},"id in ?",IDs).Error
	return err
}

// UpdateTradeOrder 更新交易订单记录
// Author [piexlmax](https://github.com/piexlmax)
func (trade_orderService *TradeOrderService)UpdateTradeOrder(trade_order trade.TradeOrder) (err error) {
	err = global.GVA_DB.Model(&trade.TradeOrder{}).Where("id = ?",trade_order.ID).Updates(&trade_order).Error
	return err
}

// GetTradeOrder 根据ID获取交易订单记录
// Author [piexlmax](https://github.com/piexlmax)
func (trade_orderService *TradeOrderService)GetTradeOrder(ID string) (trade_order trade.TradeOrder, err error) {
	err = global.GVA_DB.Where("id = ?", ID).First(&trade_order).Error
	return
}

// GetTradeOrderInfoList 分页获取交易订单记录
// Author [piexlmax](https://github.com/piexlmax)
func (trade_orderService *TradeOrderService)GetTradeOrderInfoList(info tradeReq.TradeOrderSearch) (list []trade.TradeOrder, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&trade.TradeOrder{})
    var trade_orders []trade.TradeOrder
    // 如果有条件搜索 下方会自动创建搜索语句
    if info.StartCreatedAt !=nil && info.EndCreatedAt !=nil {
     db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
    }
    if info.MchNo != "" {
        db = db.Where("mch_no = ?",info.MchNo)
    }
    if info.MchName != "" {
        db = db.Where("mch_name = ?",info.MchName)
    }
    if info.PlatformOrder != "" {
        db = db.Where("platform_order = ?",info.PlatformOrder)
    }
    if info.MerchantOrder != "" {
        db = db.Where("merchant_order = ?",info.MerchantOrder)
    }
    if info.ProductId != "" {
        db = db.Where("product_id = ?",info.ProductId)
    }
    if info.ChannelId != "" {
        db = db.Where("channel_id = ?",info.ChannelId)
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }

	if limit != 0 {
       db = db.Limit(limit).Offset(offset)
    }
	
	err = db.Find(&trade_orders).Error
	return  trade_orders, total, err
}