<template>
  <section>
    <h2 class="title is-2">Event List</h2>
    <div class="level pt-3 job-list">
      <div class="level-left">
        <b-button
          type="is-link"
          icon-left="plus"
          tag="router-link"
          to="/events/create"
        >
          Add Event
        </b-button>
      </div>
      <div class="level-right">
        <b-input
          v-model="search"
          icon-right="magnify"
          placeholder="Search"
          @keydown.native.enter="searchEvent"
          icon-right-clickable
          @icon-right-click="searchEvent"
        />
      </div>
    </div>
    <b-table
      :data="events"
      :total="total"
      :per-page="perPage"
      paginated
      backend-pagination
      backend-sorting
      @sort="onSort"
      @page-change="onPageChange"
      :loading="isLoading"
    >
      <template>
        <b-table-column field="no" label="No" width="10" numeric v-slot="props" centered>
          {{ props.index + 1 }}
        </b-table-column>

        <b-table-column field="name" label="Name" v-slot="props" sortable centered>
          {{ props.row.name }}
        </b-table-column>

        <b-table-column field="venue" label="Venue" v-slot="props" sortable centered>
          {{ props.row.venue }}
        </b-table-column>

        <b-table-column field="start_at" label="Time" v-slot="props" sortable centered>
          {{ moment(props.row.start_at).format('DD MMMM YYYY') }}
          -
          {{ moment(props.row.start_at).format('DD MMMM YYYY') }}
        </b-table-column>

        <b-table-column label="Action" v-slot="props" centered>
          <b-tooltip
            label="Detail"
            type="is-light"
          >
            <b-button
              type="is-text"
              icon-left="eye"
              tag="router-link"
              :to="`/events/${props.row.id}`"
            />
          </b-tooltip>
          <b-tooltip
            label="Edit"
            type="is-light"
          >
            <b-button
              type="is-text"
              icon-left="pencil"
              tag="router-link"
              :to="`/events/${props.row.id}/edit`"
            />
          </b-tooltip>
        </b-table-column>
      </template>
      <template #empty>
        <div class="has-text-centered">No records</div>
      </template>
    </b-table>
  </section>
</template>

<script>
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
</script>
