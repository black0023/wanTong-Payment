<template>
  <div>
    <div class="gva-search-box">
      <el-form ref="elSearchFormRef" :inline="true" :model="searchInfo" class="demo-form-inline" :rules="searchRule"
               @keyup.enter="onSubmit">
        <el-form-item label="创建日期" prop="createdAt">
          <template #label>
        <span>
          创建日期
          <el-tooltip content="搜索范围是开始日期（包含）至结束日期（不包含）">
            <el-icon><QuestionFilled/></el-icon>
          </el-tooltip>
        </span>
          </template>
          <el-date-picker v-model="searchInfo.startCreatedAt" type="datetime" placeholder="开始日期"
                          :disabled-date="time=> searchInfo.endCreatedAt ? time.getTime() > searchInfo.endCreatedAt.getTime() : false"></el-date-picker>
          —
          <el-date-picker v-model="searchInfo.endCreatedAt" type="datetime" placeholder="结束日期"
                          :disabled-date="time=> searchInfo.startCreatedAt ? time.getTime() < searchInfo.startCreatedAt.getTime() : false"></el-date-picker>
        </el-form-item>

        <el-form-item label="商户号" prop="mch_no">
          <el-input v-model="searchInfo.mch_no" placeholder="搜索条件"/>

        </el-form-item>
        <el-form-item label="商户账号" prop="mch_acc">
          <el-input v-model="searchInfo.mch_acc" placeholder="搜索条件"/>

        </el-form-item>
        <el-form-item label="昵称" prop="nick_name">
          <el-input v-model="searchInfo.nick_name" placeholder="搜索条件"/>

        </el-form-item>
        <el-form-item label="上级代理" prop="agency_id">
          <el-select v-model="searchInfo.agency_id" placeholder="请选择上级代理" :clearable="true">
            <el-option v-for="(item,key) in agencyList" :key="key" :label="item.account+'-'+item.nick_name"
                       :value="item.ID"/>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="search" @click="onSubmit">查询</el-button>
          <el-button icon="refresh" @click="onReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
      <div class="gva-btn-list">
        <el-button type="primary" icon="plus" @click="openDialog">新增</el-button>
        <el-button icon="delete" style="margin-left: 10px;" :disabled="!multipleSelection.length" @click="onDelete">
          删除
        </el-button>
      </div>
      <el-table
          ref="multipleTable"
          style="width: 100%"
          tooltip-effect="dark"
          :data="tableData"
          row-key="ID"
          @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="55"/>

        <el-table-column align="left" label="商户号" prop="mch_no" width="120"/>
        <el-table-column align="left" label="商户账号" prop="mch_acc" width="120"/>
        <el-table-column align="left" label="昵称" prop="nick_name" width="120"/>
        <el-table-column align="left" label="上级代理" prop="agency_id" width="120">
          <template #default="scope">{{ getMerchantAgencyNameById(scope.row.agency_id) }}</template>
        </el-table-column>
        <el-table-column align="left" label="备注" prop="remark" width="120"/>
        <el-table-column align="left" label="余额" prop="balance" width="120"/>
        <el-table-column align="left" label="启用" prop="enable" width="80">
          <template #default="scope">
            <el-switch
                v-model="scope.row.enable"
                inline-prompt
                :active-value="1"
                :inactive-value="2"
                @change="()=>{updateMerchantInfoRow(scope.row)}"
            />
          </template>
        </el-table-column>
        <el-table-column align="left" label="最后登录" width="180">
          <template #default="scope">{{ formatDate(scope.row.last_login) }}</template>
        </el-table-column>
        <el-table-column align="left" label="登录IP" prop="login_ip" width="120"/>

        <el-table-column align="left" label="创建时间" width="180">
          <template #default="scope">{{ formatDate(scope.row.CreatedAt) }}</template>
        </el-table-column>
        <el-table-column align="left" label="操作" fixed="right" min-width="240">
          <template #default="scope">
            <el-button type="primary" link icon="money" class="table-button"
                       @click="updateMerchantChannelFunc(scope.row)">
              通道费率
            </el-button>
            <el-button type="primary" link icon="edit" class="table-button" @click="updateMerchantInfoFunc(scope.row)">
              变更
            </el-button>
            <el-button type="primary" link icon="delete" @click="deleteRow(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="gva-pagination">
        <el-pagination
            layout="total, sizes, prev, pager, next, jumper"
            :current-page="page"
            :page-size="pageSize"
            :page-sizes="[10, 30, 50, 100]"
            :total="total"
            @current-change="handleCurrentChange"
            @size-change="handleSizeChange"
        />
      </div>
    </div>
    <el-drawer destroy-on-close size="800" v-model="dialogFormVisible" :show-close="false" :before-close="closeDialog">
      <template #header>
        <div class="flex justify-between items-center">
          <span class="text-lg">{{ type === 'create' ? '添加' : '修改' }}</span>
          <div>
            <el-button type="primary" @click="enterDialog">确 定</el-button>
            <el-button @click="closeDialog">取 消</el-button>
          </div>
        </div>
      </template>

      <el-form :model="formData" label-position="top" ref="elFormRef" :rules="rule" label-width="80px">
        <el-form-item label="商户号:" prop="mch_no" v-if="type!=='create'">
          <el-input disabled v-model="formData.mch_no" :clearable="true" placeholder="请输入商户号"/>
        </el-form-item>
        <el-form-item label="商户账号:" prop="mch_acc">
          <el-input v-model="formData.mch_acc" :disabled="type!=='create'" :clearable="true"
                    placeholder="请输入商户账号"/>
        </el-form-item>
        <el-form-item
            v-if="type==='create'"
            label="密码"
            prop="password"
        >
          <el-input v-model="formData.password" :clearable="true"/>
        </el-form-item>
        <el-form-item label="昵称:" prop="nick_name">
          <el-input v-model="formData.nick_name" :clearable="true" placeholder="请输入昵称"/>
        </el-form-item>
        <el-form-item label="上级代理:" prop="agency_id">
          <el-select v-model="formData.agency_id" :disabled="type!=='create'"
                     placeholder="请选择上级代理" style="width:100%" :clearable="true">
            <el-option v-for="(item,key) in agencyList" :key="key" :label="item.account+'-'+item.nick_name"
                       :value="item.ID.toString()"/>
          </el-select>
        </el-form-item>
        <el-form-item label="备注:" prop="remark">
          <el-input v-model="formData.remark" :clearable="true" placeholder="请输入备注"/>
        </el-form-item>
        <el-form-item label="Api秘钥:" prop="api_key" v-if="type!=='create'">
          <div class="flex w-full gap-4">
            <el-input disabled v-model="formData.api_key" :clearable="true" placeholder="请输入Api秘钥"></el-input>
            <el-button type="primary" @click="refreshMerchantInfoApiKey(formData)">刷 新</el-button>
          </div>
        </el-form-item>
        <el-form-item label="余额:" prop="balance">
          <el-input-number v-model="formData.balance" style="width:100%" :precision="2" :clearable="true"/>
        </el-form-item>
        <el-form-item label="启用:" prop="enable">
          <el-switch
              v-model="formData.enable"
              inline-prompt
              :active-value="1"
              :inactive-value="2"
          />
        </el-form-item>
      </el-form>
    </el-drawer>


    <el-drawer destroy-on-close size="800" v-model="dialogChannelFormVisible" :show-close="false"
               :before-close="closeChannelDialog">
      <template #header>
        <div class="flex justify-between items-center">
          <span class="text-lg">通道费率</span>
          <div>
            <el-button type="primary" @click="enterChannelDialog">确 定</el-button>
            <el-button @click="closeChannelDialog">取 消</el-button>
          </div>
        </div>
      </template>

      <el-form :model="formData" label-position="top" ref="elFormRef" :rules="rule" label-width="80px">
        <el-form-item label="商户号:" prop="mch_no" v-if="type!=='create'">
          <el-input disabled v-model="formData.mch_no" :clearable="true" placeholder="请输入商户号"/>
        </el-form-item>
        <el-form-item label="商户账号:" prop="mch_acc">
          <el-input v-model="formData.mch_acc" disabled :clearable="true"
                    placeholder="请输入商户账号"/>
        </el-form-item>
        <el-form-item label="昵称:" prop="nick_name">
          <el-input v-model="formData.nick_name" disabled :clearable="true" placeholder="请输入昵称"/>
        </el-form-item>
        <el-form-item label="上级代理:" prop="agency_id">
          <el-select v-model="formData.agency_id" disabled
                     placeholder="请选择上级代理" style="width:100%" :clearable="true">
            <el-option v-for="(item,key) in agencyList" :key="key" :label="item.account+'-'+item.nick_name"
                       :value="item.ID.toString()"/>
          </el-select>
        </el-form-item>

        <div class="flex items-center gap-2" style="margin-top: 30px">
          <el-button
              type="primary"
              icon="edit"
              @click="addChannelParameter(configPayProductList)"
          >新增支付通道
          </el-button>
        </div>
        <el-table
            :data="configPayProductList"
            style="width: 100%; margin-top: 12px"
        >
          <el-table-column
              align="left"
              prop="type"
              label="支付产品"
              width="230"
          >
            <template #default="scope">
              <el-select v-model="scope.row.pay_channel" placeholder="请选择支付产品" :clearable="true"
                         @change="onPayProductChange(scope.row.pay_channel, scope.$index)">
                <el-option v-for="(item,key) in payProductList" :key="key"
                           :label="item.pay_name+'-'+item.pay_code"
                           :value="item.ID.toString()"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="type"
              label="通道编码"
              width="120"
          >
            <template #default="scope">
              <el-input v-model="scope.row.pay_code" disabled :clearable="true"/>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="type"
              label="通道费率(%)"
              width="180"
          >
            <template #default="scope">
              <el-input-number v-model="scope.row.fee" style="width:100%" :precision="2" :clearable="true"/>
            </template>
          </el-table-column>

          <el-table-column
              align="left"
              prop="type"
              label="启用"
              width="80"
          >
            <template #default="scope">

              <el-switch
                  v-model="scope.row.enable"
                  inline-prompt
                  :active-value="1"
                  :inactive-value="2"
              />
            </template>
          </el-table-column>

          <el-table-column align="left">
            <template #default="scope">
              <div>
                <el-button
                    type="danger"
                    icon="delete"
                    @click="deleteChannelParameter(configPayProductList, scope.$index)"
                >删除
                </el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>

      </el-form>
    </el-drawer>
  </div>
