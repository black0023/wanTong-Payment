<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="商户号:" prop="mch_no">
          <el-input v-model="formData.mch_no" :clearable="true"  placeholder="请输入商户号" />
       </el-form-item>
        <el-form-item label="商户账号:" prop="mch_acc">
          <el-input v-model="formData.mch_acc" :clearable="true"  placeholder="请输入商户账号" />
       </el-form-item>
        <el-form-item label="密码:" prop="password">
          <el-input v-model="formData.password" :clearable="true"  placeholder="请输入密码" />
       </el-form-item>
        <el-form-item label="昵称:" prop="nick_name">
          <el-input v-model="formData.nick_name" :clearable="true"  placeholder="请输入昵称" />
       </el-form-item>
        <el-form-item label="备注:" prop="remark">
          <el-input v-model="formData.remark" :clearable="true"  placeholder="请输入备注" />
       </el-form-item>
        <el-form-item label="Api秘钥:" prop="api_key">
          <el-input v-model="formData.api_key" :clearable="true"  placeholder="请输入Api秘钥" />
       </el-form-item>
        <el-form-item label="余额:" prop="balance">
          <el-input-number v-model="formData.balance" :precision="2" :clearable="true"></el-input-number>
       </el-form-item>
        <el-form-item label="启用:" prop="enable">
          <el-switch v-model="formData.enable" active-color="#13ce66" inactive-color="#ff4949" active-text="是" inactive-text="否" clearable ></el-switch>
       </el-form-item>
        <el-form-item label="最后登录:" prop="last_login">
          <el-date-picker v-model="formData.last_login" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
       </el-form-item>
        <el-form-item label="登录IP:" prop="login_ip">
          <el-input v-model="formData.login_ip" :clearable="true"  placeholder="请输入登录IP" />
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
  createMerchantInfo,
  updateMerchantInfo,
  findMerchantInfo
} from '@/api/merchant/merchant_info'

defineOptions({
    name: 'MerchantInfoForm'
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
            mch_acc: '',
            password: '',
            nick_name: '',
            remark: '',
            api_key: '',
            balance: 0,
            enable: false,
            last_login: new Date(),
            login_ip: '',
        })
// 验证规则
const rule = reactive({
               mch_no : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               mch_acc : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               nick_name : [{
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
      const res = await findMerchantInfo({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.remerchantInfo
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
