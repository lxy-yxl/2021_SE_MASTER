<template>
  <div>
    <img
      src="../assets/img/bg-banner-custome.jpg"
      style="z-index: -100; position: fixed; top: 8%; bottom: 0; height: 92%"
    />
    <!-- <div class="head-box-container" ref="head">
        <div class="head-box">
            <div class="head-box-left"></div>
            <div class="head-box-right">
            <div class="head-box-menu">
                <router-link to="/" class="head-box-menu-item"><i class="el-icon-s-home"/>Home</router-link>
                <router-link to="/homepage/items" class="head-box-menu-item"><i class="el-icon-s-goods"/>Items</router-link>
                <router-link to="/homepage/user" class="head-box-menu-item"><i class="el-icon-s-order"/>Orders</router-link>
            </div>
            <div class="sign-in" >Log Out</div>
            </div>
        </div>
        </div> -->
    <div style="position: absolute; top: 28%; left: 46%; z-index: 99">
      <div>Upload Pictures of Item</div>
      <el-upload
      class="avatar-uploade"
              name="file"
              action="http://121.37.172.109:9090/picture/upload"
              :on-success="uploadSuccess"
              multiple
              :limit="1"
              :on-exceed="handleExceed"
              :on-progress="uploading"
              :file-list="fileList"
              :before-upload="beforeAvatarUpload"
        accept=".jpg,.jpeg,.png,.gif,.bmp,.JPG,.JPEG,.PBG,.GIF,.BMP"
        list-type="picture"
      >
        <el-button
          style="min-height: 100px; min-width: 100px"
          icon="el-icon-plus"
        />
      </el-upload>
    </div>
    <el-card
      style="
        width: 55%;
        height: 70%;
        position: absolute;
        top: 20%;
        left: 10%;
        border-radius: 35px;
        padding: 50px;
      "
    >
      <el-form
        :model="itemForm"
        :rules="rules"
        ref="itemForm"
        label-width="150px"
        style="width: 60%"
      >
        <el-form-item label="Name" prop="name">
          <el-input v-model="itemForm.name"></el-input>
        </el-form-item>
        <el-form-item label="Category of Item" prop="tag">
          <el-radio-group v-model="itemForm.tag">
            <el-radio label="电子产品" border>电子产品</el-radio>
            <el-radio label="服饰" border>服饰</el-radio>
            <el-radio label="生活好物" border>生活好物</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Price per Day" prop="rent_daily">
          <el-input-number
            v-model="itemForm.rent_daily"
            controls-position="right"
            :min="0"
            :step="1"
            style="width: 100%"
          >
          </el-input-number>
        </el-form-item>

        <el-form-item label="Depoist" prop="deposit">
          <el-input-number
            v-model="itemForm.deposit"
            controls-position="right"
            :min="0"
            :step="1"
            style="width: 100%"
          >
          </el-input-number>
        </el-form-item>
        <el-form-item label="Description of Item" prop="description">
          <el-input type="textarea" v-model="itemForm.description"></el-input>
        </el-form-item>
        <el-form-item label="new_level" prop="new_level">
          <el-input v-model="itemForm.new_level"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" round @click="submitForm('itemForm')"
            >Upload</el-button
          >
          <el-button round @click="resetForm('itemForm')">Reset</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>


