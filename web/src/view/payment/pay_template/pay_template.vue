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

        <el-form-item label="模板名称" prop="template_name">
          <el-input v-model="searchInfo.template_name" placeholder="搜索条件"/>

        </el-form-item>
        <el-form-item label="商户号" prop="mch_no">
          <el-input v-model="searchInfo.mch_no" placeholder="搜索条件"/>

        </el-form-item>
        <el-form-item label="AppId" prop="app_id">
          <el-input v-model="searchInfo.app_id" placeholder="搜索条件"/>

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

        <el-table-column align="left" label="日期" width="180">
          <template #default="scope">{{ formatDate(scope.row.CreatedAt) }}</template>
        </el-table-column>

        <el-table-column align="left" label="模板名称" prop="template_name" width="150"/>
        <el-table-column align="left" label="商户号" prop="mch_no" width="150"/>
        <el-table-column align="left" label="商户名" prop="mch_acc" width="150"/>
        <el-table-column align="left" label="AppId" prop="app_id" width="150"/>
        <el-table-column align="left" label="操作" fixed="right" min-width="240">
          <template #default="scope">
            <el-button type="primary" link icon="edit" class="table-button" @click="updatePayTemplateFunc(scope.row)">
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
        <el-form-item label="模板名称:" prop="template_name">
          <el-input v-model="formData.template_name" :clearable="true" placeholder="请输入模板名称"/>
        </el-form-item>
        <el-form-item label="商户号:" prop="mch_no">
          <el-input v-model="formData.mch_no" :clearable="true" placeholder="请输入商户号"/>
        </el-form-item>
        <el-form-item label="商户名:" prop="mch_acc">
          <el-input v-model="formData.mch_acc" :clearable="true" placeholder="请输入商户名"/>
        </el-form-item>
        <el-form-item label="AppId:" prop="app_id">
          <el-input v-model="formData.app_id" :clearable="true" placeholder="请输入AppId"/>
        </el-form-item>
        <el-form-item label="签名类型:" prop="sign_type">
          <el-select v-model="formData.sign_type" placeholder="请选择签名类型" style="width:100%" :clearable="true">
            <el-option v-for="(item,key) in signTypeOptions" :key="key" :label="item.label" :value="item.value"/>
          </el-select>
        </el-form-item>
        <el-form-item label="MD5秘钥:" prop="md5_key">
          <el-input v-model="formData.md5_key" :clearable="true" placeholder="请输入MD5秘钥"/>
        </el-form-item>
        <el-form-item label="RSA公钥:" prop="rsa_pub">
          <el-input v-model="formData.rsa_pub" :clearable="true" placeholder="请输入RSA公钥"/>
        </el-form-item>
        <el-form-item label="RSA私钥:" prop="rsa_priv">
          <el-input v-model="formData.rsa_priv" :clearable="true" placeholder="请输入RSA私钥"/>
        </el-form-item>
        <el-form-item label="下单接口:" prop="order_url">
          <el-input v-model="formData.order_url" :clearable="true" placeholder="请输入下单接口"/>
        </el-form-item>
        <el-form-item label="查单接口:" prop="query_url">
          <el-input v-model="formData.query_url" :clearable="true" placeholder="请输入查单接口"/>
        </el-form-item>
        <el-form-item label="回调IP:" prop="callback_ip">
          <el-input v-model="formData.callback_ip" :clearable="true" placeholder="请输入回调IP"/>
        </el-form-item>
        <el-form-item label="商品标题:" prop="subject_title">
          <el-input v-model="formData.subject_title" :clearable="true" placeholder="请输入商品标题"/>
        </el-form-item>
        <el-form-item label="商品描述:" prop="subject_desc">
          <el-input v-model="formData.subject_desc" :clearable="true" placeholder="请输入商品描述"/>
        </el-form-item>
        <el-form-item label="备注:" prop="remark">
          <el-input v-model="formData.remark" :clearable="true" placeholder="请输入备注"/>
        </el-form-item>
        <el-form-item label="订单成功编码:" prop="success_status">
          <el-input v-model="formData.success_status" :clearable="true" placeholder="请输入订单成功编码"/>
        </el-form-item>
        <el-form-item label="回调成功返回:" prop="callback_str">
          <el-input v-model="formData.callback_str" :clearable="true" placeholder="请输入回调成功返回"/>
        </el-form-item>
        <el-form-item label="调用类型:" prop="request_type">
          <el-select v-model="formData.request_type" placeholder="请选择调用类型" style="width:100%" :clearable="true">
            <el-option v-for="(item,key) in methodTypeOptions" :key="key" :label="item.label" :value="item.value"/>
          </el-select>
        </el-form-item>
        <el-form-item label="回调类型:" prop="callback_type">
          <el-select v-model="formData.callback_type" placeholder="请选择回调类型" style="width:100%" :clearable="true">
            <el-option v-for="(item,key) in methodTypeOptions" :key="key" :label="item.label" :value="item.value"/>
          </el-select>
        </el-form-item>
        <el-form-item label="金额类型:" prop="amount_type">
          <el-select v-model="formData.amount_type" placeholder="请选择金额类型" style="width:100%" :clearable="true">
            <el-option v-for="(item,key) in amountTypeOptions" :key="key" :label="item.label" :value="item.value"/>
          </el-select>
        </el-form-item>


        <!--   下单参数     -->
        <div class="flex items-center gap-2">
          <el-button
              type="primary"
              icon="edit"
              @click="addOrderParameter(orderFields)"
          >新增下单参数
          </el-button>
        </div>
        <el-table
            :data="orderFields"
            style="width: 100%; margin-top: 12px"
        >
          <el-table-column
              align="left"
              prop="type"
              label="参数类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.paramType" placeholder="请选择参数类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payParamTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="type"
              label="字段类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.fieldType" placeholder="请选择字段类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payFieldsTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数名"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldName"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数值"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldValue"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column align="left">
            <template #default="scope">
              <div>
                <el-button
                    type="danger"
                    icon="delete"
                    @click="deleteOrderParameter(orderFields, scope.$index)"
                >删除
                </el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>

        <!--   下单返回参数     -->

        <div class="flex items-center gap-2">
          <el-button
              type="primary"
              icon="edit"
              @click="addOrderParameter(orderResponseFields)"
          >新增下返回单参数
          </el-button>
        </div>
        <el-table
            :data="orderResponseFields"
            style="width: 100%; margin-top: 12px"
        >
          <el-table-column
              align="left"
              prop="type"
              label="参数类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.paramType" placeholder="请选择参数类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payParamTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="type"
              label="字段类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.fieldType" placeholder="请选择字段类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payFieldsTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数名"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldName"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数值"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldValue"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column align="left">
            <template #default="scope">
              <div>
                <el-button
                    type="danger"
                    icon="delete"
                    @click="deleteOrderParameter(orderFields, scope.$index)"
                >删除
                </el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>

        <!--   回调参数     -->

        <div class="flex items-center gap-2" style="margin-top: 20px">
          <el-button
              type="primary"
              icon="edit"
              @click="addOrderParameter(callbackFields)"
          >新增回调参数
          </el-button>
        </div>
        <el-table
            :data="callbackFields"
            style="width: 100%; margin-top: 12px"
        >
          <el-table-column
              align="left"
              prop="type"
              label="参数类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.paramType" placeholder="请选择参数类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payParamTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="type"
              label="字段类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.fieldType" placeholder="请选择字段类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payFieldsTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数名"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldName"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数值"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldValue"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column align="left">
            <template #default="scope">
              <div>
                <el-button
                    type="danger"
                    icon="delete"
                    @click="deleteOrderParameter(orderFields, scope.$index)"
                >删除
                </el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>


        <!--   查单参数     -->

        <div class="flex items-center gap-2" style="margin-top: 20px">
          <el-button
              type="primary"
              icon="edit"
              @click="addOrderParameter(queryFields)"
          >新增查单参数
          </el-button>
        </div>
        <el-table
            :data="queryFields"
            style="width: 100%; margin-top: 12px"
        >
          <el-table-column
              align="left"
              prop="type"
              label="参数类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.paramType" placeholder="请选择参数类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payParamTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="type"
              label="字段类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.fieldType" placeholder="请选择字段类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payFieldsTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数名"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldName"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数值"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldValue"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column align="left">
            <template #default="scope">
              <div>
                <el-button
                    type="danger"
                    icon="delete"
                    @click="deleteOrderParameter(orderFields, scope.$index)"
                >删除
                </el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>

        <div class="flex items-center gap-2" style="margin-top: 20px">
          <el-button
              type="primary"
              icon="edit"
              @click="addOrderParameter(queryResponseFields)"
          >新增查单返回参数
          </el-button>
        </div>
        <el-table
            :data="queryResponseFields"
            style="width: 100%; margin-top: 12px"
        >
          <el-table-column
              align="left"
              prop="type"
              label="参数类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.paramType" placeholder="请选择参数类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payParamTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="type"
              label="字段类型"
              width="180"
          >
            <template #default="scope">
              <el-select v-model="scope.row.fieldType" placeholder="请选择字段类型" style="width:100%"
                         :clearable="true">
                <el-option v-for="(item,key) in payFieldsTypeOptions" :key="key" :label="item.label"
                           :value="item.value"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数名"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldName"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column
              align="left"
              prop="value"
              label="参数值"
          >
            <template #default="scope">
              <div>
                <el-input v-model="scope.row.fieldValue"/>
              </div>
            </template>
          </el-table-column>
          <el-table-column align="left">
            <template #default="scope">
              <div>
                <el-button
                    type="danger"
                    icon="delete"
                    @click="deleteOrderParameter(orderFields, scope.$index)"
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
  createPayTemplate,
  deletePayTemplate,
  deletePayTemplateByIds,
  updatePayTemplate,
  findPayTemplate,
  getPayTemplateList
} from '@/api/payment/pay_template'
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
  name: 'PayTemplate'
})


