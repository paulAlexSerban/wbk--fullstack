import type { NextApiRequest, NextApiResponse } from "next";
import { events } from "./data.json";
import { EventsResponseData } from "@/types";

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<EventsResponseData>
) {
  const { slug } = req.query;
  const evt = events.filter((ev) => ev.slug === slug);
  if (req.method === "GET") {
    res.status(200).json(evt);
  } else {
    res.setHeader("Allow", ["GET"]);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}
