import slugify from "slugify";

export default {
  beforeCreate(event) {
    // console.log("beforeCreate event:", event);
    const { data } = event.params;

    // Ensure you're using the field that exists in your schema - assuming 'name' is the event title
    if (data.name) {
      data.slug = slugify(data.name, { lower: true });
    }
  },

  beforeUpdate(event) {
    // console.log("beforeUpdate event:", event);
    const { data } = event.params;

    if (data.name) {
      data.slug = slugify(data.name, { lower: true });
    }
  },
};
