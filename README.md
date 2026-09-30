# Make Every Step Count - Leaderboard Dashboard

Interactive dashboard for the Global Wellness Challenge leaderboard data extracted Sep 30, 2026.

## Contents
- `index.html` - Self-contained desktop dashboard with charts, team selection, search, and sorting
- `personify_leaderboard.csv` - Raw data for all 6,463 teams
- `Dockerfile` - Minimal BusyBox static web server image
- `.dockerignore` - Small build context for the container image

## Data Summary
- **6,463 teams** from Seagate worldwide
- **6,200 active teams** (95.9%) and 263 teams with zero recorded steps
- **3,637,028,035 total steps** recorded across active teams
- **586,617 average steps** and **466,048 median steps** among active teams
- **1,111 teams** reached one million steps; **116 teams** reached two million
- #1 team: **轻盈体态** with **3,557,024 steps**
- Largest distribution band: **100K-250K steps** with **1,376 teams**

## Dashboard Features
- Generic every-team dashboard with no team-specific callouts or special highlighting
- Desktop-optimized layout with six KPI cards, a full-width distribution curve chart, side-by-side summary charts, and searchable full leaderboard
- Global team picker with all 6,463 teams; users can select a team from the picker or click a leaderboard row
- Selected team summary showing name, rank, total steps, and percentile
- Selected team markers synchronized across all charts, including tied-rank teams
- Searchable and sortable leaderboard with incremental "Load more" rendering
- Safe rendering of team names from the embedded dataset

## Charts And Analysis
- **Step distribution curves**: empirical attainment curve, cumulative distribution curve, and quantile curve in one chart
- **Tie-safe selected-team curve markers**: exact empirical at-or-above and at-or-below percentages for selected team scores
- **Rank bracket comparison**: selected team score plotted against its rank bracket average
- **Total steps histogram**: nine score bands from zero steps through 2M+ steps
- **Benchmarks table**: leader score, top-10 average, top-100 average, active average, active median, and milestone marks
- **Top 10 table**: leading teams with relative progress bars against the leader score

## View Locally
Open `index.html` in any browser for the interactive dashboard.

## Docker Deployment
Build and run the static dashboard container on port 9091:

```powershell
docker build -t make-every-step-count-leaderboard:latest .
docker run -d --name make-every-step-count-leaderboard -p 9091:80 --restart unless-stopped make-every-step-count-leaderboard:latest
```

Open http://localhost:9091 after the container starts.

To replace an existing container:

```powershell
docker rm --force make-every-step-count-leaderboard
docker run -d --name make-every-step-count-leaderboard -p 9091:80 --restart unless-stopped make-every-step-count-leaderboard:latest
```

## Validation Performed
- Verified CSV-derived totals, active-team count, average, median, and distribution bins
- Verified browser rendering at desktop size with no horizontal overflow
- Verified all three distribution curves and selected-team markers in the browser
- Verified picker options cover all 6,463 teams
- Verified Docker deployment responds on http://localhost:9091 and container health is `healthy`
