<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="商户号:" prop="mch_no">
          <el-input v-model="formData.mch_no" :clearable="true"  placeholder="请输入商户号" />
       </el-form-item>
        <el-form-item label="商户名:" prop="mch_name">
        <el-select  v-model="formData.mch_name" placeholder="请选择商户名" style="width:100%" :clearable="true" >
          <el-option v-for="(item,key) in dataSource.mch_name" :key="key" :label="item.label" :value="item.value" />
        </el-select>
       </el-form-item>
        <el-form-item label="平台订单号:" prop="platform_order">
          <el-input v-model="formData.platform_order" :clearable="true"  placeholder="请输入平台订单号" />
       </el-form-item>
        <el-form-item label="商户订单号:" prop="merchant_order">
          <el-input v-model="formData.merchant_order" :clearable="true"  placeholder="请输入商户订单号" />
       </el-form-item>
        <el-form-item label="支付产品:" prop="product_id">
          <el-input v-model="formData.product_id" :clearable="true"  placeholder="请输入支付产品" />
       </el-form-item>
        <el-form-item label="产品编码:" prop="product_code">
          <el-input v-model="formData.product_code" :clearable="true"  placeholder="请输入产品编码" />
       </el-form-item>
        <el-form-item label="通道ID:" prop="channel_id">
          <el-input v-model="formData.channel_id" :clearable="true"  placeholder="请输入通道ID" />
       </el-form-item>
        <el-form-item label="通道编码:" prop="channel_code">
          <el-input v-model="formData.channel_code" :clearable="true"  placeholder="请输入通道编码" />
       </el-form-item>
        <el-form-item label="金额:" prop="amount">
          <el-input v-model.number="formData.amount" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="订单状态:" prop="status">
           <el-select v-model="formData.status" placeholder="请选择订单状态" style="width:100%" :clearable="true" >
              <el-option v-for="(item,key) in orderStatusOptions" :key="key" :label="item.label" :value="item.value" />
           </el-select>
       </el-form-item>
        <el-form-item label="回调地址:" prop="notify_url">
          <RichEdit v-model="formData.notify_url"/>
       </el-form-item>
        <el-form-item label="跳转地址:" prop="return_url">
          <RichEdit v-model="formData.return_url"/>
       </el-form-item>
        <el-form-item label="扩展参数:" prop="ext_param">
          <RichEdit v-model="formData.ext_param"/>
       </el-form-item>
        <el-form-item label="成功时间:" prop="success_time">
          <el-date-picker v-model="formData.success_time" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
       </el-form-item>
        <el-form-item label="回调时间:" prop="callback_time">
          <el-date-picker v-model="formData.callback_time" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
       </el-form-item>
        <el-form-item label="回调次数:" prop="callback_count">
          <el-input v-model.number="formData.callback_count" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="商品标题:" prop="subject_tit">
          <el-input v-model="formData.subject_tit" :clearable="true"  placeholder="请输入商品标题" />
       </el-form-item>
        <el-form-item label="商品描述:" prop="subject_desc">
          <el-input v-model="formData.subject_desc" :clearable="true"  placeholder="请输入商品描述" />
       </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="save">保存</el-button>
          <el-button type="primary" @click="back">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import {
  createTradeOrder,
  updateTradeOrder,
  findTradeOrder
} from '@/api/trade/trade_order'

defineOptions({
    name: 'TradeOrderForm'
})

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'
// 富文本组件
import RichEdit from '@/components/richtext/rich-edit.vue'

const route = useRoute()
const router = useRouter()

const type = ref('')
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
            notify_url: '',
            return_url: '',
            ext_param: '',
            success_time: new Date(),
            callback_time: new Date(),
            callback_count: 0,
            subject_tit: '',
            subject_desc: '',
        })
// 验证规则
const rule = reactive({
               mch_no : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               mch_name : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               platform_order : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               merchant_order : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               product_id : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               product_code : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               channel_id : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               channel_code : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               amount : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               status : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
})

const elFormRef = ref()

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findTradeOrder({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.retrade_order
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
    orderStatusOptions.value = await getDictFunc('orderStatus')
}

init()
// 保存按钮
const save = async() => {
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
           }
       })
}

// 返回按钮
const back = () => {
    router.go(-1)
}

</script>

<style>
</style>
