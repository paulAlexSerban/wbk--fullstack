const SERVICE_NAME = process.env.SERVICE_NAME || "nextjs-ssr-service";

export const PUBLIC_APP_URL = process.env.NEXT_PUBLIC_APP_URL || `http://localhost:3000`;
export const PUBLIC_API_URL = process.env.NEXT_PUBLIC_API_URL || `http://localhost:3000/api`;
export const PRIVATE_API_URL = process.env.PRIVATE_API_URL || `http://${SERVICE_NAME}:5000/api`;
export const PUBLIC_CMS_API_URL = process.env.NEXT_PUBLIC_CMS_URL || `http://localhost:3000/cms/api`;
export const PRIVATE_CMS_API_URL = process.env.PRIVATE_CMS_API_URL || `http://strapi-cms:1337/api`;