// ========== 下单参数
const orderFields = ref([]);
const orderResponseFields = ref([]);
// ========== 回调参数
const callbackFields = ref([]);
// ========== 查单参数
const queryFields = ref([]);
const queryResponseFields = ref([]);

// 新增参数
const addOrderParameter = (fieldList) => {
  if (!fieldList) {
    fieldList = []
  }
  fieldList.push({
    paramType: '',
    fieldType: '',
    fieldName: '',
    fieldValue: '',
  })
}

// 删除参数
const deleteOrderParameter = (parameters, index) => {
  parameters.splice(index, 1)
}


// 自动化生成的字典（可能为空）以及字段
const signTypeOptions = ref([])
const methodTypeOptions = ref([])
const amountTypeOptions = ref([])
const payParamTypeOptions = ref([])
const payFieldsTypeOptions = ref([])
const formData = ref({
  template_name: '',
  mch_no: '',
  mch_acc: '',
  app_id: '',
  sign_type: '',
  md5_key: '',
  rsa_pub: '',
  rsa_priv: '',
  order_url: '',
  query_url: '',
  callback_ip: '',
  subject_title: '',
  subject_desc: '',
  remark: '',
  success_status: '',
  callback_str: '',
  request_type: '',
  callback_type: '',
  order_fields: '',
  query_fields: '',
  callback_fields: '',
  order_response: '',
  query_response: '',
  amount_type: '',
})


