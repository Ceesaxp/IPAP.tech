# IPAP Consulting — ipap.tech

Static site for IPAP Consulting, built with [Hugo](https://gohugo.io/).

## Stack

- **Hugo (extended)** — pinned at `0.135.0` in CI
- **Custom layouts** at `layouts/` — no external theme dependency
- **Single stylesheet** at `assets/css/ipap.css` (processed and fingerprinted by Hugo Pipes)
- **System fonts: Inter + Space Grotesk** (loaded from Google Fonts)
- **Deployment** — GitHub Actions → GitHub Pages with custom domain `ipap.tech`

## Local development

```sh
hugo server -D
```

Open <http://localhost:1313/>.

## Build for production

```sh
hugo --gc --minify
```

Output lands in `public/`.

## Content structure

```
content/
├── _index.md                          # home (rendered by layouts/index.html)
├── insights/                          # blog / field notes
│   ├── _index.md
│   └── 20240612_startup-fear-of-success.md
└── page/
    ├── what.md                        # Services
    ├── how.md                         # Approach
    ├── why.md                         # Why us
    ├── results.md                     # Outcomes / case studies
    ├── about.md
    ├── contact.md                     # uses layouts/page/contact.html
    ├── contact-thank-you.md
    └── tg-zoom-bot/                   # legal pages for a separate product
```

## Deployment

A push to `main` triggers `.github/workflows/deploy.yml`, which builds with Hugo and publishes to GitHub Pages. Pull requests get a build smoke-test via `.github/workflows/build-check.yml`.

See `DEPLOYMENT.md` for the one-time setup steps (custom domain, Pages source, DNS).
