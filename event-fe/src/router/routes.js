import VueRouter from 'vue-router'
import Index from "@/components/Event/Index";
import Detail from "@/components/Event/Detail";
import Form from "@/components/Event/Form";

const routes = [
  {
    path: '/',
    alias: '/events',
    name: 'Events',
    component: Index
  },
  {
    path: '/events/create',
    name: 'Create',
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
    component: Form,
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
export default router
