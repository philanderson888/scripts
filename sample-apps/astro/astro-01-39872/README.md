# Example template for the Ubuntu Vanilla CSS Component framework

I have been working with Tailwind CSS recently and wow is it efficient to work with. But sometimes you need an "enterprise" friendly or more "industrial" look. 

Then I found Ubuntu's [Vanilla](https://vanillaframework.io/) CSS framework. 

Here is an [Astro](https://astro.build/) template to show off some capablities.

* SASS/SCSS framework
* Minimal
* Well used and tested (Ubuntu products)
* Alpine.js friendly
* Permissive license

Ubuntu* - not affiliated (just a fan)

```
npm create astro@latest -- --template getmarkus/astro-vanilla-framework
```

* [Ubuntu Vanilla 4.0 announcement](https://ubuntu.com/blog/vanilla-4-0-release)
* [Ubuntu Vanilla Github release notes](https://github.com/canonical/vanilla-framework/releases/)

### Attribution
* [logo](https://logoipsum.com/)

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |

| `npm run dev`             | Starts local dev server at `localhost:4321`      |

```
yarn install
yarn start --port 39872
```

| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

test using

```
curl localhost:39872/astro-vanilla-framework
```
