<template>
  <section class="section">
    <div class="container">
      <div class="card">
        <div class="card-content">
          <h1 class="title has-text-centered">Login</h1>
          <ValidationObserver v-slot="{ handleSubmit }">
            <form @submit.prevent="handleSubmit(login)">
              <ValidationProvider
                name="email"
                rules="required|email"
                v-slot="{ errors, failed, passed }"
              >
                <b-field
                  label="Email"
                  :type="{ 'is-danger': failed, 'is-success': passed }"
                  :message="errors[0]"
                >
                  <b-input
                    type="email"
                    v-model="email"
                  />
                </b-field>
              </ValidationProvider>
              <ValidationProvider
                name="password"
                rules="required"
                v-slot="{ errors, failed, passed }"
              >
                <b-field
                  label="Password"
                  :type="{ 'is-danger': failed, 'is-success': passed }"
                  :message="errors[0]"
                  class="mt-3"
                >
                  <b-input
                    type="password"
                    v-model="password"
                    password-reveal
                  />
                </b-field>
              </ValidationProvider>
              <div class="content has-text-centered">
                <b-button
                  class="button is-primary mt-5"
                  type="is-link"
                  native-type="submit"
                >
                  Login
                </b-button>
              </div>
            </form>
          </ValidationObserver>
        </div>
      </div>
      <b-loading :is-full-page="true" v-model="isLoading"/>
    </div>
  </section>
</template>

<script>
import ApiService from "@/services/api";
import Cookies from 'js-cookie';

export default {
  name: "Login",

  data() {
    return {
      email: null,
      password: null,
      isLoading: false,
    }
  },
  methods: {
    async login() {
      this.isLoading = true
      await ApiService
        .post(`login`, {
          'email': this.email,
          'password': this.password
        })
        .then(response => {
          let data = response.data.data
          this.$buefy.toast.open({
            message: `Welcome, ${data.user.name}!`,
            type: 'is-success',
          })
          Cookies.set('access_token', data.token)
          this.$router.go()
        })
        .catch((e) => {
          this.$buefy.toast.open({
            message: e.response.data.message,
            type: "is-danger",
            position: "is-bottom",
          })
        })
        .finally(() => {
          this.isLoading = false
        })
    },
  }
}
</script>

<style scoped>

</style>
