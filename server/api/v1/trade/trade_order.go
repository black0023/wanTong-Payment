package trade

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/trade"
    tradeReq "github.com/flipped-aurora/gin-vue-admin/server/model/trade/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
)

type TradeOrderApi struct {
}

var trade_orderService = service.ServiceGroupApp.TradeServiceGroup.TradeOrderService


// CreateTradeOrder 创建交易订单
// @Tags TradeOrder
// @Summary 创建交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body trade.TradeOrder true "创建交易订单"
// @Success 200 {object} response.Response{msg=string} "创建成功"
// @Router /trade_order/createTradeOrder [post]
func (trade_orderApi *TradeOrderApi) CreateTradeOrder(c *gin.Context) {
	var trade_order trade.TradeOrder
	err := c.ShouldBindJSON(&trade_order)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := trade_orderService.CreateTradeOrder(&trade_order); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteTradeOrder 删除交易订单
// @Tags TradeOrder
// @Summary 删除交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body trade.TradeOrder true "删除交易订单"
// @Success 200 {object} response.Response{msg=string} "删除成功"
// @Router /trade_order/deleteTradeOrder [delete]
func (trade_orderApi *TradeOrderApi) DeleteTradeOrder(c *gin.Context) {
	ID := c.Query("ID")
	if err := trade_orderService.DeleteTradeOrder(ID); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteTradeOrderByIds 批量删除交易订单
// @Tags TradeOrder
// @Summary 批量删除交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Success 200 {object} response.Response{msg=string} "批量删除成功"
// @Router /trade_order/deleteTradeOrderByIds [delete]
func (trade_orderApi *TradeOrderApi) DeleteTradeOrderByIds(c *gin.Context) {
	IDs := c.QueryArray("IDs[]")
	if err := trade_orderService.DeleteTradeOrderByIds(IDs); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateTradeOrder 更新交易订单
// @Tags TradeOrder
// @Summary 更新交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body trade.TradeOrder true "更新交易订单"
// @Success 200 {object} response.Response{msg=string} "更新成功"
// @Router /trade_order/updateTradeOrder [put]
func (trade_orderApi *TradeOrderApi) UpdateTradeOrder(c *gin.Context) {
	var trade_order trade.TradeOrder
	err := c.ShouldBindJSON(&trade_order)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := trade_orderService.UpdateTradeOrder(trade_order); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindTradeOrder 用id查询交易订单
// @Tags TradeOrder
// @Summary 用id查询交易订单
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query trade.TradeOrder true "用id查询交易订单"
// @Success 200 {object} response.Response{data=object{retrade_order=trade.TradeOrder},msg=string} "查询成功"
// @Router /trade_order/findTradeOrder [get]
func (trade_orderApi *TradeOrderApi) FindTradeOrder(c *gin.Context) {
	ID := c.Query("ID")
	if retrade_order, err := trade_orderService.GetTradeOrder(ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"retrade_order": retrade_order}, c)
	}
}

// GetTradeOrderList 分页获取交易订单列表
// @Tags TradeOrder
// @Summary 分页获取交易订单列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query tradeReq.TradeOrderSearch true "分页获取交易订单列表"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "获取成功"
// @Router /trade_order/getTradeOrderList [get]
func (trade_orderApi *TradeOrderApi) GetTradeOrderList(c *gin.Context) {
	var pageInfo tradeReq.TradeOrderSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := trade_orderService.GetTradeOrderInfoList(pageInfo); err != nil {
	    global.GVA_LOG.Error("获取失败!", zap.Error(err))
        response.FailWithMessage("获取失败", c)
    } else {
        response.OkWithDetailed(response.PageResult{
            List:     list,
            Total:    total,
            Page:     pageInfo.Page,
            PageSize: pageInfo.PageSize,
        }, "获取成功", c)
    }
}

// GetTradeOrderPublic 不需要鉴权的交易订单接口
// @Tags TradeOrder
// @Summary 不需要鉴权的交易订单接口
// @accept application/json
// @Produce application/json
// @Param data query tradeReq.TradeOrderSearch true "分页获取交易订单列表"
// @Success 200 {object} response.Response{data=object,msg=string} "获取成功"
// @Router /trade_order/getTradeOrderPublic [get]
func (trade_orderApi *TradeOrderApi) GetTradeOrderPublic(c *gin.Context) {
    // 此接口不需要鉴权
    // 示例为返回了一个固定的消息接口，一般本接口用于C端服务，需要自己实现业务逻辑
    response.OkWithDetailed(gin.H{
       "info": "不需要鉴权的交易订单接口信息",
    }, "获取成功", c)
}