</template>

<script setup>
import {
  createMerchantInfo,
  deleteMerchantInfo,
  deleteMerchantInfoByIds,
  updateMerchantInfo,
  findMerchantInfo,
  getMerchantInfoList,
  refreshMerchantApiKey
} from '@/api/merchant/merchant_info'

import {
  getAgencyInfoList
} from "@/api/merchant/agency_info";

import {
  getMerchantChannelList, updateMerchantChannelList
} from "@/api/merchant/merchant_channel";

import {
  getPayProductList
} from "@/api/payment/pay_product";


// 全量引入格式化工具 请按需保留
import {
  getDictFunc,
  formatDate,
  formatBoolean,
  filterDict,
  filterDataSource,
  ReturnArrImg,
  onDownloadFile
} from '@/utils/format'
import {ElMessage, ElMessageBox} from 'element-plus'
import {ref, reactive} from 'vue'
import {getPayChannelList} from "@/api/payment/pay_channel";

defineOptions({
  name: 'MerchantInfo'
})

// 自动化生成的字典（可能为空）以及字段
const formData = ref({
  mch_no: '',
  mch_acc: '',
  nick_name: '',
  agency_id: '',
  remark: '',
  api_key: '',
  balance: 0,
  enable: 1,
  last_login: null,
  login_ip: '',
  password: '',
})


