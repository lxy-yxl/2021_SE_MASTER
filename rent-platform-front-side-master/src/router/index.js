import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '../store'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/homepage'
  },
  {
    path: '/homepage',
    name: 'HomePage',
    redirect: '/homepage/home',
    component: ()=>import('../views/HomePage.vue'),//lazy-load
    children:[
      {
        path: 'home',
        name: 'Home',
        component: ()=>import('../views/Home.vue'),//lazy-load
      },
      {
        path: 'items',
        name: 'Items',
        component: ()=>import('../views/ItemList.vue'),//lazy-load
      },
      {
        path: 'ItemDetail/:id',
        name: 'ItemDetail',
        component: ()=>import('../views/ItemDetail')//lazy-load
      },
      {
        path: 'rent',
        name: 'Rent',
        component: ()=>import('../views/RentItem.vue'),
        meta:{
          requiresAuth:true,
        },
      },
      {
        path: 'user',
        name: 'User',
        component: ()=>import('../views/UserCenter.vue'),//lazy-load，
        redirect: '/homepage/user/info',
        meta:{
          requiresAuth:true,
        },
        children:[
          {
            path: 'info',
            name: 'Info',
            component: ()=>import('../views/UserCenter/Info.vue'),//lazy-load
            meta:{
              requiresAuth:true,
            },
          },
          {
            path: 'myorder',
            name: 'MyOrder',
            component: ()=>import('../views/UserCenter/MyOrder.vue'),//lazy-load
            meta:{
              requiresAuth:true,
            },
          },
          {
            path: 'mycollect',
            name: 'MyCollect',
            component: ()=>import('../views/UserCenter/MyCollect.vue'),//lazy-load
            meta:{
              requiresAuth:true,
            },
          },
        ]
      },
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: ()=>import('../views/Login.vue')
  },
  {
    path: '/register',
    name: 'Register',
    component: ()=>import('../views/Register.vue')
  },
]
const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})



router.beforeEach((to, from, next) => {
  let token = store.state.token;
  console.log(token);
  //判断要去的路由有没有requiresAuth
  if (to.meta.requiresAuth) {
    if (store.state.login) { next();} //已经登陆，放行
    else { next({
      path: '/login',
      query: { redirect: to.fullPath } //将刚刚要去的路由path作为参数，方便登录成功后直接跳转到该路由
      });
    }
  } 
  else {
    next();
  }
});

export default router
