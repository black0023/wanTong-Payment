<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="商户号:" prop="mch_no">
          <el-input v-model="formData.mch_no" :clearable="true"  placeholder="请输入商户号" />
       </el-form-item>
        <el-form-item label="支付通道:" prop="pay_channel">
          <el-input v-model="formData.pay_channel" :clearable="true"  placeholder="请输入支付通道" />
       </el-form-item>
        <el-form-item label="通道编码:" prop="pay_code">
          <el-input v-model="formData.pay_code" :clearable="true"  placeholder="请输入通道编码" />
       </el-form-item>
        <el-form-item label="通道费率:" prop="fee">
          <el-input-number v-model="formData.fee" :precision="2" :clearable="true"></el-input-number>
       </el-form-item>
        <el-form-item label="启用:" prop="enable">
          <el-input v-model.number="formData.enable" :clearable="true" placeholder="请输入" />
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
  createMerchantChannel,
  updateMerchantChannel,
  findMerchantChannel
} from '@/api/merchant/merchant_channel'

defineOptions({
    name: 'MerchantChannelForm'
})

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'

const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
            mch_no: '',
            pay_channel: '',
            pay_code: '',
            fee: 0,
            enable: 0,
        })
// 验证规则
const rule = reactive({
               mch_no : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               pay_channel : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               pay_code : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               fee : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               enable : [{
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
      const res = await findMerchantChannel({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.remerchant_channel
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
}

init()
// 保存按钮
const save = async() => {
      elFormRef.value?.validate( async (valid) => {
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
