import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  allowedDevOrigins: ["http://localhost:3000", "http://192.168.1.137", "ws://localhost:3000", "ws://192.168.1.137"],
};

export default nextConfig;
