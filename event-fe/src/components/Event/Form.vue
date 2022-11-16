<template>
  <section>
    <h2 class="title is-2">
        {{ this.$route.params.id ? 'Edit' : 'Create'}} Event
    </h2>
    <b-field label="Name" horizontal>
      <b-input
        v-model="event.name"
        placeholder="Enter Name"
      />
    </b-field>

    <b-field label="Venue" horizontal>
      <b-input
        v-model="event.venue"
        placeholder="Enter Venue"
      />
    </b-field>

    <b-field label="Start At" horizontal>
      <b-datepicker
        placeholder="Click to select..."
        v-model="event.start_at"
        required
      />
    </b-field>

    <b-field label="End At" horizontal>
      <b-datepicker
        placeholder="Click to select..."
        v-model="event.end_at"
        required
      />
    </b-field>

    <b-field label="Description" horizontal>
      <b-input
        type="textarea"
        v-model="event.description"
        placeholder="Enter Description"
      />
    </b-field>
    <div class="buttons is-right mt-3">
      <b-button
        type="is-link"
        @click="submit"
      >
        {{ this.$route.params.id ? 'Edit' : 'Create'}}
      </b-button>
    </div>
    <b-loading :is-full-page="true" v-model="isLoading"/>
  </section>
</template>

<script>
import mixin from "./mixins/form"

export default {
  mixins: [mixin],
};
</script>
