import ApiService from "@/services/api";
import Cookies from "js-cookie";

export default {
  name: "Index",
  data() {
    return {
      isAuthenticated: !!Cookies.get('access_token'),
      events: [],
      page: 1,
      perPage: 5,
      sortField: 'id',
      sortOrder: 'ASC',
      total: 0,
      isLoading: true,
      search: null,
    }
  },
  methods: {
    async loadEvents() {
      this.isLoading = true
      let params = [
        `paginated=1`,
        `sort_field=${this.sortField}`,
        `sort_order=${this.sortOrder}`,
        `per_page=${this.perPage}`,
        `page=${this.page}`,
      ]

      if (this.search) {
        params.push(`search=${this.search}`)
      }

      await ApiService
        .get(`events?${params.join('&')}`)
        .then(response => {
          this.events = response.data.data
          this.total = response.data.total
        })
        .catch((e) => {
          console.log(e)
        })
        .finally(() => {
          this.isLoading = false
        })
    },
    async onSort(field, order) {
      this.sortField = field
      this.sortOrder = order
      await this.loadEvents()
    },
    async onPageChange(page) {
      this.page = page
      await this.loadEvents()
    },
    async searchEvent() {
      await this.loadEvents()
    }
  },
  async mounted() {
    this.page = 0
    this.total = 0
    await this.loadEvents()
  }
}