// 验证规则
const rule = reactive({
  mch_no: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
    {
      whitespace: true,
      message: '不能只输入空格',
      trigger: ['input', 'blur'],
    }
  ],
  mch_acc: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
    {
      whitespace: true,
      message: '不能只输入空格',
      trigger: ['input', 'blur'],
    }
  ],
  nick_name: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
    {
      whitespace: true,
      message: '不能只输入空格',
      trigger: ['input', 'blur'],
    }
  ],
  password: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
    {
      whitespace: true,
      message: '不能只输入空格',
      trigger: ['input', 'blur'],
    }
  ],
  agency_id: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
    {
      whitespace: true,
      message: '不能只输入空格',
      trigger: ['input', 'blur'],
    }
  ],
})

const searchRule = reactive({
  createdAt: [
    {
      validator: (rule, value, callback) => {
        if (searchInfo.value.startCreatedAt && !searchInfo.value.endCreatedAt) {
          callback(new Error('请填写结束日期'))
        } else if (!searchInfo.value.startCreatedAt && searchInfo.value.endCreatedAt) {
          callback(new Error('请填写开始日期'))
        } else if (searchInfo.value.startCreatedAt && searchInfo.value.endCreatedAt && (searchInfo.value.startCreatedAt.getTime() === searchInfo.value.endCreatedAt.getTime() || searchInfo.value.startCreatedAt.getTime() > searchInfo.value.endCreatedAt.getTime())) {
          callback(new Error('开始日期应当早于结束日期'))
        } else {
          callback()
        }
      }, trigger: 'change'
    }
  ],
})

