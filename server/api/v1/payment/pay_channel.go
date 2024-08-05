package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/payment"
	paymentReq "github.com/flipped-aurora/gin-vue-admin/server/model/payment/request"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type PayChannelApi struct {
}

// CreatePayChannel 创建支付通道
// @Tags PayChannel
// @Summary 创建支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayChannel true "创建支付通道"
// @Success 200 {object} response.Response{msg=string} "创建成功"
// @Router /pay_channel/createPayChannel [post]
func (pay_channelApi *PayChannelApi) CreatePayChannel(c *gin.Context) {
	var pay_channel payment.PayChannel
	err := c.ShouldBindJSON(&pay_channel)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := pay_channelService.CreatePayChannel(&pay_channel); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePayChannel 删除支付通道
// @Tags PayChannel
// @Summary 删除支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayChannel true "删除支付通道"
// @Success 200 {object} response.Response{msg=string} "删除成功"
// @Router /pay_channel/deletePayChannel [delete]
func (pay_channelApi *PayChannelApi) DeletePayChannel(c *gin.Context) {
	ID := c.Query("ID")
	if err := pay_channelService.DeletePayChannel(ID); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePayChannelByIds 批量删除支付通道
// @Tags PayChannel
// @Summary 批量删除支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Success 200 {object} response.Response{msg=string} "批量删除成功"
// @Router /pay_channel/deletePayChannelByIds [delete]
func (pay_channelApi *PayChannelApi) DeletePayChannelByIds(c *gin.Context) {
	IDs := c.QueryArray("IDs[]")
	if err := pay_channelService.DeletePayChannelByIds(IDs); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePayChannel 更新支付通道
// @Tags PayChannel
// @Summary 更新支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayChannel true "更新支付通道"
// @Success 200 {object} response.Response{msg=string} "更新成功"
// @Router /pay_channel/updatePayChannel [put]
func (pay_channelApi *PayChannelApi) UpdatePayChannel(c *gin.Context) {
	var pay_channel payment.PayChannel
	err := c.ShouldBindJSON(&pay_channel)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := pay_channelService.UpdatePayChannel(pay_channel); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPayChannel 用id查询支付通道
// @Tags PayChannel
// @Summary 用id查询支付通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query payment.PayChannel true "用id查询支付通道"
// @Success 200 {object} response.Response{data=object{repay_channel=payment.PayChannel},msg=string} "查询成功"
// @Router /pay_channel/findPayChannel [get]
func (pay_channelApi *PayChannelApi) FindPayChannel(c *gin.Context) {
	ID := c.Query("ID")
	if repay_channel, err := pay_channelService.GetPayChannel(ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"repay_channel": repay_channel}, c)
	}
}

// GetPayChannelList 分页获取支付通道列表
// @Tags PayChannel
// @Summary 分页获取支付通道列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query paymentReq.PayChannelSearch true "分页获取支付通道列表"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "获取成功"
// @Router /pay_channel/getPayChannelList [get]
func (pay_channelApi *PayChannelApi) GetPayChannelList(c *gin.Context) {
	var pageInfo paymentReq.PayChannelSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := pay_channelService.GetPayChannelInfoList(pageInfo); err != nil {
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

// GetPayChannelPublic 不需要鉴权的支付通道接口
// @Tags PayChannel
// @Summary 不需要鉴权的支付通道接口
// @accept application/json
// @Produce application/json
// @Param data query paymentReq.PayChannelSearch true "分页获取支付通道列表"
// @Success 200 {object} response.Response{data=object,msg=string} "获取成功"
// @Router /pay_channel/getPayChannelPublic [get]
func (pay_channelApi *PayChannelApi) GetPayChannelPublic(c *gin.Context) {
	// 此接口不需要鉴权
	// 示例为返回了一个固定的消息接口，一般本接口用于C端服务，需要自己实现业务逻辑
	response.OkWithDetailed(gin.H{
		"info": "不需要鉴权的支付通道接口信息",
	}, "获取成功", c)
}
