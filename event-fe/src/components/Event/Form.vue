<template>
  <section>
    <h2 class="title is-2">
      {{ this.$route.params.id ? 'Edit' : 'Create' }} Event
    </h2>
    <ValidationObserver ref="observer">

      <ValidationProvider
        name="name"
        rules="required|min:6"
        v-slot="{ errors, failed, passed }"
      >
        <b-field
          label="Name"
          horizontal
          :type="{ 'is-danger': failed, 'is-success': passed }"
          :message="errors[0]"
        >
          <b-input
            v-model="event.name"
            placeholder="Enter Name"
          />
        </b-field>
      </ValidationProvider>

      <ValidationProvider
        name="venue"
        rules="required"
        v-slot="{ errors, failed, passed }"
      >
        <b-field
          label="Venue"
          horizontal
          :type="{ 'is-danger': failed, 'is-success': passed }"
          :message="errors[0]"
          class="mt-4"
        >
          <b-input
            v-model="event.venue"
            placeholder="Enter Venue"
          />
        </b-field>
      </ValidationProvider>

      <ValidationProvider
        name="start at"
        rules="required"
        v-slot="{ errors, failed, passed }"
      >
        <b-field
          label="Start At"
          horizontal
          :type="{ 'is-danger': failed, 'is-success': passed }"
          :message="errors[0]"
          class="mt-4"
        >
          <b-datepicker
            placeholder="Click to select..."
            v-model="event.start_at"
            required
          />
        </b-field>
      </ValidationProvider>

      <ValidationProvider
        name="end at"
        rules="required"
        v-slot="{ errors, failed, passed }"
      >
        <b-field
          label="End At"
          horizontal
          :type="{ 'is-danger': failed, 'is-success': passed }"
          :message="errors[0]"
          class="mt-4"
        >
          <b-datepicker
            placeholder="Click to select..."
            v-model="event.end_at"
            required
          />
        </b-field>
      </ValidationProvider>

      <b-field label="Description" horizontal>
        <b-input
          type="textarea"
          v-model="event.description"
          placeholder="Enter Description"
          class="mt-4"
        />
      </b-field>
      <div class="buttons is-right mt-3">
        <b-button
          type="is-link"
          class="button is-primary mt-4"
          @click="submit"
        >
          {{ this.$route.params.id ? 'Edit' : 'Create' }}
        </b-button>
      </div>
    </ValidationObserver>
    <b-loading :is-full-page="true" v-model="isLoading"/>
  </section>
</template>

<script>
import mixin from "./mixins/form"

export default {
  mixins: [mixin],
};
</script>