const elFormRef = ref()
const elSearchFormRef = ref()

// =========== 表格控制部分 ===========
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})

const agencyList = ref([]);
const payProductList = ref([])
const configPayProductList = ref([])

// 新增参数
const addChannelParameter = (fieldList) => {
  if (!fieldList) {
    fieldList = []
  }
  fieldList.push({
    pay_channel: '',
    pay_code: '',
    fee: 0,
    enable: 0,
  })
}

// 删除参数
const deleteChannelParameter = (parameters, index) => {
  parameters.splice(index, 1)
}

const onPayProductChange = (channelId, index) => {
  let payChannel = getPayProductData(channelId)
  configPayProductList.value[index].pay_channel = channelId.toString()
  configPayProductList.value[index].pay_code = payChannel.pay_code
}

const getPayProductData = (channelId) => {
  for (let i = 0; i < payProductList.value.length; i++) {
    let payChannel = payProductList.value[i]
    if (payChannel.ID == channelId) {
      return payChannel
    }
  }
  return null
}

// 重置
const onReset = () => {
  searchInfo.value = {}
  getTableData()
}

// 搜索
const onSubmit = () => {
  elSearchFormRef.value?.validate(async (valid) => {
    if (!valid) return
    page.value = 1
    pageSize.value = 10
    if (searchInfo.value.enable === "") {
      searchInfo.value.enable = null
    }
    getTableData()
  })
}

// 分页
const handleSizeChange = (val) => {
  pageSize.value = val
  getTableData()
}

// 修改页面容量
const handleCurrentChange = (val) => {
  page.value = val
  getTableData()
}

const getMerchantAgencyNameById = (id) => {
  for (let i = 0; i < agencyList.value.length; i++) {
    let agencyInfo = agencyList.value[i];
    if (agencyInfo.ID == id) {
      return agencyInfo.nick_name;
    }
  }
  return id;
}

// 查询
const getTableData = async () => {
  const table = await getMerchantInfoList({page: page.value, pageSize: pageSize.value, ...searchInfo.value})
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

const getAgencyDataList = async () => {
  const table = await getAgencyInfoList({page: 0, pageSize: 100})
  if (table.code === 0) {
    agencyList.value = table.data.list
  }
}

const getPayProductDataList = async () => {
  const table = await getPayProductList({page: 0, pageSize: 100})
  if (table.code === 0) {
    payProductList.value = table.data.list
  }
}

const getMerchantProductDataList = async () => {
  const table = await getMerchantChannelList({page: 0, pageSize: 100})
  if (table.code === 0) {
    configPayProductList.value = table.data.list
  }
}


getTableData()
getAgencyDataList()
getPayProductDataList()

// ============== 表格控制部分结束 ===============

// 获取需要的字典 可能为空 按需保留
const setOptions = async () => {
}

// 获取需要的字典 可能为空 按需保留
setOptions()


// 多选数据
const multipleSelection = ref([])
// 多选
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

// 删除行
const deleteRow = (row) => {
  ElMessageBox.confirm('确定要删除吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    deleteMerchantInfoFunc(row)
  })
}

