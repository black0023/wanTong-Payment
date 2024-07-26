package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/merchant"
	merchantReq "github.com/flipped-aurora/gin-vue-admin/server/model/merchant/request"
	"github.com/flipped-aurora/gin-vue-admin/server/payCommon"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type MerchantInfoApi struct {
}

var merchantInfoService = service.ServiceGroupApp.MerchantServiceGroup.MerchantInfoService

// CreateMerchantInfo 创建商户信息
// @Tags MerchantInfo
// @Summary 创建商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.MerchantInfo true "创建商户信息"
// @Success 200 {object} response.Response{msg=string} "创建成功"
// @Router /merchantInfo/createMerchantInfo [post]
func (merchantInfoApi *MerchantInfoApi) CreateMerchantInfo(c *gin.Context) {
	var merchantInfo merchant.MerchantInfo
	err := c.ShouldBindJSON(&merchantInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	mchNo := ""
	for {
		mchNo = payCommon.RandomMerchantNo()
		if merchantInfoService.GetMerchantInfoCountByMchNo(mchNo) <= 0 {
			break
		}
	}

	baseEnable := true
	baseBalance := 0.0

	merchantInfo.MchNo = mchNo
	merchantInfo.Password = utils.BcryptHash("Aa123456")
	merchantInfo.ApiKey = "fuck you"
	merchantInfo.Balance = &baseBalance
	merchantInfo.Enable = &baseEnable

	if err := merchantInfoService.CreateMerchantInfo(&merchantInfo); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteMerchantInfo 删除商户信息
// @Tags MerchantInfo
// @Summary 删除商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.MerchantInfo true "删除商户信息"
// @Success 200 {object} response.Response{msg=string} "删除成功"
// @Router /merchantInfo/deleteMerchantInfo [delete]
func (merchantInfoApi *MerchantInfoApi) DeleteMerchantInfo(c *gin.Context) {
	ID := c.Query("ID")
	if err := merchantInfoService.DeleteMerchantInfo(ID); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteMerchantInfoByIds 批量删除商户信息
// @Tags MerchantInfo
// @Summary 批量删除商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Success 200 {object} response.Response{msg=string} "批量删除成功"
// @Router /merchantInfo/deleteMerchantInfoByIds [delete]
func (merchantInfoApi *MerchantInfoApi) DeleteMerchantInfoByIds(c *gin.Context) {
	IDs := c.QueryArray("IDs[]")
	if err := merchantInfoService.DeleteMerchantInfoByIds(IDs); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateMerchantInfo 更新商户信息
// @Tags MerchantInfo
// @Summary 更新商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body merchant.MerchantInfo true "更新商户信息"
// @Success 200 {object} response.Response{msg=string} "更新成功"
// @Router /merchantInfo/updateMerchantInfo [put]
func (merchantInfoApi *MerchantInfoApi) UpdateMerchantInfo(c *gin.Context) {
	var merchantInfo merchant.MerchantInfo
	err := c.ShouldBindJSON(&merchantInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := merchantInfoService.UpdateMerchantInfo(merchantInfo); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindMerchantInfo 用id查询商户信息
// @Tags MerchantInfo
// @Summary 用id查询商户信息
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query merchant.MerchantInfo true "用id查询商户信息"
// @Success 200 {object} response.Response{data=object{remerchantInfo=merchant.MerchantInfo},msg=string} "查询成功"
// @Router /merchantInfo/findMerchantInfo [get]
func (merchantInfoApi *MerchantInfoApi) FindMerchantInfo(c *gin.Context) {
	ID := c.Query("ID")
	if remerchantInfo, err := merchantInfoService.GetMerchantInfo(ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"remerchantInfo": remerchantInfo}, c)
	}
}

// GetMerchantInfoList 分页获取商户信息列表
// @Tags MerchantInfo
// @Summary 分页获取商户信息列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query merchantReq.MerchantInfoSearch true "分页获取商户信息列表"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "获取成功"
// @Router /merchantInfo/getMerchantInfoList [get]
func (merchantInfoApi *MerchantInfoApi) GetMerchantInfoList(c *gin.Context) {
	var pageInfo merchantReq.MerchantInfoSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := merchantInfoService.GetMerchantInfoInfoList(pageInfo); err != nil {
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

// GetMerchantInfoPublic 不需要鉴权的商户信息接口
// @Tags MerchantInfo
// @Summary 不需要鉴权的商户信息接口
// @accept application/json
// @Produce application/json
// @Param data query merchantReq.MerchantInfoSearch true "分页获取商户信息列表"
// @Success 200 {object} response.Response{data=object,msg=string} "获取成功"
// @Router /merchantInfo/getMerchantInfoPublic [get]
func (merchantInfoApi *MerchantInfoApi) GetMerchantInfoPublic(c *gin.Context) {
	// 此接口不需要鉴权
	// 示例为返回了一个固定的消息接口，一般本接口用于C端服务，需要自己实现业务逻辑
	response.OkWithDetailed(gin.H{
		"info": "不需要鉴权的商户信息接口信息",
	}, "获取成功", c)
}
