<template>
    <div>
      <el-form
        :model="postForm"
        :rules="rules"
        ref="postForm"
        label-width="150px"
        style="width: 60%;margin:5%"
      >
        <el-form-item label="所需物品名称" prop="title">
          <el-input v-model="postForm.title" placeholder="好的标题能吸引更多的人看哦"></el-input>
        </el-form-item>
        <el-form-item label="所需物品描述" prop="content">
          <el-input
          type="textarea"
          v-model="postForm.content"
        :rows="8"
          placeholder="请描述所需物品的种类、名称、可交易的时间、地点等等"></el-input>
        </el-form-item>
        <el-form-item label="预期租金价格" prop="expected_price">
          <el-input-number
            v-model="postForm.expected_price"
            controls-position="right"
            :min="0"
            :step="1"
            :precision='0'
            style="width: 100%"
          >
          </el-input-number>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" round @click="submitForm('postForm')"
            >发布需求</el-button
          >
          <el-button round @click="resetForm('postForm')">重新输入</el-button>
        </el-form-item>
      </el-form>
    </div>
</template>
<script>
import axios from '../../axios'
export default {
    data(){
        return{
            postForm:{
              user_id:this.$store.state.user.userId,
                title:'',
                content:'',
                expected_price:''
            },
            
      rules: {
        title: [
          { required: true, message: "请输入所需物品名称", trigger: "blur" },
          {
            min: 1,
            max: 20,
            message: "输入长度在1至20字符内",
            trigger: "blur",
          },
        ],
       expected_price: [
          {
            required: true,
            message: "请输入预期价格",
            trigger: "change",
          },
        ],
        content: [
          {
            required: true,
            message: "请输入所需物品描述",
            trigger: "blur",
          },
        ],
      },
        }
    },
    methods:{ 
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            axios.publishPost(this.postForm)
            .then(()=>{
            this.$message({
          message: "发布成功",
          type: "success",
          offset:100
        });
            this.$router.push('/homepage/posts/mypost');
            })
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    }
}
</script>