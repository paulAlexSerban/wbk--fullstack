import type { NextApiRequest, NextApiResponse } from "next";
import { parseCookies } from '@/helpers';
import { PRIVATE_CMS_API_URL } from "@/config";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    GET: async () => {
      const { documentId } = req.query;

      const response = await fetch(
        `${PRIVATE_CMS_API_URL}/events/${documentId}?populate=image`
      );
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
      if (!req.headers.cookie) {
        res.status(403).json({
          message: "Not authorized",
        });
        return;
      }

      const { token } = parseCookies(req);
      if (!token) {
        res.status(403).json({
          message: "Not authorized",
        });
        return;
      }
      // slug comes as url param not query param
      const { documentId } = req.query;

      const response = await fetch(
        `${PRIVATE_CMS_API_URL}/events/${documentId}`,
        {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
        }
      );
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

      res.status(response.status).json({
        message: `Event deleted successfully`,
      });
    },

    default: async () => {
      res.setHeader("Allow", ["GET", "DELETE"]);
      res.status(405).end(`Method ${req.method} Not Allowed`);
    },
  };

  const method = req.method as keyof typeof MethodsMapper;
  const methodHandler = MethodsMapper[method] || MethodsMapper.default;
  methodHandler();
}
