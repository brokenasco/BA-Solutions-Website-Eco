# BA Solutions Command Center

The first production slice of the BA Solutions Web Modernization AI Ecosystem: an executive dashboard with a shared mockup review workflow and an optional lightweight interactive headquarters view.

## Included

- Responsive executive overview, discovery queue, agent activity, approvals, and meeting entry point.
- Optional HQ view with department zones, COO penthouse, security office, activity legend, and meeting launch.
- Shared `MOCK Website provided by BA Solutions` watermark component.
- Supabase migration for companies, agents, mockups, and human approval records with RLS enabled.
- Vercel configuration and GitHub Actions build validation.
- Original BA Solutions concept artwork at `public/assets/headquarters-hero.png`.

## Run locally

```bash
npm install
npm run dev
```

Copy `.env.example` to `.env.local` and add a Supabase project URL plus publishable key when connecting the UI to a real project. The current UI remains usable without credentials with safe local sample data.

## Operating boundary

The app intentionally does not contact prospects, publish a prospect website, or perform externally binding actions. The approval center is the human gate for those future integrations.
