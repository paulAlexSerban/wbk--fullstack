/// <reference types="vite/client" />

interface ImportMetaEnv {
    readonly VITE_DOMAIN_NAME: string;
    readonly VITE_PORT: string;
    readonly VITE_PROTOCOL: string;
}

interface ImportMeta {
    readonly env: ImportMetaEnv;
}