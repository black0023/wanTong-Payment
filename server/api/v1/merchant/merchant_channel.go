package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/merchant"
	merchantReq "github.com/flipped-aurora/gin-vue-admin/server/model/merchant/request"
	"github.com/flipped-aurora/gin-vue-admin/server/payCommon"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type MerchantChannelApi struct {
}

var merchant_channelService = service.ServiceGroupApp.MerchantServiceGroup.MerchantChannelService

// CreateMerchantChannel 创建商户通道
// @Tags MerchantChannel
// @Summary 创建商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.MerchantChannel true "创建商户通道"
// @Success 200 {object} response.Response{msg=string} "创建成功"
// @Router /merchant_channel/createMerchantChannel [post]
func (merchant_channelApi *MerchantChannelApi) CreateMerchantChannel(c *gin.Context) {
	var merchant_channel merchant.MerchantChannel
	err := c.ShouldBindJSON(&merchant_channel)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := merchant_channelService.CreateMerchantChannel(&merchant_channel); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

func (merchant_channelApi *MerchantChannelApi) UpdateMerchantChannelList(c *gin.Context) {
	reqData := make(map[string]interface{})
	err := c.ShouldBindJSON(&reqData)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	mchNo := payCommon.GetMapString(reqData["mch_no"])

	if err := merchant_channelService.DeleteMerchantAllChannel(mchNo); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	channelList := reqData["channel_list"].([]interface{})
	for i := 0; i < len(channelList); i++ {
		channelPacket := channelList[i].(map[string]interface{})
		channelId := payCommon.GetMapString(channelPacket["pay_channel"])
		payCode := payCommon.GetMapString(channelPacket["pay_code"])
		fee := payCommon.GetMapFloat(channelPacket["fee"])
		enable := payCommon.GetMapInt(channelPacket["enable"])

		merchantChannel := &merchant.MerchantChannel{
			MchNo:      mchNo,
			PayChannel: channelId,
			PayCode:    payCode,
			Fee:        &fee,
			Enable:     &enable,
		}

		if err := merchant_channelService.CreateMerchantChannel(merchantChannel); err != nil {
			global.GVA_LOG.Error("创建失败!", zap.Error(err))
			response.FailWithMessage("创建失败", c)
			return
		}
	}

	response.OkWithMessage("创建成功", c)
}

// DeleteMerchantChannel 删除商户通道
// @Tags MerchantChannel
// @Summary 删除商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.MerchantChannel true "删除商户通道"
// @Success 200 {object} response.Response{msg=string} "删除成功"
// @Router /merchant_channel/deleteMerchantChannel [delete]
func (merchant_channelApi *MerchantChannelApi) DeleteMerchantChannel(c *gin.Context) {
	ID := c.Query("ID")
	if err := merchant_channelService.DeleteMerchantChannel(ID); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteMerchantChannelByIds 批量删除商户通道
// @Tags MerchantChannel
// @Summary 批量删除商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Success 200 {object} response.Response{msg=string} "批量删除成功"
// @Router /merchant_channel/deleteMerchantChannelByIds [delete]
func (merchant_channelApi *MerchantChannelApi) DeleteMerchantChannelByIds(c *gin.Context) {
	IDs := c.QueryArray("IDs[]")
	if err := merchant_channelService.DeleteMerchantChannelByIds(IDs); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateMerchantChannel 更新商户通道
// @Tags MerchantChannel
// @Summary 更新商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.MerchantChannel true "更新商户通道"
// @Success 200 {object} response.Response{msg=string} "更新成功"
// @Router /merchant_channel/updateMerchantChannel [put]
func (merchant_channelApi *MerchantChannelApi) UpdateMerchantChannel(c *gin.Context) {
	var merchant_channel merchant.MerchantChannel
	err := c.ShouldBindJSON(&merchant_channel)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := merchant_channelService.UpdateMerchantChannel(merchant_channel); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindMerchantChannel 用id查询商户通道
// @Tags MerchantChannel
// @Summary 用id查询商户通道
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query merchant.MerchantChannel true "用id查询商户通道"
// @Success 200 {object} response.Response{data=object{remerchant_channel=merchant.MerchantChannel},msg=string} "查询成功"
// @Router /merchant_channel/findMerchantChannel [get]
func (merchant_channelApi *MerchantChannelApi) FindMerchantChannel(c *gin.Context) {
	ID := c.Query("ID")
	if remerchant_channel, err := merchant_channelService.GetMerchantChannel(ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"remerchant_channel": remerchant_channel}, c)
	}
}

// GetMerchantChannelList 分页获取商户通道列表
// @Tags MerchantChannel
// @Summary 分页获取商户通道列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query merchantReq.MerchantChannelSearch true "分页获取商户通道列表"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "获取成功"
// @Router /merchant_channel/getMerchantChannelList [get]
func (merchant_channelApi *MerchantChannelApi) GetMerchantChannelList(c *gin.Context) {
	var pageInfo merchantReq.MerchantChannelSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := merchant_channelService.GetMerchantChannelInfoList(pageInfo); err != nil {
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

// GetMerchantChannelPublic 不需要鉴权的商户通道接口
// @Tags MerchantChannel
// @Summary 不需要鉴权的商户通道接口
// @accept application/json
// @Produce application/json
// @Param data query merchantReq.MerchantChannelSearch true "分页获取商户通道列表"
// @Success 200 {object} response.Response{data=object,msg=string} "获取成功"
// @Router /merchant_channel/getMerchantChannelPublic [get]
func (merchant_channelApi *MerchantChannelApi) GetMerchantChannelPublic(c *gin.Context) {
	// 此接口不需要鉴权
	// 示例为返回了一个固定的消息接口，一般本接口用于C端服务，需要自己实现业务逻辑
	response.OkWithDetailed(gin.H{
		"info": "不需要鉴权的商户通道接口信息",
	}, "获取成功", c)
}
