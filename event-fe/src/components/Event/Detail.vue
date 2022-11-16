<template>
  <section>
    <h2 class="title is-2">Event Detail</h2>
    <b-field label="Name" horizontal>
      <b-input
        v-model="event.name"
        placeholder="Enter Name"
        readonly
      />
    </b-field>

    <b-field label="Slug" horizontal>
      <b-input
        v-model="event.slug"
        placeholder="Enter Slug"
        readonly
      />
    </b-field>

    <b-field label="Venue" horizontal>
      <b-input
        v-model="event.venue"
        placeholder="Enter Venue"
        readonly
      />
    </b-field>

    <b-field label="Start At" horizontal>
      <b-input
        v-model="event.start_at"
        readonly
      />
    </b-field>

    <b-field label="End At" horizontal>
      <b-input
        v-model="event.end_at"
        readonly
      />
    </b-field>

    <b-field label="Description" horizontal>
      <b-input
        type="textarea"
        v-model="event.description"
        placeholder="Enter Description"
        readonly
      />
    </b-field>
    <b-loading :is-full-page="true" v-model="isLoading"/>
  </section>
</template>

<script>
import mixin from "./mixins/detail"

export default {
  mixins: [mixin],
};
</script>
