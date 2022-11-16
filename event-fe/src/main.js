import Vue from 'vue'
import App from '@/App.vue'
import VueRouter from 'vue-router'
import router from "@/router/routes";

Vue.config.productionTip = false
Vue.use(VueRouter)

import Buefy from 'buefy';
import 'buefy/dist/buefy.css'
Vue.use(Buefy)

import moment from 'moment'
Vue.prototype.moment = moment

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
