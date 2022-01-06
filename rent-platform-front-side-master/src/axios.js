//axios.js
import axios from 'axios'
import store from './store'
import router from './router'

//创建axios实例
var instance = axios.create({
 timeout: 5000, //请求超过5秒即超时返回错误
 headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' },
});
//request拦截器
instance.interceptors.request.use(
 config => {
  //判断是否存在token，如果存在的话，则每个http header都加上token
  if (store.state.token) {
   config.headers.Authorization = `Bearer ${store.state.token}`;
  }
  return config;
 }
);
// respone拦截器
// instance.interceptors.response.use(
//  response => {
//   return response;
//  },
//  error => { //默认除了2XX之外的都是错误的，就会走这里
//   if (error.response) {
//    switch (error.response.status) {
//     case 401:
//      router.replace({ //跳转到home页面
//       path: 'home',
//       //query: { redirect: router.currentRoute.fullPath } // 将跳转的路由path作为参数，登录成功后跳转到该路由
//      });
//    }
//   }
//   return Promise.reject(error.response);
//  }
// );
var url = 'http://101.35.194.132:9090/';  //服务器连接
export default {
  //这里export的是axios
  //所以引用的方法是: import axios from '../axios.js';
  //用户注册
  userEnable(data){
    return instance.post(url+'/auth/enable', data);
  },
  //用户登录(只是拿到token)
  userLogin(data){
    return instance.post(url+'/user/login', data);
  },
  //获取用户
  getUserByToken(data){
    return instance.post(url+'/users/userByToken',data);
  },
  //删除用户
  delUser(data){
    return instance.post('/api/delUser', data);
  },
  //获取课程
  getCourses(data){
    return instance.post(url+'/course/myCourses',data);
  },
  getProjects(data){
    return instance.post(url+'/project/myProjects',data);
  },
  getRecommendList(){
    return instance.get(url+'/object/recommend');
  },
  getListByType(data){
    return instance.get(url+'/object/getObjectListByType?'+'type='+data.type+'&page='+data.page);
  },
  searchListByName(data){
    return instance.get(url+'/object/searchObject?'+'name='+data.name+'&page='+data.page);
  },
  getObjectDetail(id){
    return instance.get(url+'/object/getObjectDetail?'+'object_id='+id);
  },
  getUserByToken(data){
    return instance.post(url+'user/getUserByToken',data);
  },
  uploadObject(data){
    return instance.post(url+'object/uploadObject?'+'user_id='+data.user_id+'&name='+data.name+'&description='+data.description+'&deposit='+data.deposit+'&tag='+data.tag+'&rent_daily'+data.rent_daily+'&new_level='+data.new_level+'&url='+data.url);
  },
  uploadPicture(data){
    return instance.post(url+'picture/upload',data);
  },
  getOrderList(id){
    return instance.get(url+'/order/getOrderList?user_id='+id);
  },
  register(data){
    return instance.post(url+'/user/insert',data);
  },
  getCommentByItemId(id){
    return instance.get(url+'/remarks/getRemarkList?object_id='+id);
  },
  createOrder(data){
    //console.log('url',url+'/order/generateOrder?object_id='+data.objectId+'&borrower_id='+data.userId+'&lentout_time='+data.time1+'&return_time='+data.time2+'&campus='+data.zone);
    return instance.post(url+'/order/generateOrder?object_id='+data.objectId+'&borrower_id='+data.userId+'&lentout_time='+data.time1+'&return_time='+data.time2+'&campus='+data.zone);
  },
  cancleOrder(id){
    return instance.get(url+'/order/cancelOrder?order_id='+id);
  },
  pay(id){
    return instance.get(url+'/order/pay?order_id='+id);
  },
  comment(data){
    return instance.put(url+'/remarks/giveRemark?object_id='+data.objectId+'&user_id='+data.userId+'&content='+data.content+'&grade='+data.star+'&type=1');
  },
  collect(id){
    return instance.post(url+'/fav/collect?fav_id=1&object_id='+id);
  },
  getCollect(){
    return instance.get(url+'/fav/viewFavouriteCart?fav_id=1');
  },
  updateUser(data){
    return instance.post(url+'user/modifyUserInfo?'+'user_id='+data.userId+'&nick_name='+data.nick_name+'&password='+data.password+'&avatar='+data.avatar+'&gender='+data.gender+'&telephone='+data.telephone+'&email='+data.email+'&zone='+data.zone);
  },

}