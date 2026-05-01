const DOMAIN_NAME = import.meta.env.VITE_DOMAIN_NAME || "localhost";
const PORT = import.meta.env.VITE_PORT || "3000";
const PROTOCOL = import.meta.env.VITE_PROTOCOL || "http";

// Generic config
export const BASE_URL = `${PROTOCOL}://${DOMAIN_NAME}:${PORT}`;
export const API_URL = `${BASE_URL}/api`;

// Project specific config
export const BIRTHDAYS_API_ENDPOINT = `${API_URL}/birthdays`;
