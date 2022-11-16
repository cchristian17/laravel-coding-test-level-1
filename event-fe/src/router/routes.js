import VueRouter from 'vue-router'
import Index from "@/components/Event/Index";
import Detail from "@/components/Event/Detail";
import Form from "@/components/Event/Form";
import Login from "@/components/Auth/Login";
import Cookies from "js-cookie";

function checkIsLogin(to, from, next) {
  if (Cookies.get('access_token')) {
    next()
  } else {
    next('/events');
  }
}

function preventReLogin(to, from, next) {
  if (Cookies.get('access_token')) {
    if (to.path === '/login') {
      next('/events')
    }
  }
  next()
}

const routes = [
  {
    path: '/',
    alias: '/events',
    name: 'Events',
    component: Index
  },
  {
    path: '*',
    redirect: '/events',
    component: Index
  },
  {
    path: '/events/create',
    name: 'Create',
    beforeEnter : checkIsLogin,
    component: Form,
  },
  {
    path: '/events/:id',
    name: 'Detail',
    component: Detail
  },
  {
    path: '/events/:id/edit',
    name: 'Edit',
    beforeEnter : checkIsLogin,
    component: Form,
  },
  {
    path: '/login',
    name: 'Login',
    beforeEnter: preventReLogin,
    component: Login,
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
export default router
