<template>
  <div id="app">
    <b-navbar>
      <template #brand>
        <b-navbar-item
          tag="router-link"
          :to="{ path: '/events' }"
        >
          Event App
        </b-navbar-item>
      </template>
      <template #end>
        <b-navbar-item tag="div">
          <div v-if="isAuthenticated" class="buttons">
            <span class="has-text-weight-semibold mr-3">
              Hi, {{ user.name }}
            </span>
            <b-button
              type="is-danger"
              @click="logout"
            >
              Logout
            </b-button>
          </div>
          <div v-else class="buttons">
            <b-button
              class="is-primary"
              @click="signup"
            >
              <strong>Sign up</strong>
            </b-button>
            <b-button
              class="is-light"
              tag="router-link"
              to="/login"
            >
              Log in
            </b-button>
          </div>
        </b-navbar-item>
      </template>
    </b-navbar>
    <main>
      <div class="container mt-3">
        <router-view />
      </div>
    </main>
  </div>
</template>

<script>
import Cookies from 'js-cookie';
import ApiService from "@/services/api";

export default {
  name: 'App',

  data() {
    return {
      isAuthenticated: !!Cookies.get('access_token'),
      user: {
        name: null,
      },
    }
  },

  methods : {
    getUser() {
      ApiService
        .get(`user-token`)
        .then(response => {
          this.user = response.data.data.user
        })
        .catch((e) => {
          console.log(e)
        })
    },
    signup() {
      this.$buefy.toast.open({
        message: 'Feature is not ready yet.',
        type: "is-danger",
        position: "is-bottom",
      })
    },
    logout() {
      ApiService
        .get(`logout`)
        .then(() => {
          this.$buefy.toast.open({
            message: 'Logout Success!',
            type: 'is-success',
          })
          this.$router.go()
        })
        .catch((e) => {
          console.log(e)
        })
        .finally(() => {
          Cookies.remove('access_token')
          this.isAuthenticated = false
        })
    }
  },
  mounted() {
    if (this.isAuthenticated) {
      this.getUser()
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