// 多选删除
const onDelete = async () => {
  ElMessageBox.confirm('确定要删除吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async () => {
    const IDs = []
    if (multipleSelection.value.length === 0) {
      ElMessage({
        type: 'warning',
        message: '请选择要删除的数据'
      })
      return
    }
    multipleSelection.value &&
    multipleSelection.value.map(item => {
      IDs.push(item.ID)
    })
    const res = await deleteMerchantInfoByIds({IDs})
    if (res.code === 0) {
      ElMessage({
        type: 'success',
        message: '删除成功'
      })
      if (tableData.value.length === IDs.length && page.value > 1) {
        page.value--
      }
      getTableData()
    }
  })
}

// 行为控制标记（弹窗内部需要增还是改）
const type = ref('')

const refreshMerchantInfoApiKey = async (row) => {
  const res = await refreshMerchantApiKey({mchNo: row.mch_no})
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '刷新成功'
    })
    formData.value.api_key = res.data.apiKey;
  }
}

// 更新行
const updateMerchantInfoFunc = async (row) => {
  const res = await findMerchantInfo({ID: row.ID})
  type.value = 'update'
  if (res.code === 0) {
    formData.value = res.data.remerchantInfo
    dialogFormVisible.value = true
  }
}

const updateMerchantChannelFunc = async (row) => {
  const res = await findMerchantInfo({ID: row.ID})
  type.value = 'update'
  if (res.code === 0) {
    formData.value = res.data.remerchantInfo
    dialogChannelFormVisible.value = true

    const table = await getMerchantChannelList({page: 0, pageSize: 100, mch_no: formData.value.mch_no})
    if (table.code === 0) {
      configPayProductList.value = table.data.list
    }
  }
}

const updateMerchantInfoRow = async (row) => {
  let res = await updateMerchantInfo(row)
  if (res.code === 0) {
    let desc = row.enable === 1 ? "启用" : "禁用";
    ElMessage({
      type: 'success',
      message: desc + '成功'
    })
  }
}

// 删除行
const deleteMerchantInfoFunc = async (row) => {
  const res = await deleteMerchantInfo({ID: row.ID})
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '删除成功'
    })
    if (tableData.value.length === 1 && page.value > 1) {
      page.value--
    }
    getTableData()
  }
}

// 弹窗控制标记
const dialogFormVisible = ref(false)
// 通道费率弹窗控制标记
const dialogChannelFormVisible = ref(false);

// 打开通道费率弹窗
const openChannelDialog = () => {
  dialogChannelFormVisible.value = true
}

const closeChannelDialog = () => {
  dialogChannelFormVisible.value = false
  configPayProductList.value = []
}

// 打开弹窗
const openDialog = () => {
  type.value = 'create'
  dialogFormVisible.value = true
}

// 关闭弹窗
const closeDialog = () => {
  dialogFormVisible.value = false
  formData.value = {
    mch_no: '',
    mch_acc: '',
    nick_name: '',
    agency_id: '',
    remark: '',
    api_key: '',
    balance: 0,
    enable: 2,
    last_login: null,
    login_ip: '',
  }
}
// 弹窗确定
const enterChannelDialog = async () => {
  let postObj = {
    mch_no: formData.value.mch_no,
    channel_list: configPayProductList.value
  }
  let res = await updateMerchantChannelList(postObj)
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '创建/更改成功'
    })
    closeChannelDialog()
  }
}

const enterDialog = async () => {
  elFormRef.value?.validate(async (valid) => {
    if (!valid) return
    let res
    switch (type.value) {
      case 'create':
        res = await createMerchantInfo(formData.value)
        break
      case 'update':
        res = await updateMerchantInfo(formData.value)
        break
      default:
        res = await createMerchantInfo(formData.value)
        break
    }
    if (res.code === 0) {
      ElMessage({
        type: 'success',
        message: '创建/更改成功'
      })
      closeDialog()
      getTableData()
    }
  })
}

</script>

<style>

</style>
