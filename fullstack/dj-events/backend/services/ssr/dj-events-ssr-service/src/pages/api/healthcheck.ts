// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from "next";

// type Data = {
//   name: string;
// };

// export default function handler(
//   req: NextApiRequest,
//   res: NextApiResponse<Data>,
// ) {
//   res.status(200).json({ name: "John Doe" });
// }


// healthcheck endpoint
// should return 200 OK and a JSON object with details about the status of the service
// status, vesrsion, timestamp, message
export default function handler(
  req: NextApiRequest,
  res: NextApiResponse,
) {
  const status = {
    status: "OK",
    version: process.env.npm_package_version,
    timestamp: new Date().toISOString(),
    message: "Service is running.",
  };

  res.status(200).json(status);
}
