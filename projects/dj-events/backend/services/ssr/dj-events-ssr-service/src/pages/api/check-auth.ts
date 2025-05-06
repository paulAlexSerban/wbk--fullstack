import type { NextApiRequest, NextApiResponse } from "next";
import cookie from "cookie";
import { PRIVATE_CMS_API_URL } from "@/config";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    GET: async () => {
      if (!req.headers.cookie) {
        res.status(403).json({
          message: "Not authorized",
        });
        return;
      }
      const { token } = cookie.parse(req.headers.cookie);
      if (!token) {
        res.status(403).json({
          message: "Not authorized",
        });
        return;
      }

      try {
        const response = await fetch(`${PRIVATE_CMS_API_URL}/users/me`, {
          method: "GET",
          headers: {
            Authorization: `Bearer ${token}`
          },
        });


        if (response.status === 401) {
          res.status(401).json({
            message: "Unauthorized",
          });
          return;
        }

        const data = await response.json();

        console.log("data", data);

        if (data.id && data.username && data.email) {
          res.status(200).json(data);
        } else {
          res.status(422).json({
            message: "Login failed",
          });
        }
      } catch (error) {
        res.status(500).json({
          message: "Internal server error",
        });
      }
    },
    default: async () => {
      res.setHeader("Allow", ["GET"]);
      res.status(405).end(`Method ${req.method} Not Allowed`);
    },
  };

  const method = req.method as keyof typeof MethodsMapper;
  const methodHandler = MethodsMapper[method] || MethodsMapper.default;
  return methodHandler();
}
