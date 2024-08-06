package merchant

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/merchant"
    merchantReq "github.com/flipped-aurora/gin-vue-admin/server/model/merchant/request"
)

type AgencyInfoService struct {
}

// CreateAgencyInfo 创建代理信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (agency_infoService *AgencyInfoService) CreateAgencyInfo(agency_info *merchant.AgencyInfo) (err error) {
	err = global.GVA_DB.Create(agency_info).Error
	return err
}

// DeleteAgencyInfo 删除代理信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (agency_infoService *AgencyInfoService)DeleteAgencyInfo(ID string) (err error) {
	err = global.GVA_DB.Delete(&merchant.AgencyInfo{},"id = ?",ID).Error
	return err
}

// DeleteAgencyInfoByIds 批量删除代理信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (agency_infoService *AgencyInfoService)DeleteAgencyInfoByIds(IDs []string) (err error) {
	err = global.GVA_DB.Delete(&[]merchant.AgencyInfo{},"id in ?",IDs).Error
	return err
}

// UpdateAgencyInfo 更新代理信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (agency_infoService *AgencyInfoService)UpdateAgencyInfo(agency_info merchant.AgencyInfo) (err error) {
	err = global.GVA_DB.Model(&merchant.AgencyInfo{}).Where("id = ?",agency_info.ID).Updates(&agency_info).Error
	return err
}

// GetAgencyInfo 根据ID获取代理信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (agency_infoService *AgencyInfoService)GetAgencyInfo(ID string) (agency_info merchant.AgencyInfo, err error) {
	err = global.GVA_DB.Where("id = ?", ID).First(&agency_info).Error
	return
}

// GetAgencyInfoInfoList 分页获取代理信息记录
// Author [piexlmax](https://github.com/piexlmax)
func (agency_infoService *AgencyInfoService)GetAgencyInfoInfoList(info merchantReq.AgencyInfoSearch) (list []merchant.AgencyInfo, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&merchant.AgencyInfo{})
    var agency_infos []merchant.AgencyInfo
    // 如果有条件搜索 下方会自动创建搜索语句
    if info.StartCreatedAt !=nil && info.EndCreatedAt !=nil {
     db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
    }
    if info.Account != "" {
        db = db.Where("account = ?",info.Account)
    }
    if info.NickName != "" {
        db = db.Where("nick_name = ?",info.NickName)
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }

	if limit != 0 {
       db = db.Limit(limit).Offset(offset)
    }
	
	err = db.Find(&agency_infos).Error
	return  agency_infos, total, err
}