package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/payment"
	paymentReq "github.com/flipped-aurora/gin-vue-admin/server/model/payment/request"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type PayTemplateApi struct {
}

// CreatePayTemplate 创建通道模板
// @Tags PayTemplate
// @Summary 创建通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayTemplate true "创建通道模板"
// @Success 200 {object} response.Response{msg=string} "创建成功"
// @Router /pay_template/createPayTemplate [post]
func (pay_templateApi *PayTemplateApi) CreatePayTemplate(c *gin.Context) {
	var pay_template payment.PayTemplate
	err := c.ShouldBindJSON(&pay_template)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := pay_templateService.CreatePayTemplate(&pay_template); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePayTemplate 删除通道模板
// @Tags PayTemplate
// @Summary 删除通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayTemplate true "删除通道模板"
// @Success 200 {object} response.Response{msg=string} "删除成功"
// @Router /pay_template/deletePayTemplate [delete]
func (pay_templateApi *PayTemplateApi) DeletePayTemplate(c *gin.Context) {
	ID := c.Query("ID")
	if err := pay_templateService.DeletePayTemplate(ID); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePayTemplateByIds 批量删除通道模板
// @Tags PayTemplate
// @Summary 批量删除通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Success 200 {object} response.Response{msg=string} "批量删除成功"
// @Router /pay_template/deletePayTemplateByIds [delete]
func (pay_templateApi *PayTemplateApi) DeletePayTemplateByIds(c *gin.Context) {
	IDs := c.QueryArray("IDs[]")
	if err := pay_templateService.DeletePayTemplateByIds(IDs); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePayTemplate 更新通道模板
// @Tags PayTemplate
// @Summary 更新通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayTemplate true "更新通道模板"
// @Success 200 {object} response.Response{msg=string} "更新成功"
// @Router /pay_template/updatePayTemplate [put]
func (pay_templateApi *PayTemplateApi) UpdatePayTemplate(c *gin.Context) {
	var pay_template payment.PayTemplate
	err := c.ShouldBindJSON(&pay_template)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if err := pay_templateService.UpdatePayTemplate(pay_template); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPayTemplate 用id查询通道模板
// @Tags PayTemplate
// @Summary 用id查询通道模板
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query payment.PayTemplate true "用id查询通道模板"
// @Success 200 {object} response.Response{data=object{repay_template=payment.PayTemplate},msg=string} "查询成功"
// @Router /pay_template/findPayTemplate [get]
func (pay_templateApi *PayTemplateApi) FindPayTemplate(c *gin.Context) {
	ID := c.Query("ID")
	if repay_template, err := pay_templateService.GetPayTemplate(ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"repay_template": repay_template}, c)
	}
}

// GetPayTemplateList 分页获取通道模板列表
// @Tags PayTemplate
// @Summary 分页获取通道模板列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query paymentReq.PayTemplateSearch true "分页获取通道模板列表"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "获取成功"
// @Router /pay_template/getPayTemplateList [get]
func (pay_templateApi *PayTemplateApi) GetPayTemplateList(c *gin.Context) {
	var pageInfo paymentReq.PayTemplateSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := pay_templateService.GetPayTemplateInfoList(pageInfo); err != nil {
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

// GetPayTemplatePublic 不需要鉴权的通道模板接口
// @Tags PayTemplate
// @Summary 不需要鉴权的通道模板接口
// @accept application/json
// @Produce application/json
// @Param data query paymentReq.PayTemplateSearch true "分页获取通道模板列表"
// @Success 200 {object} response.Response{data=object,msg=string} "获取成功"
// @Router /pay_template/getPayTemplatePublic [get]
func (pay_templateApi *PayTemplateApi) GetPayTemplatePublic(c *gin.Context) {
	// 此接口不需要鉴权
	// 示例为返回了一个固定的消息接口，一般本接口用于C端服务，需要自己实现业务逻辑
	response.OkWithDetailed(gin.H{
		"info": "不需要鉴权的通道模板接口信息",
	}, "获取成功", c)
}
