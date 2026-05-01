import type { NextApiRequest, NextApiResponse } from "next";
import cookie from "cookie";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    POST: async () => {
      res.setHeader(
        "Set-Cookie",
        cookie.serialize("token", "", {
          httpOnly: true,
          secure: process.env.NODE_ENV === "production",
          maxAge: -1, // Expire the cookie immediately
          sameSite: "strict",
          path: "/",
        })
      );
      res.status(200).json({
        message: "Logout successful",
      });
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
