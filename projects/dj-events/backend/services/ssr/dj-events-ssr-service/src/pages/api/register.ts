import type { NextApiRequest, NextApiResponse } from "next";
import cookie from "cookie";
import { PRIVATE_CMS_API_URL } from "@/config";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    POST: async () => {
      const { body } = req;

      const { email, password, username } = body;
      const hasEmptyFields = !email || !password;

      if (hasEmptyFields) {
        res.status(422).json({
          message: "Please fill in all fields",
        });
        return;
      }

      const requestData = {
        username,
        email,
        password,
      };

      try {
        const response = await fetch(`${PRIVATE_CMS_API_URL}/auth/local/register`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestData),
        });

        if (!(response.status === 200)) {
          res.status(422).json({
            message: "Login failed",
          });
          return;
        }

        const data = await response.json();

        if (data.jwt && data.user) {
          const { jwt, user } = data;
          res.setHeader(
            "Set-Cookie",
            cookie.serialize("token", jwt, {
              httpOnly: true,
              secure: process.env.NODE_ENV === "production",
              maxAge: 60 * 60 * 24 * 7, // 1 week
              sameSite: "strict",
            })
          );
          res.status(200).json(data);
        } else {
          res.status(422).json({
            message: "Login failed",
          });
        }
      } catch (error) {
        res.status(422).json({
          message: "Login failed",
        });
      }
    },
    default: async () => {
      res.setHeader("Allow", ["POST"]);
      res.status(405).end(`Method ${req.method} Not Allowed`);
    },
  };

  const method = req.method as keyof typeof MethodsMapper;
  const methodHandler = MethodsMapper[method] || MethodsMapper.default;
  return methodHandler();
}
