<template>
  <div>
    <div class="gva-search-box">
      <el-form ref="elSearchFormRef" :inline="true" :model="searchInfo" class="demo-form-inline" :rules="searchRule" @keyup.enter="onSubmit">
      <el-form-item label="创建日期" prop="createdAt">
      <template #label>
        <span>
          创建日期
          <el-tooltip content="搜索范围是开始日期（包含）至结束日期（不包含）">
            <el-icon><QuestionFilled /></el-icon>
          </el-tooltip>
        </span>
      </template>
      <el-date-picker v-model="searchInfo.startCreatedAt" type="datetime" placeholder="开始日期" :disabled-date="time=> searchInfo.endCreatedAt ? time.getTime() > searchInfo.endCreatedAt.getTime() : false"></el-date-picker>
       —
      <el-date-picker v-model="searchInfo.endCreatedAt" type="datetime" placeholder="结束日期" :disabled-date="time=> searchInfo.startCreatedAt ? time.getTime() < searchInfo.startCreatedAt.getTime() : false"></el-date-picker>
      </el-form-item>
      
        <el-form-item label="商户号" prop="mch_no">
         <el-input v-model="searchInfo.mch_no" placeholder="搜索条件" />

        </el-form-item>
        <el-form-item label="商户名" prop="mch_name">
         <el-input v-model="searchInfo.mch_name" placeholder="搜索条件" />

        </el-form-item>
        <el-form-item label="平台订单号" prop="platform_order">
         <el-input v-model="searchInfo.platform_order" placeholder="搜索条件" />

        </el-form-item>
        <el-form-item label="商户订单号" prop="merchant_order">
         <el-input v-model="searchInfo.merchant_order" placeholder="搜索条件" />

        </el-form-item>
        <el-form-item label="支付产品" prop="product_id">
         <el-input v-model="searchInfo.product_id" placeholder="搜索条件" />

        </el-form-item>
        <el-form-item label="通道ID" prop="channel_id">
         <el-input v-model="searchInfo.channel_id" placeholder="搜索条件" />

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
            <el-button icon="delete" style="margin-left: 10px;" :disabled="!multipleSelection.length" @click="onDelete">删除</el-button>
        </div>
        <el-table
        ref="multipleTable"
        style="width: 100%"
        tooltip-effect="dark"
        :data="tableData"
        row-key="ID"
        @selection-change="handleSelectionChange"
        >
        <el-table-column type="selection" width="55" />
        
        <el-table-column align="left" label="日期" width="180">
            <template #default="scope">{{ formatDate(scope.row.CreatedAt) }}</template>
        </el-table-column>
        
        <el-table-column align="left" label="商户号" prop="mch_no" width="120" />
        <el-table-column align="left" label="商户名" prop="mch_name" width="120">
          <template #default="scope">
                
                    <span>{{ filterDataSource(dataSource.mch_name,scope.row.mch_name) }}</span>
                
         </template>
         </el-table-column>
        <el-table-column align="left" label="平台订单号" prop="platform_order" width="120" />
        <el-table-column align="left" label="商户订单号" prop="merchant_order" width="120" />
        <el-table-column align="left" label="支付产品" prop="product_id" width="120" />
        <el-table-column align="left" label="产品编码" prop="product_code" width="120" />
        <el-table-column align="left" label="通道ID" prop="channel_id" width="120" />
        <el-table-column align="left" label="通道编码" prop="channel_code" width="120" />
        <el-table-column align="left" label="金额" prop="amount" width="120" />
        <el-table-column align="left" label="订单状态" prop="status" width="120">
            <template #default="scope">
            {{ filterDict(scope.row.status,orderStatusOptions) }}
            </template>
        </el-table-column>
         <el-table-column align="left" label="成功时间" width="180">
            <template #default="scope">{{ formatDate(scope.row.success_time) }}</template>
         </el-table-column>
         <el-table-column align="left" label="回调时间" width="180">
            <template #default="scope">{{ formatDate(scope.row.callback_time) }}</template>
         </el-table-column>
        <el-table-column align="left" label="回调次数" prop="callback_count" width="120" />
        <el-table-column align="left" label="操作" fixed="right" min-width="240">
            <template #default="scope">
            <el-button type="primary" link icon="edit" class="table-button" @click="updateTradeOrderFunc(scope.row)">变更</el-button>
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
                <span class="text-lg">{{type==='create'?'添加':'修改'}}</span>
                <div>
                  <el-button type="primary" @click="enterDialog">确 定</el-button>
                  <el-button @click="closeDialog">取 消</el-button>
                </div>
              </div>
            </template>

          <el-form :model="formData" label-position="top" ref="elFormRef" :rules="rule" label-width="80px">
            <el-form-item label="商户号:"  prop="mch_no" >
              <el-input v-model="formData.mch_no" :clearable="true"  placeholder="请输入商户号" />
            </el-form-item>
            <el-form-item label="商户名:"  prop="mch_name" >
            <el-select  v-model="formData.mch_name" placeholder="请选择商户名" style="width:100%" :clearable="true" >
              <el-option v-for="(item,key) in dataSource.mch_name" :key="key" :label="item.label" :value="item.value" />
            </el-select>
            </el-form-item>
            <el-form-item label="平台订单号:"  prop="platform_order" >
              <el-input v-model="formData.platform_order" :clearable="true"  placeholder="请输入平台订单号" />
            </el-form-item>
            <el-form-item label="商户订单号:"  prop="merchant_order" >
              <el-input v-model="formData.merchant_order" :clearable="true"  placeholder="请输入商户订单号" />
            </el-form-item>
            <el-form-item label="支付产品:"  prop="product_id" >
              <el-input v-model="formData.product_id" :clearable="true"  placeholder="请输入支付产品" />
            </el-form-item>
            <el-form-item label="产品编码:"  prop="product_code" >
              <el-input v-model="formData.product_code" :clearable="true"  placeholder="请输入产品编码" />
            </el-form-item>
            <el-form-item label="通道ID:"  prop="channel_id" >
              <el-input v-model="formData.channel_id" :clearable="true"  placeholder="请输入通道ID" />
            </el-form-item>
            <el-form-item label="通道编码:"  prop="channel_code" >
              <el-input v-model="formData.channel_code" :clearable="true"  placeholder="请输入通道编码" />
            </el-form-item>
            <el-form-item label="金额:"  prop="amount" >
              <el-input v-model.number="formData.amount" :clearable="true" placeholder="请输入金额" />
            </el-form-item>
            <el-form-item label="订单状态:"  prop="status" >
              <el-select v-model="formData.status" placeholder="请选择订单状态" style="width:100%" :clearable="true" >
                <el-option v-for="(item,key) in orderStatusOptions" :key="key" :label="item.label" :value="item.value" />
              </el-select>
            </el-form-item>
            <el-form-item label="成功时间:"  prop="success_time" >
              <el-date-picker v-model="formData.success_time" type="date" style="width:100%" placeholder="选择日期" :clearable="true"  />
            </el-form-item>
            <el-form-item label="回调时间:"  prop="callback_time" >
              <el-date-picker v-model="formData.callback_time" type="date" style="width:100%" placeholder="选择日期" :clearable="true"  />
            </el-form-item>
            <el-form-item label="回调次数:"  prop="callback_count" >
              <el-input v-model.number="formData.callback_count" :clearable="true" placeholder="请输入回调次数" />
            </el-form-item>
          </el-form>
    </el-drawer>
  </div>