<script>
import axios from "../axios";
var qs = require("qs");
export default {
  computed: {
    user: function () {
      return this.$store.state.user;
    },
  },
  data() {
    return {
      itemForm: {
        user_id: this.$store.state.user.userId,
        name: "",
        rent_daily: new Number(),
        deposit: "",
        tag: "",
        description: "",
        new_level: "",
        url:'',
      },
      fileList: [],
      rules: {
        name: [
          { required: true, message: "Please input name", trigger: "blur" },
          {
            min: 1,
            max: 20,
            message: "The length must between 1 and 20 characters",
            trigger: "blur",
          },
        ],
        tag: [
          {
            required: true,
            message: "Please select at least one item tag",
            trigger: "change",
          },
        ],
        rent_daily: [
          {
            required: true,
            message: "Please input rental price per day",
            trigger: "change",
          },
        ],
        deposit: [
          {
            required: true,
            message: "Please input deposit",
            trigger: "change",
          },
        ],
        description: [
          {
            required: true,
            message: "Please input description of item",
            trigger: "blur",
          },
        ],
        new_level: [
          {
            required: true,
            message: "Please input new_level of item",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert("submit!");
          console.log(this.itemForm);
          // this.$refs.upload.submit();
          axios
            .uploadObject(this.itemForm)
            .then((res) => {
              console.log("上传成功");
            })
            .catch((err) => {
              console.log(err);
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    // el-upload相关方法
 
uploadSuccess(res) { // 图片上传成功后即调用的函数
      console.log('图片上传成功' + JSON.stringify(res))
      if (res.code == 0) {
        // sysUser为form表单对象，当上传成功后，后端会动将图片存储在数据库，数据库会自动为该图片生成一个名字，
        // 提交form表单时需要向后台发送服务器生成的图片名的字段
        // this.sysUser.logoImg = res.data.uploadUrl
        this.itemForm.url = res.data
        console.log(res.data)
        console.log(this.itemForm.url)
        // 图片上传成功之后可以拿到服务器生成的图片名，赋值给表单对象，提交时再传递给后台
        // console.log('上传到服务器照片名' + this.sysUser.logoImg)
        this.$message({
          message: '上传成功',
          type: 'success',
          duration: 1000
        })
        // 上传成功后为当前页面中的img赋值src，即照片回显（回显的地址是后台传递给前端的）
        // this.imgShow = true
        // console.log(this.imgSrc)
      } else {
        this.$message({
          message: res.msg,
          type: 'error',
          duration: 1000
        })
        // this.$message.error(res.msg)
      }
      this.confirmLoading = false
    },

  handleExceed(files, fileList) { // 文件超出个数限制的钩子
      console.log(files)
      console.log(fileList)
      this.$message({
        message: `当前限制选择1个文件，本次选择了 ${files.length}个文件，共选择了${files.length + fileList.length}个文件`,
        type: 'warning',
        duration: 1000
      })
    },
    
uploading() { // 文件上传时的钩子
     console.log('正在上传...')
     this.confirmLoadig = true
},
beforeAvatarUpload(file) {
        console.log(file);
      }
  },
};
</script>

<style lang="scss" scoped>
.head-box-container {
  position: fixed;
  background-color: white;
  top: 0;
  height: 80px;
  width: 100%;
  padding: 0 40px;
  z-index: 99999;
  transition: all 0.5s ease;

  .head-box {
    height: 100%;
    width: 100%;
    padding: 30px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;

    .head-box-left {
      height: 60px;
      width: 187px;
      background-image: url("../assets/img/logo.svg");
    }

    .head-box-right {
      display: flex;
      flex-direction: row;
      justify-content: flex-end;
      align-items: center;

      .head-box-menu {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        padding-right: 35px;

        .head-box-menu-item {
          user-select: none;
          width: 90px;
          height: 60px;
          display: flex;
          flex-direction: row;
          justify-content: center;
          align-items: center;
          transition: all 0.3s ease;
          text-decoration: none;
        }

        .head-box-menu-item:hover {
          color: rgba(245, 42, 42, 0.616);
        }
      }

      .sign-in {
        user-select: none;
        text-decoration: underline;
        margin-right: 53px;
        display: flex;
        flex-direction: row;
        align-items: center;

        &:before {
          content: "";
          display: inline-block;

          width: 20px;
          height: 20px;

          background-image: url("../assets/Login.svg");
          background-size: cover;
          background-repeat: no-repeat;
          margin-right: 3px;
        }
      }

      .sign-in:hover {
        color: rgba(245, 42, 42, 0.616);
      }
    }
  }
}
</style>
