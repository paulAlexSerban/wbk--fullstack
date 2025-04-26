import type { NextApiRequest, NextApiResponse } from "next";

import { EventsResponseData } from "@/types";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    GET: async () => {
      res.status(200).json({
        message: "GET method is not implemented yet",
      });
    },

    POST: async () => {
      const { data } = req.body;
      const { name, performers, address, venue, date, time, description } =
        data;
      const hasEmptyFields = Object.values(data).some(
        (element) => element === ""
      );
      if (hasEmptyFields) {
        res.status(422).json({
          message: "Please fill in all fields",
        });
        return;
      }
      return res.status(200).json({
        message: "POST method is not implemented yet",
        data: {
          name,
          performers,
          address,
          venue,
          date,
          time,
          description,
        },
      });
    },

    default: async () => {
      res.setHeader("Allow", ["GET"]);
      res.status(405).end(`Method ${req.method} Not Allowed`);
    },
  };

  const method = req.method as keyof typeof MethodsMapper;
  const methodHandler = MethodsMapper[method] || MethodsMapper.default;
  methodHandler();
}
