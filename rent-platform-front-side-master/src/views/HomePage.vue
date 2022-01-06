<template>
  <div id="home-page">
    <!-- 头部导航栏选择绝对布局 -->
    <div class="message-container" v-show="msg">
      <div class="message-box">
        <div class="message-box-head">
          <div class="close" @click="closeMsg"></div>
        </div>
        <div class="message-box-main">

        </div>
      </div>
    </div>
    <div class="head-box-container" ref="head">
      <div class="head-box">
        <div class="head-box-left"></div>
        <div class="head-box-right">
          <div class="head-box-menu">
            <router-link to="/" class="head-box-menu-item">Home</router-link>
            <router-link :to="{path:'/homepage/items',query:{mode:0}}" class="head-box-menu-item">Items</router-link>
            <router-link to="/homepage/user" class="head-box-menu-item">My Info</router-link>
          </div>
          <router-link to="/login" class="sign-in" v-show="login">Sign In</router-link>
          <!-- <div class="sign-in" v-show="!login" @click="logout">Log Out</div> -->
           <router-link to="/homepage/rent">
            <div class="head-box-btn">
             <div class="head-box-btn-content">Rent An Item</div>
            </div>
          </router-link>
          <div class="user-active" v-show="!login">
            <div class="message">
              <div class="msg-icon" @click="openMsg()"></div>
              <div class="red-point-box">
                <div class="red-point" v-show="newMsg"></div>
              </div>
            </div>
            <div class="user-head" >
              <img class="user-avatar" @click="showOption()" :src="user.avatar"/>
              <div class="option-box-container" v-show="option" @mouseleave="hideOption()">
                <div class="option-box" @click="logout()">
                  <div class="option-item">Log out</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  computed: {
    login:function(){
      return !this.$store.state.login;
    },
    user:function(){
      return this.$store.state.user||this.userDefault;
    }
  },
  data () {
    return {
      option:false,
      newMsg:false,//新消息提醒
      msg:false,//消息窗口,
      searchInput:'',
      userDefault:{
        userId:-1,
        nickName:'',
        password:'',
        avatar:'',
        gender:'',
        telephone:'',
        email:'',
        zone:null,
        registerTime:null,
        role:0,
        reputation:0
      }
    }
  },
  methods: {
    logout(){
      this.$store.commit('LOGOUT');
      this.$router.push('/');
    },
    showOption(){
      this.option=true;
    },
    hideOption(){
      this.option=false;
    },
    openMsg(){
      this.msg=true;
    },
    closeMsg(){
      this.msg=false;
    },

  }
}
</script>

<style lang="scss" scoped>
  .message-container{
    position:fixed;
    top:0;
    bottom:0;
    left:0;
    right: 0;
    backdrop-filter: brightness(80%);
    z-index: 999999;
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
    .message-box{
      width:400px;
      height: 100%;
      background: white;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: flex-start;
      //background-image: url('../assets/flower.png');
      background-size: auto 200px;
      background-repeat: no-repeat;
      background-position: bottom center;
      .message-box-head{
        width:100%;
        height: auto;
        padding:5px;
        .close{
          width:20px;
          height: 20px;
          background-image: url('../assets/close.png');
          background-size: cover;
          transition: all .3s ease;
          &:hover{
            transform: rotate(90deg);
          }
        }
      }

      .message-box-main{
        height: calc(100% - 50px);
        width:100%;
        //background-color: lightblue;
      }
    }
  }
.head-box-container {
  position: fixed;
  background-color: white;
  top: 0;
  height: 80px;
  width: 100%;
  padding: 0 40px;
  z-index: 99999;
  transition: all .5s ease;

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
      background-image: url('../assets/img/logo.svg');
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
          transition: all .3s ease;
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
          content: '';
          display: inline-block;

          width: 20px;
          height: 20px;

          background-image: url('../assets/Login.svg');
          background-size: cover;
          background-repeat: no-repeat;
          margin-right: 3px;
        }
      }

      .sign-in:hover {
        color: rgba(245, 42, 42, 0.616);
      }

      .head-box-btn {
        user-select: none;
        font-size: 16px;
        background-color: rgb(43, 90, 225);
        color: white;
        width: 170px;
        height: 50px;
        border-radius: 25px;
        //margin-right: 50px;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        background-image: url('../assets/add.png');
        background-repeat: no-repeat;
        background-size: 25px 25px;
        background-position: left 20px center;
        transition: all .3s ease;

        .head-box-btn-content {
          flex-shrink: 0;
          margin-left: 30px;
        }
      }

      .head-box-btn:hover {
        background-color: rgb(34, 69, 175);
      }

      .user-active{
        display: flex;
        flex-direction: row;
        align-items: center;
          .message{
          display: flex;
          flex-direction: row;
          height: auto;
          margin-left: 20px;
          margin-right: 20px;
          .msg-icon{
            width:25px;
            height:25px;
            background-image: url('../assets/msg.png');
            background-size: cover;
          }
          .red-point-box{
            width:0;
            height:100%;
            display: felx;
            flex-direction: column;
            justify-content: flex-start;
            .red-point{
              border: 3.6px solid red;/*设置红色*/
              border-radius:3.6px;/*设置圆角*/
            }
          }
        }

        .user-head{
          display: flex;
          flex-direction: column;
          justify-content: flex-start;
          .user-avatar{
            width:50px;
            height:50px;
            border-radius: 25px;
            background-color: gray;
          }
          .option-box-container{
            height:0;
            width: 0;
            .option-box{
              padding:8px 0;
              width:100px;
              background-color: rgb(59, 103, 235);
              border-radius: 10px;
              transform: translateX(-25%) translateY(10px);
              &:hover{
                background-color: rgb(29, 76, 218);
              }
              .option-item{
                user-select: none;
                color: white;
                width:100%;
                text-align: center;
              }
            }
          }
        }
      }
    }
  }
}
</style>
