import ApiService from "@/services/api";
import moment from "moment";

export default {
  data() {
    return {
      event: {
        name: null,
        slug: null,
        venue: null,
        description: null,
        start_at: null,
        end_at: null,
      },
      isLoading: false,
    }
  },
  methods: {
    async loadEvent(id) {
      this.isLoading = true
        await ApiService
          .get(`events/${id}`)
          .then(response => {
            this.event = response.data
            this.event.start_at = new Date(this.event.start_at)
            this.event.end_at = new Date(this.event.end_at)
          })
          .catch((e) => {
            console.log(e)
          })
          .finally(() => {
            this.isLoading = false
          })
    },
    async editEvent(id) {
      this.isLoading = true

      let params = {
        "name": this.event.name,
        "venue": this.event.venue,
        "description": this.event.description,
        "start_at": moment(this.event.start_at).format('YYYY-MM-DD'),
        "end_at": moment(this.event.start_at).format('YYYY-MM-DD'),
      }

      await ApiService
        .put(`events/${id}`, params)
        .then(() => {
          this.$buefy.toast.open({
            message: 'Event Updated Successfully!',
            type: 'is-success',
          })
          this.$router.push({ path: '/events' })
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
    async storeEvent() {
      this.isLoading = true

      let params = {
        "name": this.event.name,
        "venue": this.event.venue,
        "description": this.event.description,
        "start_at": moment(this.event.start_at).format('YYYY-MM-DD'),
        "end_at": moment(this.event.start_at).format('YYYY-MM-DD'),
      }

      await ApiService
        .post(`events`, params)
        .then(() => {
          this.$buefy.toast.open({
            message: 'Event Created Successfully!',
            type: 'is-success',
          })
          this.$router.push({ path: '/events' })
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

    async submit() {
      this.$refs.observer.validate().then(async (success) => {
        if (success) {
          if (this.$route.params.id) {
            await this.editEvent(this.$route.params.id)
          } else {
            await this.storeEvent()
          }        }
      });
    },
  },
  async mounted() {
    if (this.$route.params.id) {
      await this.loadEvent(this.$route.params.id)
    }
  }
}
