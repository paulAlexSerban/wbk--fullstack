import type { NextApiRequest, NextApiResponse } from "next";
import { parseCookies } from '@/helpers';
import { PRIVATE_CMS_API_URL } from "@/config";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    GET: async () => {
      res.status(200).json({
        message: "GET method is not implemented yet",
      });
    },
    POST: async () => {
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

      const { data } = req.body;
      const hasEmptyFields = Object.values(data).some(
        (element) => element === ""
      );
      if (hasEmptyFields) {
        res.status(422).json({
          message: "Please fill in all fields",
        });
        return;
      }

      const strapiFormattedData = {
        name: data.name,
        performers: data.performers,
        address: data.address,
        venue: data.venue,
        date: data.date,
        time: data.time,
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

      const response = await fetch(`${PRIVATE_CMS_API_URL}/events`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ data: strapiFormattedData }),
      });

      if (!response.ok) {
        if (response.status === 403 || response.status === 401) {
          res.status(403).json({
            message: "No token included",
          });
          return;
        }
        console.error("Error creating event:", { response });
        res.status(500).json({
          message: "Something went wrong",
        });
        return;
      }
      const responseEvent = await response.json();

      const {
        slug,
        name,
        performers,
        address,
        venue,
        date,
        time,
        description,
      } = responseEvent.data;

      res.setHeader("Location", `/events/${slug}`);
      res.status(201).json({
        message: "Event created successfully",
        data: {
          slug,
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
      res.setHeader("Allow", ["GET", "POST"]);
      res.status(405).end(`Method ${req.method} Not Allowed`);
    },
  };

  const method = req.method as keyof typeof MethodsMapper;
  const methodHandler = MethodsMapper[method] || MethodsMapper.default;
  methodHandler();
}