</template>

<script setup>
import {
  createTradeOrder,
  deleteTradeOrder,
  deleteTradeOrderByIds,
  updateTradeOrder,
  findTradeOrder,
  getTradeOrderList
} from '@/api/trade/trade_order'
// 富文本组件
import RichEdit from '@/components/richtext/rich-edit.vue'

// 全量引入格式化工具 请按需保留
import { getDictFunc, formatDate, formatBoolean, filterDict ,filterDataSource, ReturnArrImg, onDownloadFile } from '@/utils/format'
import { ElMessage, ElMessageBox } from 'element-plus'
import { ref, reactive } from 'vue'

defineOptions({
    name: 'TradeOrder'
})

// 自动化生成的字典（可能为空）以及字段
const orderStatusOptions = ref([])
const formData = ref({
        mch_no: '',
        mch_name: '',
        platform_order: '',
        merchant_order: '',
        product_id: '',
        product_code: '',
        channel_id: '',
        channel_code: '',
        amount: 0,
        status: '',
        success_time: new Date(),
        callback_time: new Date(),
        callback_count: 0,
        })



// 验证规则
const rule = reactive({
               mch_no : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               mch_name : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               platform_order : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               merchant_order : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               product_id : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               product_code : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               channel_id : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               channel_code : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
               {
                   whitespace: true,
                   message: '不能只输入空格',
                   trigger: ['input', 'blur'],
              }
              ],
               amount : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               },
              ],
               status : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
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
    { validator: (rule, value, callback) => {
      if (searchInfo.value.startCreatedAt && !searchInfo.value.endCreatedAt) {
        callback(new Error('请填写结束日期'))
      } else if (!searchInfo.value.startCreatedAt && searchInfo.value.endCreatedAt) {
        callback(new Error('请填写开始日期'))
      } else if (searchInfo.value.startCreatedAt && searchInfo.value.endCreatedAt && (searchInfo.value.startCreatedAt.getTime() === searchInfo.value.endCreatedAt.getTime() || searchInfo.value.startCreatedAt.getTime() > searchInfo.value.endCreatedAt.getTime())) {
        callback(new Error('开始日期应当早于结束日期'))
      } else {
        callback()
      }
    }, trigger: 'change' }
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

