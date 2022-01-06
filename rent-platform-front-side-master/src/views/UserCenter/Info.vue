<template>
  <div class="user-info">
    <el-tabs type="border-card" tab-position="left" style="border-radius: 25px">
      <el-tab-pane label="Personal Data">
        <el-form
          ref="PersonalData"
          :model="PersonalData"
          label-width="20%"
          style="margin-top: 4%"
        >
          <el-form-item label="Avatar：">
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
              :show-file-list="false"
              accept=".jpg,.jpeg,.png,.gif,.bmp,.JPG,.JPEG,.PBG,.GIF,.BMP"
              list-type="picture"
            >
              <el-avatar
                :size="100"
                icon="el-icon-user-solid"
                :src="this.PersonalData.avatar"
              ></el-avatar>
            </el-upload>
          </el-form-item>
          <el-form-item label="Nickname：">
            <el-input
              v-model="PersonalData.nick_name"
              :disabled="editflag"
              class="input"
            >
            </el-input>
          </el-form-item>
          <el-form-item label="Gender：">
            <el-input
              v-model="PersonalData.gender"
              :disabled="editflag"
              class="input"
            >
            </el-input>
          </el-form-item>
          <el-form-item label="Telephone：">
            <el-input
              v-model="PersonalData.telephone"
              :disabled="editflag"
              class="input"
            >
            </el-input>
          </el-form-item>
          <el-form-item label="E-mail：">
            <el-input
              v-model="PersonalData.email"
              :disabled="editflag"
              class="input"
            >
            </el-input>
          </el-form-item>
          <el-form-item label="Zone：">
            <el-input
              v-model="PersonalData.zone"
              :disabled="editflag"
              class="input"
            >
            </el-input>
          </el-form-item>
          <el-form-item>
            <el-button
              icon="el-icon-edit"
              round
              v-show="editflag"
              @click="editflag = false"
              >Edit
            </el-button>
            <el-button
              icon="el-icon-check"
              type="success"
              round
              v-show="!editflag"
              @click="editUser"
            >
              Preserve
            </el-button>
            <el-button round v-show="!editflag" @click="editflag = true"
              >Cancel
            </el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>
      <el-tab-pane label="Account Information">
        <el-form label-width="20%">
          <el-form-item label="User ID："
            >{{ PersonalData.userId }}
          </el-form-item>
          <el-form-item label="Password：">
            <el-input
              v-model="PersonalData.password"
              :disabled="true"
              type="password"
              class="input"
            >
            </el-input>
            <el-button
              type="primary"
              icon="el-icon-edit"
              round
              @click="passwordchange = true"
              style="position: relative; left: 15px"
            >
              Change Password
            </el-button>
          </el-form-item>
          <el-form-item label="Register Time："
            >{{ PersonalData.register_time }}
          </el-form-item>
          <el-form-item label="Role：">
            <span v-if="PersonalData.role == 0">Ordinary User </span>
            <span v-else>Administrator</span>
          </el-form-item>
          <el-form-item label="Reputation："
            >{{ PersonalData.reputation }}
          </el-form-item>
        </el-form>
        <el-dialog
          title="Change Password"
          :visible.sync="passwordchange"
          width="40%"
          center
        >
          <el-form
            :model="passForm"
            status-icon
            :rules="rules"
            ref="passForm"
            label-width="25%"
            style="margin-right: 5%"
          >
            <el-form-item label="Orginal Password" prop="orgin">
              <el-input v-model="passForm.orgin"></el-input>
            </el-form-item>
            <el-form-item label="New Password" prop="pass">
              <el-input
                type="password"
                v-model="passForm.pass"
                autocomplete="off"
              ></el-input>
            </el-form-item>
            <el-form-item label="Confirm Password" prop="checkPass">
              <el-input
                type="password"
                v-model="passForm.checkPass"
                autocomplete="off"
              ></el-input>
            </el-form-item>
          </el-form>
          <span slot="footer">
            <el-button type="primary" @click="submitForm('passForm')" round
              >Confirm</el-button
            >
            <el-button @click="passwordchange = false" round>Cancel</el-button>
          </span>
        </el-dialog>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import axios from "../../axios";
