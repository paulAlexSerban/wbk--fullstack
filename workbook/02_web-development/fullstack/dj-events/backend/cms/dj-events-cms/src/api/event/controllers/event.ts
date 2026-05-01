/**
 * event controller
 */

import { factories } from "@strapi/strapi";
import { create } from "domain";

export default factories.createCoreController(
  "api::event.event",
  ({ strapi }) => ({
    // Get all events created by the logged-in user
    async myEvents(ctx) {
      const user = ctx.state.user;
      if (!user) {
        return ctx.unauthorized(
          "You must be logged in to access this resource"
        );
      }

      const { query } = ctx;
      const userId = user.id;
      if (!userId) {
        return ctx.unauthorized(
          "You must be logged in to access this resource"
        );
      }
      try {
        const events = await strapi.service("api::event.event").find({
          filters: {
            user: userId,
          },
          ...query,
          populate: ["image"],
        });
        if (!events || events.length === 0) {
          return ctx.send({
            data: [],
            meta: { total: 0 },
          });
        }
        return ctx.send(events);
      } catch (error) {
        ctx.logger.error(error);
        return ctx.badRequest("An error occurred while fetching your events");
      }
    },

    // create event with linked user
    async create(ctx) {
      const user = ctx.state.user;
      if (!user) {
        return ctx.unauthorized(
          "You must be logged in to access this resource"
        );
      }

      const { data } = ctx.request.body;
      if (!data) {
        return ctx.badRequest("No data provided");
      }
      try {
        const event = await strapi.entityService.create("api::event.event", {
          data: {
            ...data,
            user: user.id,
          },
        });
        return ctx.created({ data: event });
      } catch (error) {
        ctx.logger.error(error);
        return ctx.badRequest("An error occurred while creating the event");
      }
    },
  })
);
