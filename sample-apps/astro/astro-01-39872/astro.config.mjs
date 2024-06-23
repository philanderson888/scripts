import { defineConfig } from 'astro/config';

import alpinejs from "@astrojs/alpinejs";

// https://astro.build/config
export default defineConfig({
  integrations: [alpinejs()],
  base: '/astro-vanilla-framework',
  build: {
    assets: 'astro'
  }
});