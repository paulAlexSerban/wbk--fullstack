import type { NextConfig } from "next";

const NEXT_PUBLIC_PROTOCOL = process.env.NEXT_PUBLIC_PROTOCOL || "http";
const NEXT_PUBLIC_HOSTNAME = process.env.NEXT_PUBLIC_HOSTNAME || "localhost";
const NEXT_PUBLIC_PORT = process.env.NEXT_PUBLIC_PORT || "3000";

const nextConfig: NextConfig = {
  reactStrictMode: false,
  images: {
    remotePatterns: [
      {
        protocol: NEXT_PUBLIC_PROTOCOL as "http" | "https",
        hostname: NEXT_PUBLIC_HOSTNAME,
        port: NEXT_PUBLIC_PORT,
        pathname: "/dss/images/**",
      },
    ],
  },
};
export default nextConfig;
