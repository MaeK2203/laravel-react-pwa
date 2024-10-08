import fs from 'fs';
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import react from '@vitejs/plugin-react';

export default defineConfig({
    css: {
        preprocessorOptions: {
            scss: {
                api: "modern-compiler"
            }
        }
    },
    plugins: [
        laravel({
            refresh: true,

            input: [
                'resources/scss/app.scss',
                'resources/ts/index.tsx'
            ],
        }),
        react(),
    ],
    server: {
        port: 3000,
        proxy: {
            '/api': 'https://localhost/api'
        },
        https: {
            key: fs.readFileSync('../infra/nginx/ssl/cert-key.pem'),
            cert: fs.readFileSync('../infra/nginx/ssl/cert.pem'),
        },
    },
});
