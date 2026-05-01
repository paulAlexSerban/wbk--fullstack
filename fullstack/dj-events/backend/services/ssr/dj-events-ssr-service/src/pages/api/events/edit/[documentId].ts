import type { NextApiRequest, NextApiResponse } from "next";
import { parseCookies } from '@/helpers';
import { PRIVATE_CMS_API_URL } from "@/config";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    PUT: async () => {
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
      const { data } = req.body;

      const strapiFormattedData = {
        name: data.name,
        performers: data.performers,
        address: data.address,
        venue: data.venue,
        date: data.date,
        time: data.time,
        slug: data.slug,
        description: [
          {
            type: "paragraph",
            children: [
              {
                type: "text",
                text: data.description || "",
              },
            ],
          },
        ],
      };

      const response = await fetch(
        `${PRIVATE_CMS_API_URL}/events/${documentId}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
          body: JSON.stringify({ data: strapiFormattedData }),
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
      const responseEvent = await response.json();
      const slug = responseEvent.data.slug;
      res.status(response.status).json({
        message: `Event updated successfully`,
        data: {
          ...responseEvent.data,
        },
      });
    },

    default: async () => {
      res.setHeader("Allow", ["PUT"]);
      res.status(405).end(`Method ${req.method} Not Allowed`);
    },
  };

  const method = req.method as keyof typeof MethodsMapper;
  const methodHandler = MethodsMapper[method] || MethodsMapper.default;
  methodHandler();
}