// 重置
const onReset = () => {
  searchInfo.value = {}
  getTableData()
}

// 搜索
const onSubmit = () => {
  elSearchFormRef.value?.validate(async(valid) => {
    if (!valid) return
    page.value = 1
    pageSize.value = 10
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

// 查询
const getTableData = async() => {
  const table = await getTradeOrderList({ page: page.value, pageSize: pageSize.value, ...searchInfo.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

getTableData()

// ============== 表格控制部分结束 ===============

// 获取需要的字典 可能为空 按需保留
const setOptions = async () =>{
    orderStatusOptions.value = await getDictFunc('orderStatus')
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
            deleteTradeOrderFunc(row)
        })
    }

// 多选删除
const onDelete = async() => {
  ElMessageBox.confirm('确定要删除吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async() => {
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
      const res = await deleteTradeOrderByIds({ IDs })
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
const updateTradeOrderFunc = async(row) => {
    const res = await findTradeOrder({ ID: row.ID })
    type.value = 'update'
    if (res.code === 0) {
        formData.value = res.data.retrade_order
        dialogFormVisible.value = true
    }
}


// 删除行
const deleteTradeOrderFunc = async (row) => {
    const res = await deleteTradeOrder({ ID: row.ID })
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
        mch_name: '',
        platform_order: '',
        merchant_order: '',
        product_id: '',
        product_code: '',
        channel_id: '',
        channel_code: '',
        amount: 0,
        status: '',
        success_time: new Date(),
        callback_time: new Date(),
        callback_count: 0,
        }
}
// 弹窗确定
const enterDialog = async () => {
     elFormRef.value?.validate( async (valid) => {
             if (!valid) return
              let res
              switch (type.value) {
                case 'create':
                  res = await createTradeOrder(formData.value)
                  break
                case 'update':
                  res = await updateTradeOrder(formData.value)
                  break
                default:
                  res = await createTradeOrder(formData.value)
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
