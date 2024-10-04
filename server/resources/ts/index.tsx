import { createRoot } from 'react-dom/client';
import App from './App';
import React from 'react';
// @ts-ignore
import { registerSW } from 'virtual:pwa-register';

createRoot(document.getElementById('app') as HTMLElement).render(<App />);

registerSW();
