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
        <el-form-item label="支付通道" prop="pay_channel">
          <el-select v-model="searchInfo.pay_channel" placeholder="请选择支付通道" :clearable="true">
            <el-option v-for="(item,key) in payProduct" :key="key" :label="item.pay_name+'-'+item.pay_code"
                       :value="item.ID"/>
          </el-select>
        </el-form-item>
        <el-form-item label="通道编码" prop="pay_code">
          <el-input v-model="searchInfo.pay_code" placeholder="搜索条件"/>

        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="search" @click="onSubmit">查询</el-button>
          <el-button icon="refresh" @click="onReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
      <div class="gva-btn-list">
        <!--        <el-button type="primary" icon="plus" @click="openDialog">新增</el-button>-->
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
        <el-table-column align="left" label="支付产品" prop="pay_channel" width="180">
          <template #default="scope">{{ getPayProductNameById(scope.row.pay_channel) }}</template>
        </el-table-column>
        <el-table-column align="left" label="产品编码" prop="pay_code" width="120"/>
        <el-table-column align="left" label="产品费率(%)" prop="fee" width="120"/>
        <el-table-column align="left" label="启用" prop="enable" width="80">
          <template #default="scope">
            <el-switch
                v-model="scope.row.enable"
                inline-prompt
                :active-value="1"
                :inactive-value="2"
                @change="()=>{updateMerchantChannelDataRow(scope.row)}"
            />
          </template>
        </el-table-column>
        <el-table-column align="left" label="创建日期" width="180">
          <template #default="scope">{{ formatDate(scope.row.CreatedAt) }}</template>
        </el-table-column>
        <el-table-column align="left" label="操作" fixed="right" min-width="240">
          <template #default="scope">
            <el-button type="primary" link icon="edit" class="table-button"
                       @click="updateMerchantChannelFunc(scope.row)">变更
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
        <el-form-item label="商户号:" prop="mch_no">
          <el-input v-model="formData.mch_no" :clearable="true" disabled placeholder="请输入商户号"/>
        </el-form-item>
        <el-form-item label="支付产品:" prop="pay_channel">
          <el-select v-model="formData.pay_channel" placeholder="请选择支付产品" style="width:100%" :clearable="true"
                     @change="onPayChannelChange">
            <el-option v-for="(item,key) in payProduct" :key="key"
                       :label="item.pay_name + '-' + item.pay_code"
                       :value="item.ID.toString()"/>
          </el-select>
        </el-form-item>
        <el-form-item label="产品编码:" prop="pay_code">
          <el-input v-model="formData.pay_code" :clearable="true" placeholder="请输入产品编码" disabled/>
        </el-form-item>
        <el-form-item label="产品费率(%):" prop="fee">
          <el-input-number v-model="formData.fee" style="width:100%" :precision="2" :clearable="true"/>
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
  </div>
</template>

<script setup>
import {
  createMerchantChannel,
  deleteMerchantChannel,
  deleteMerchantChannelByIds,
  updateMerchantChannel,
  findMerchantChannel,
  getMerchantChannelList
} from '@/api/merchant/merchant_channel'

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

defineOptions({
  name: 'MerchantChannel'
})

// 自动化生成的字典（可能为空）以及字段
const formData = ref({
  mch_no: '',
  pay_channel: '',
  pay_code: '',
  fee: 0,
  enable: 0,
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
  pay_channel: [{
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
  pay_code: [{
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
  fee: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
  ],
  enable: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
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

const payProduct = ref([])

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
    getTableData()
  })
}

const onPayChannelChange = (val) => {
  let payChannel = getPayProduct(val)
  if (payChannel != null) {
    formData.value.pay_code = payChannel.pay_code
  }
}

const getPayProduct = (channelId) => {
  for (let i = 0; i < payProduct.value.length; i++) {
    let payChannel = payProduct.value[i]
    if (payChannel.ID == channelId) {
      return payChannel
    }
  }
  return null
}

const getPayProductNameById = (id) => {
  for (let i = 0; i < payProduct.value.length; i++) {
    let template = payProduct.value[i];
    if (template.ID == id) {
      return template.pay_name;
    }
  }
  return id;
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

// 查询
const getTableData = async () => {
  const table = await getMerchantChannelList({page: page.value, pageSize: pageSize.value, ...searchInfo.value})
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

const getPayProductDataList = async () => {
  const table = await getPayProductList({page: 0, pageSize: 100})
  if (table.code === 0) {
    payProduct.value = table.data.list
  }
}

const updateMerchantChannelDataRow = async (row) => {
  let res = await updateMerchantChannel(row)
  if (res.code === 0) {
    let desc = row.enable === 1 ? "启用" : "禁用";
    ElMessage({
      type: 'success',
      message: desc + '成功'
    })
  }
}

getTableData()
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
    deleteMerchantChannelFunc(row)
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
    const res = await deleteMerchantChannelByIds({IDs})
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

// 更新行
const updateMerchantChannelFunc = async (row) => {
  const res = await findMerchantChannel({ID: row.ID})
  type.value = 'update'
  if (res.code === 0) {
    formData.value = res.data.remerchant_channel
    dialogFormVisible.value = true
  }
}


// 删除行
const deleteMerchantChannelFunc = async (row) => {
  const res = await deleteMerchantChannel({ID: row.ID})
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
    pay_channel: '',
    pay_code: '',
    fee: 0,
    enable: 0,
  }
}
// 弹窗确定
const enterDialog = async () => {
  elFormRef.value?.validate(async (valid) => {
    if (!valid) return
    let res
    switch (type.value) {
      case 'create':
        res = await createMerchantChannel(formData.value)
        break
      case 'update':
        res = await updateMerchantChannel(formData.value)
        break
      default:
        res = await createMerchantChannel(formData.value)
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
