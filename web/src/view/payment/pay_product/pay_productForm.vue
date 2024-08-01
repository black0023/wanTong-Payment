<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="产品名称:" prop="pay_name">
          <el-input v-model="formData.pay_name" :clearable="true"  placeholder="请输入产品名称" />
       </el-form-item>
        <el-form-item label="产品编码:" prop="pay_code">
          <el-input v-model="formData.pay_code" :clearable="true"  placeholder="请输入产品编码" />
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
  createPayProduct,
  updatePayProduct,
  findPayProduct
} from '@/api/payment/pay_product'

defineOptions({
    name: 'PayProductForm'
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
            pay_name: '',
            pay_code: '',
            enable: 0,
        })
// 验证规则
const rule = reactive({
               pay_name : [{
                   required: true,
                   message: '请输入正确的产品名称',
                   trigger: ['input','blur'],
               }],
               pay_code : [{
                   required: true,
                   message: '请输入正确的产品编码',
                   trigger: ['input','blur'],
               }],
})

const elFormRef = ref()

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findPayProduct({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.repay_product
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
               res = await createPayProduct(formData.value)
               break
             case 'update':
               res = await updatePayProduct(formData.value)
               break
             default:
               res = await createPayProduct(formData.value)
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
