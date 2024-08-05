<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="通道名称:" prop="channel_name">
          <el-input v-model="formData.channel_name" :clearable="true"  placeholder="请输入通道名称" />
       </el-form-item>
        <el-form-item label="产品ID:" prop="product_id">
          <el-input v-model.number="formData.product_id" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="通道模板ID:" prop="template_id">
          <el-input v-model.number="formData.template_id" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="支付编码:" prop="payment_code">
          <el-input v-model="formData.payment_code" :clearable="true"  placeholder="请输入支付编码" />
       </el-form-item>
        <el-form-item label="金额范围:" prop="amount_range">
          <el-input v-model="formData.amount_range" :clearable="true"  placeholder="请输入金额范围" />
       </el-form-item>
        <el-form-item label="通道费率:" prop="fee">
          <el-input-number v-model="formData.fee" :precision="2" :clearable="true"></el-input-number>
       </el-form-item>
        <el-form-item label="备注:" prop="remark">
          <el-input v-model="formData.remark" :clearable="true"  placeholder="请输入备注" />
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
  createPayChannel,
  updatePayChannel,
  findPayChannel
} from '@/api/payment/pay_channel'

defineOptions({
    name: 'PayChannelForm'
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
            channel_name: '',
            product_id: '',
            template_id: '',
            payment_code: '',
            amount_range: '',
            fee: 0,
            remark: '',
        })
// 验证规则
const rule = reactive({
               channel_name : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               product_id : [{
                   required: true,
                   message: '请选择支付产品',
                   trigger: ['input','blur'],
               }],
               template_id : [{
                   required: true,
                   message: '请选择通道模板',
                   trigger: ['input','blur'],
               }],
               payment_code : [{
                   required: true,
                   message: '请输入支付编码',
                   trigger: ['input','blur'],
               }],
})

const elFormRef = ref()

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findPayChannel({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.repay_channel
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
               res = await createPayChannel(formData.value)
               break
             case 'update':
               res = await updatePayChannel(formData.value)
               break
             default:
               res = await createPayChannel(formData.value)
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
