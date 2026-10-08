# Make Every Step Count - Leaderboard Dashboard

Interactive dashboard for the Global Wellness Challenge leaderboard using the October 8, 2026 snapshot in `dataset_1008`.

## Contents
- `index.html` - Desktop dashboard with charts, team selection, search, and sorting; fetches the active CSV at runtime
- `dataset_1008/personify_leaderboard.csv` - Active raw data source for all 6,463 teams
- `dataset_1008/personify_leaderboard_all_teams.xlsx` - Formatted workbook for the same snapshot
- `dataset_1005/personify_leaderboard.csv` - Archived October 5 snapshot
- `dataset_1005/personify_leaderboard_all_teams.xlsx` - Formatted workbook for the October 5 snapshot
- `Dockerfile` - Minimal BusyBox static web server image
- `.dockerignore` - Small build context for the container image

## Data Summary
- **6,463 teams** from Seagate worldwide
- **6,200 active teams** (95.9%) and 263 teams with zero recorded steps
- **3,708,970,546 total steps** recorded across active teams
- **598,221 average steps** and **477,471 median steps** among active teams
- **1,165 teams** reached one million steps; **121 teams** reached two million
- #1 team: **Wolffy（灰太狼）** with **3,577,049 steps**
- Largest distribution band: **100K-250K steps** with **1,362 teams**

## Dashboard Features
- Generic every-team dashboard with no team-specific callouts or special highlighting
- Desktop-optimized layout with six KPI cards, a full-width distribution curve chart, side-by-side summary charts, and searchable full leaderboard
- Global team picker with all 6,463 teams; users can select a team from the picker or click a leaderboard row
- Selected team summary showing name, rank, total steps, and percentile
- Selected team markers synchronized across all charts, including tied-rank teams
- Searchable and sortable leaderboard with incremental "Load more" rendering
- Loads the active leaderboard from `dataset_1008/personify_leaderboard.csv`; dashboard summaries, charts, and team selector all use the loaded rows

## Charts And Analysis
- **Step distribution curves**: empirical attainment curve, cumulative distribution curve, and quantile curve in one chart
- **Tie-safe selected-team curve markers**: exact empirical at-or-above and at-or-below percentages for selected team scores
- **Rank bracket comparison**: selected team score plotted against its rank bracket average
- **Total steps histogram**: nine score bands from zero steps through 2M+ steps
- **Benchmarks table**: leader score, top-10 average, top-100 average, active average, active median, and milestone marks
- **Top 10 table**: leading teams with relative progress bars against the leader score

## View Locally
Open `index.html` in a browser that permits local CSV fetching, or use the Docker deployment below for reliable CSV loading.

## Docker Deployment
Build and run the static dashboard container on port 9091:
The image includes the `dataset_1008` CSV at both its dataset path and `/personify_leaderboard.csv`.

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
- Verified the active CSV source is `dataset_1008/personify_leaderboard.csv`
- Verified browser rendering at desktop size with no horizontal overflow
- Verified all three distribution curves and selected-team markers in the browser
- Verified picker options cover all 6,463 teams
- Verified Docker deployment responds on http://localhost:9091 and container health is `healthy`
