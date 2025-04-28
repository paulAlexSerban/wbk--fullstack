import type { NextApiRequest, NextApiResponse } from "next";
import { PRIVATE_CMS_API_URL } from "@/config";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    GET: async () => {
      const { documentId } = req.query;

      const response = await fetch(`${PRIVATE_CMS_API_URL}/events/${documentId}?populate=image`);
      if (!response.ok) {
        if (response.status === 403 || response.status === 401) {
          res.status(403).json({
            message: "No token included",
          });
          return;
        }
        res.status(500).json({
          message: "Something went wrong",
        });
        return;
      }

      const event = await response.json();

      res.status(response.status).json({
        message: `Event fetched successfully`,
        data: {
          ...event.data,
        },
      });
    },
    DELETE: async () => {
      // slug comes as url param not query param
      const { documentId } = req.query;

      const response = await fetch(`${PRIVATE_CMS_API_URL}/events/${documentId}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
      });
      if (!response.ok) {
        if (response.status === 403 || response.status === 401) {
          res.status(403).json({
            message: "No token included",
          });
          return;
        }
        res.status(500).json({
          message: "Something went wrong",
        });
        return;
      }

      console.log("response", response);

      res.status(response.status).json({
        message: `Event deleted successfully`,
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
