// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from "next";
import type { ApiResponse } from "@/types";

interface HelloData {
  name: string;
  message: string;
  timestamp: string;
  version: string;
}

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<ApiResponse<HelloData>>
) {
  if (req.method !== 'GET') {
    return res.status(405).json({
      success: false,
      error: 'Method not allowed'
    });
  }

  const name = (req.query.name as string) || 'World';
  
  const data: HelloData = {
    name,
    message: `Hello ${name}! Welcome to Next.js + TypeScript + shadcn/ui`,
    timestamp: new Date().toISOString(),
    version: '1.0.0'
  };

  res.status(200).json({
    success: true,
    data,
    message: 'API request successful'
  });
}