// 验证规则
const rule = reactive({
  template_name: [{
    required: true,
    message: '请输入正确的模板名称',
    trigger: ['input', 'blur'],
  },
    {
      whitespace: true,
      message: '不能只输入空格',
      trigger: ['input', 'blur'],
    }
  ],
  mch_no: [{
    required: true,
    message: '请输入正确的商户号',
    trigger: ['input', 'blur'],
  },
    {
      whitespace: true,
      message: '不能只输入空格',
      trigger: ['input', 'blur'],
    }
  ],
  sign_type: [{
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
  order_url: [{
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
  success_status: [{
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
  callback_str: [{
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
  request_type: [{
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
  callback_type: [{
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
  order_fields: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
  ],
  callback_fields: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
  ],
  order_response: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  },
  ],
  amount_type: [{
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
  const table = await getPayTemplateList({page: page.value, pageSize: pageSize.value, ...searchInfo.value})
  if (table.code === 0) {
    for (let i = 0; i < table.data.list.length; i++) {
      let templateData = table.data.list[i]
      table.data.list[i].order_fields = templateData.order_fields
      table.data.list[i].order_response = templateData.order_response
      table.data.list[i].query_fields = templateData.query_fields
      table.data.list[i].query_response = templateData.query_response
      table.data.list[i].callback_fields = templateData.callback_fields
    }

    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

getTableData()

// ============== 表格控制部分结束 ===============

// 获取需要的字典 可能为空 按需保留
const setOptions = async () => {
  signTypeOptions.value = await getDictFunc('signType')
  methodTypeOptions.value = await getDictFunc('methodType')
  amountTypeOptions.value = await getDictFunc('amountType')
  payParamTypeOptions.value = await getDictFunc('templateFieldType')
  payFieldsTypeOptions.value = await getDictFunc('templateDataType')
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
    deletePayTemplateFunc(row)
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
    const res = await deletePayTemplateByIds({IDs})
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
const updatePayTemplateFunc = async (row) => {
  const res = await findPayTemplate({ID: row.ID})
  type.value = 'update'
  if (res.code === 0) {
    formData.value = res.data.repay_template
    orderFields.value = JSON.parse(formData.value.order_fields)
    orderResponseFields.value = JSON.parse(formData.value.order_response)
    queryFields.value = JSON.parse(formData.value.query_fields)
    queryResponseFields.value = JSON.parse(formData.value.query_response)
    callbackFields.value = JSON.parse(formData.value.callback_fields)
    dialogFormVisible.value = true
  }
}


// 删除行
const deletePayTemplateFunc = async (row) => {
  const res = await deletePayTemplate({ID: row.ID})
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
    template_name: '',
    mch_no: '',
    mch_acc: '',
    app_id: '',
    sign_type: '',
    md5_key: '',
    rsa_pub: '',
    rsa_priv: '',
    order_url: '',
    query_url: '',
    callback_ip: '',
    subject_title: '',
    subject_desc: '',
    remark: '',
    success_status: '',
    callback_str: '',
    request_type: '',
    callback_type: '',
    order_fields: '',
    query_fields: '',
    callback_fields: '',
    order_response: '',
    query_response: '',
    amount_type: '',
  }
}
// 弹窗确定
const enterDialog = async () => {
  elFormRef.value?.validate(async (valid) => {
    if (!valid) return
    let res

    formData.value.order_fields = JSON.stringify(orderFields.value)
    formData.value.query_fields = JSON.stringify(queryFields.value)
    formData.value.callback_fields = JSON.stringify(callbackFields.value)
    formData.value.order_response = JSON.stringify(orderResponseFields.value)
    formData.value.query_response = JSON.stringify(queryResponseFields.value)

    switch (type.value) {
      case 'create':
        res = await createPayTemplate(formData.value)
        break
      case 'update':
        res = await updatePayTemplate(formData.value)
        break
      default:
        res = await createPayTemplate(formData.value)
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
