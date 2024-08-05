<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="模板名称:" prop="template_name">
          <el-input v-model="formData.template_name" :clearable="true"  placeholder="请输入模板名称" />
       </el-form-item>
        <el-form-item label="商户号:" prop="mch_no">
          <el-input v-model="formData.mch_no" :clearable="true"  placeholder="请输入商户号" />
       </el-form-item>
        <el-form-item label="商户名:" prop="mch_acc">
          <el-input v-model="formData.mch_acc" :clearable="true"  placeholder="请输入商户名" />
       </el-form-item>
        <el-form-item label="AppId:" prop="app_id">
          <el-input v-model="formData.app_id" :clearable="true"  placeholder="请输入AppId" />
       </el-form-item>
        <el-form-item label="签名类型:" prop="sign_type">
           <el-select v-model="formData.sign_type" placeholder="请选择签名类型" style="width:100%" :clearable="true" >
              <el-option v-for="(item,key) in signTypeOptions" :key="key" :label="item.label" :value="item.value" />
           </el-select>
       </el-form-item>
        <el-form-item label="MD5秘钥:" prop="md5_key">
          <el-input v-model="formData.md5_key" :clearable="true"  placeholder="请输入MD5秘钥" />
       </el-form-item>
        <el-form-item label="RSA公钥:" prop="rsa_pub">
          <el-input v-model="formData.rsa_pub" :clearable="true"  placeholder="请输入RSA公钥" />
       </el-form-item>
        <el-form-item label="RSA私钥:" prop="rsa_priv">
          <el-input v-model="formData.rsa_priv" :clearable="true"  placeholder="请输入RSA私钥" />
       </el-form-item>
        <el-form-item label="下单接口:" prop="order_url">
          <el-input v-model="formData.order_url" :clearable="true"  placeholder="请输入下单接口" />
       </el-form-item>
        <el-form-item label="查单接口:" prop="query_url">
          <el-input v-model="formData.query_url" :clearable="true"  placeholder="请输入查单接口" />
       </el-form-item>
        <el-form-item label="回调IP:" prop="callback_ip">
          <el-input v-model="formData.callback_ip" :clearable="true"  placeholder="请输入回调IP" />
       </el-form-item>
        <el-form-item label="商品标题:" prop="subject_title">
          <el-input v-model="formData.subject_title" :clearable="true"  placeholder="请输入商品标题" />
       </el-form-item>
        <el-form-item label="商品描述:" prop="subject_desc">
          <el-input v-model="formData.subject_desc" :clearable="true"  placeholder="请输入商品描述" />
       </el-form-item>
        <el-form-item label="备注:" prop="remark">
          <el-input v-model="formData.remark" :clearable="true"  placeholder="请输入备注" />
       </el-form-item>
        <el-form-item label="订单成功编码:" prop="success_status">
          <el-input v-model="formData.success_status" :clearable="true"  placeholder="请输入订单成功编码" />
       </el-form-item>
        <el-form-item label="回调成功返回:" prop="callback_str">
          <el-input v-model="formData.callback_str" :clearable="true"  placeholder="请输入回调成功返回" />
       </el-form-item>
        <el-form-item label="调用类型:" prop="request_type">
           <el-select v-model="formData.request_type" placeholder="请选择调用类型" style="width:100%" :clearable="true" >
              <el-option v-for="(item,key) in methodTypeOptions" :key="key" :label="item.label" :value="item.value" />
           </el-select>
       </el-form-item>
        <el-form-item label="回调类型:" prop="callback_type">
           <el-select v-model="formData.callback_type" placeholder="请选择回调类型" style="width:100%" :clearable="true" >
              <el-option v-for="(item,key) in methodTypeOptions" :key="key" :label="item.label" :value="item.value" />
           </el-select>
       </el-form-item>
        <el-form-item label="下单参数:" prop="order_fields">
          <RichEdit v-model="formData.order_fields"/>
       </el-form-item>
        <el-form-item label="查单参数:" prop="query_fields">
          <RichEdit v-model="formData.query_fields"/>
       </el-form-item>
        <el-form-item label="回调参数:" prop="callback_fields">
          <RichEdit v-model="formData.callback_fields"/>
       </el-form-item>
        <el-form-item label="下单返回参数:" prop="order_response">
          <RichEdit v-model="formData.order_response"/>
       </el-form-item>
        <el-form-item label="查单返回参数:" prop="query_response">
          <RichEdit v-model="formData.query_response"/>
       </el-form-item>
        <el-form-item label="金额类型:" prop="amount_type">
           <el-select v-model="formData.amount_type" placeholder="请选择金额类型" style="width:100%" :clearable="true" >
              <el-option v-for="(item,key) in amountTypeOptions" :key="key" :label="item.label" :value="item.value" />
           </el-select>
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
  createPayTemplate,
  updatePayTemplate,
  findPayTemplate
} from '@/api/payment/pay_template'

defineOptions({
    name: 'PayTemplateForm'
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
const signTypeOptions = ref([])
const methodTypeOptions = ref([])
const amountTypeOptions = ref([])
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
               template_name : [{
                   required: true,
                   message: '请输入正确的模板名称',
                   trigger: ['input','blur'],
               }],
               mch_no : [{
                   required: true,
                   message: '请输入正确的商户号',
                   trigger: ['input','blur'],
               }],
               sign_type : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               order_url : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               success_status : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               callback_str : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               request_type : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               callback_type : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               order_fields : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               callback_fields : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               order_response : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               amount_type : [{
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
      const res = await findPayTemplate({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.repay_template
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
    signTypeOptions.value = await getDictFunc('signType')
    methodTypeOptions.value = await getDictFunc('methodType')
    amountTypeOptions.value = await getDictFunc('amountType')
}

init()
// 保存按钮
const save = async() => {
      elFormRef.value?.validate( async (valid) => {
         if (!valid) return
            let res
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
