import ApiService from "@/services/api";

export default {
  name: "Index",
  data() {
    return {
      events: [],
      page: 1,
      perPage: 5,
      sortField: 'id',
      sortOrder: 'ASC',
      total: 0,
      isLoading: true,
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
  },
  async mounted() {
    await this.loadEvents()
  }
}