var qs = require("qs");
export default {
  mounted() {
    let user = this.$store.state.user;
    if (!user) {
      this.$router.push("/");
    } else {
      this.PersonalData.nick_name = user.nickName;
      this.PersonalData.gender = user.gender;
      this.PersonalData.telephone = user.telephone;
      this.PersonalData.email = user.email;
      this.PersonalData.zone = user.zone;
      this.PersonalData.avatar = user.avatar;
      this.PersonalData.userId = user.userId;
      this.PersonalData.password = user.password;
      this.PersonalData.role = user.role;
      this.PersonalData.reputation = user.reputation;
    }
    console.log(this.PersonalData);
  },
  data() {
    var checkOrgin = (rule, value, callback) => {
      if (value != this.PersonalData.password) {
        return callback(new Error("Incorrect input of original password"));
      }
      callback();
    };
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("Please input a password"));
      } else {
        if (this.passForm.checkPass !== "") {
          this.$refs.passForm.validateField("checkPass");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("Please enter the password again"));
      } else if (value !== this.passForm.pass) {
        callback(new Error("The two passwords are inconsistent!"));
      } else {
        callback();
      }
    };
    return {
      PersonalData: {
        userId: -1,
        nick_name: "",
        password: "",
        avatar: "",
        gender: "",
        telephone: "",
        email: "",
        zone: "",
        role: 0,
        reputation: 0,
      },
      fileList: [],
      editflag: true,
      passwordchange: false,
      passForm: {
        orgin: "",
        pass: "",
        checkpass: "",
      },
      rules: {
        pass: [{ validator: validatePass, trigger: "blur" }],
        checkPass: [{ validator: validatePass2, trigger: "blur" }],
        orgin: [{ validator: checkOrgin, trigger: "blur" }],
      },
    };
  },
  methods: {
    HandlePreserve() {
      this.editflag = true;
      console.log(this.PersonalData);
    },
    editUser() {
      console.log(this.PersonalData);
      console.log('222');
      axios
        .updateUser(this.PersonalData)
        .then((res) => {
          console.log("上传成功");
          console.log(res);
      console.log(this.PersonalData);
        })
        .catch((err) => {
          console.log(err);
        });
      this.editflag = true;
    },
    submitForm(formName) {
      this.passwordchange = false;
      console.log(this.PersonalData);
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.PersonalData.password=this.passForm.pass;
      console.log(this.PersonalData);
          alert("submit!");
          axios
            .updateUser(this.PersonalData)
            .then((res) => {
              console.log("上传成功");
      console.log(this.PersonalData);
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
    // el-upload相关方法

    uploadSuccess(res) {
      // 图片上传成功后即调用的函数
      console.log("图片上传成功" + JSON.stringify(res));
      if (res.code == 0) {
        // sysUser为form表单对象，当上传成功后，后端会动将图片存储在数据库，数据库会自动为该图片生成一个名字，
        // 提交form表单时需要向后台发送服务器生成的图片名的字段
        // this.sysUser.logoImg = res.data.uploadUrl
        this.PersonalData.avatar = res.data;
        console.log(this.PersonalData.avatar);
        // 图片上传成功之后可以拿到服务器生成的图片名，赋值给表单对象，提交时再传递给后台
        // console.log('上传到服务器照片名' + this.sysUser.logoImg)
        this.$message({
          message: "上传成功",
          type: "success",
          duration: 1000,
        });
        // 上传成功后为当前页面中的img赋值src，即照片回显（回显的地址是后台传递给前端的）
        // this.imgShow = true
        // console.log(this.imgSrc)
      } else {
        this.$message({
          message: res.msg,
          type: "error",
          duration: 1000,
        });
        // this.$message.error(res.msg)
      }
      this.confirmLoading = false;
    },

    handleExceed(files, fileList) {
      // 文件超出个数限制的钩子
      console.log(files);
      console.log(fileList);
      this.$message({
        message: `当前限制选择1个文件，本次选择了 ${
          files.length
        }个文件，共选择了${files.length + fileList.length}个文件`,
        type: "warning",
        duration: 1000,
      });
    },

    uploading() {
      // 文件上传时的钩子
      console.log("正在上传...");
      this.confirmLoadig = true;
    },
    beforeAvatarUpload(file) {
      console.log(file);
    },
  },
};
</script>

<style lang="scss" scoped>
.user-info {
  margin-top: 80px;
  margin-left: 20%;
  margin-bottom: 5%;
  width: 60%;
  height: auto;
  //display: flex;
  //flex-direction: column;
  //justify-content: flex-start;
  //align-items: left;
  font-size: 30px;
}
.input {
  width: 50%;
}
</style>