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
          v-if="isAuthenticated"
        >
          Add Event
        </b-button>
      </div>
      <div class="level-right">
        <b-input
          v-model="search"
          icon-right="magnify"
          placeholder="Search Event Name"
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
            v-if="isAuthenticated"
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
import mixin from "./mixins/event"

export default {
  mixins: [mixin],
};
</script>
