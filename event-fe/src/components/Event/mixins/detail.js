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
      this.isLoading = true,
        await ApiService
          .get(`events/${id}`)
          .then(response => {
            this.event = response.data
            this.event.start_at = moment(this.event.start_at).format('DD MMMM YYYY')
            this.event.end_at = moment(this.event.end_at).format('DD MMMM YYYY')
          })
          .catch((e) => {
            console.log(e)
          })
          .finally(() => {
            this.isLoading = false
          })
    },
  },
  async mounted() {
    await this.loadEvent(this.$route.params.id)
  }
}
