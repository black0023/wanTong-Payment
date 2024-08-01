package payment

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/payment"
    paymentReq "github.com/flipped-aurora/gin-vue-admin/server/model/payment/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
    "github.com/flipped-aurora/gin-vue-admin/server/utils"
)

type PayProductApi struct {
}

var pay_productService = service.ServiceGroupApp.PaymentServiceGroup.PayProductService


// CreatePayProduct 创建支付产品
// @Tags PayProduct
// @Summary 创建支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayProduct true "创建支付产品"
// @Success 200 {object} response.Response{msg=string} "创建成功"
// @Router /pay_product/createPayProduct [post]
func (pay_productApi *PayProductApi) CreatePayProduct(c *gin.Context) {
	var pay_product payment.PayProduct
	err := c.ShouldBindJSON(&pay_product)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    pay_product.CreatedBy = utils.GetUserID(c)

	if err := pay_productService.CreatePayProduct(&pay_product); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePayProduct 删除支付产品
// @Tags PayProduct
// @Summary 删除支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayProduct true "删除支付产品"
// @Success 200 {object} response.Response{msg=string} "删除成功"
// @Router /pay_product/deletePayProduct [delete]
func (pay_productApi *PayProductApi) DeletePayProduct(c *gin.Context) {
	ID := c.Query("ID")
    	userID := utils.GetUserID(c)
	if err := pay_productService.DeletePayProduct(ID,userID); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePayProductByIds 批量删除支付产品
// @Tags PayProduct
// @Summary 批量删除支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Success 200 {object} response.Response{msg=string} "批量删除成功"
// @Router /pay_product/deletePayProductByIds [delete]
func (pay_productApi *PayProductApi) DeletePayProductByIds(c *gin.Context) {
	IDs := c.QueryArray("IDs[]")
    userID := utils.GetUserID(c)
	if err := pay_productService.DeletePayProductByIds(IDs,userID); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePayProduct 更新支付产品
// @Tags PayProduct
// @Summary 更新支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body payment.PayProduct true "更新支付产品"
// @Success 200 {object} response.Response{msg=string} "更新成功"
// @Router /pay_product/updatePayProduct [put]
func (pay_productApi *PayProductApi) UpdatePayProduct(c *gin.Context) {
	var pay_product payment.PayProduct
	err := c.ShouldBindJSON(&pay_product)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    pay_product.UpdatedBy = utils.GetUserID(c)

	if err := pay_productService.UpdatePayProduct(pay_product); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPayProduct 用id查询支付产品
// @Tags PayProduct
// @Summary 用id查询支付产品
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query payment.PayProduct true "用id查询支付产品"
// @Success 200 {object} response.Response{data=object{repay_product=payment.PayProduct},msg=string} "查询成功"
// @Router /pay_product/findPayProduct [get]
func (pay_productApi *PayProductApi) FindPayProduct(c *gin.Context) {
	ID := c.Query("ID")
	if repay_product, err := pay_productService.GetPayProduct(ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"repay_product": repay_product}, c)
	}
}

// GetPayProductList 分页获取支付产品列表
// @Tags PayProduct
// @Summary 分页获取支付产品列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query paymentReq.PayProductSearch true "分页获取支付产品列表"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "获取成功"
// @Router /pay_product/getPayProductList [get]
func (pay_productApi *PayProductApi) GetPayProductList(c *gin.Context) {
	var pageInfo paymentReq.PayProductSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := pay_productService.GetPayProductInfoList(pageInfo); err != nil {
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

// GetPayProductPublic 不需要鉴权的支付产品接口
// @Tags PayProduct
// @Summary 不需要鉴权的支付产品接口
// @accept application/json
// @Produce application/json
// @Param data query paymentReq.PayProductSearch true "分页获取支付产品列表"
// @Success 200 {object} response.Response{data=object,msg=string} "获取成功"
// @Router /pay_product/getPayProductPublic [get]
func (pay_productApi *PayProductApi) GetPayProductPublic(c *gin.Context) {
    // 此接口不需要鉴权
    // 示例为返回了一个固定的消息接口，一般本接口用于C端服务，需要自己实现业务逻辑
    response.OkWithDetailed(gin.H{
       "info": "不需要鉴权的支付产品接口信息",
    }, "获取成功", c)
}
