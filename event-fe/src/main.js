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

import { ValidationProvider, extend, ValidationObserver } from "vee-validate";
import * as rules from "vee-validate/dist/rules";
import messages from "vee-validate/dist/locale/en.json";

Vue.component("ValidationProvider", ValidationProvider);
Vue.component("ValidationObserver", ValidationObserver);

Object.keys(rules).forEach((rule) => {
  extend(rule, {
    ...rules[rule], // copies rule configuration
    message: messages.messages[rule], // assign message
  });
});


new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
