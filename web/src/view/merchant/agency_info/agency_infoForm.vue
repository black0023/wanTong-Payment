<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="代理账号:" prop="account">
          <el-input v-model="formData.account" :clearable="true"  placeholder="请输入代理账号" />
       </el-form-item>
        <el-form-item label="代理昵称:" prop="nick_name">
          <el-input v-model="formData.nick_name" :clearable="true"  placeholder="请输入代理昵称" />
       </el-form-item>
        <el-form-item label="余额:" prop="balance">
          <el-input-number v-model="formData.balance" :precision="2" :clearable="true"></el-input-number>
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
  createAgencyInfo,
  updateAgencyInfo,
  findAgencyInfo
} from '@/api/merchant/agency_info'

defineOptions({
    name: 'AgencyInfoForm'
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
            account: '',
            nick_name: '',
            balance: 0,
            enable: 0,
        })
// 验证规则
const rule = reactive({
               account : [{
                   required: true,
                   message: '请输入代理账号',
                   trigger: ['input','blur'],
               }],
               nick_name : [{
                   required: true,
                   message: '请输入代理昵称',
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
      const res = await findAgencyInfo({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.reagency_info
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
               res = await createAgencyInfo(formData.value)
               break
             case 'update':
               res = await updateAgencyInfo(formData.value)
               break
             default:
               res = await createAgencyInfo(formData.value)
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
