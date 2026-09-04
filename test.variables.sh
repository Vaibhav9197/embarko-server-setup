#!/usr/bin/env bash
# variables.sh — app-specific environment variables, distinct from
# set-env.sh's infra-level variables (DOMAIN, CF_DNS_API_TOKEN, etc.).
#
# Deployment convention: same as set-env.sh — copy this per server,
# renamed with an env prefix (test.variables.sh, prod.variables.sh).
#
# WHAT GOES HERE: whatever variables deploy-service and api-service's
# own .env.example files actually define. This script has no built-in
# knowledge of what those are — check each repo directly:
#   cat ~/deploy-service/.env.example
#   cat ~/api-service/.env.example
# and add an `export KEY=value` line here for each one that needs a
# real value (secrets, real URLs, etc.) rather than whatever placeholder
# the example file itself has. A key with no corresponding export here
# keeps the .env.example's own default — only override what actually
# needs a real value for this environment.
#
# IMPORTANT: source this BEFORE server-setup.sh, same as set-env.sh:
#   source prod.set-env.sh
#   source prod.variables.sh
#   sudo -E bash prod.server-setup.sh
#
# Never commit a real copy of this file with actual secret values to git.

# ---------------------------------------------------------------------
# Example shape — DELETE these placeholders and replace with whatever
# keys your repos' own .env.example files actually define. These names
# are illustrative only, not something this script or its repos
# necessarily use.
# ---------------------------------------------------------------------
# export DATABASE_URL="postgres://user:pass@real-host:5432/proddb"
# export JWT_SECRET="a-real-secret-value"
# export SENTRY_DSN="https://real-dsn@sentry.io/project-id"


# ---------------------------------------------------------------------
# ENV Vars for API Service
# ---------------------------------------------------------------------
export DATABASE_URL="file:./prod.db"
export JWT_SECRET="e5a9856cd61240bd110c2aef568318db9b32b5d8fe4ae76bba283cb7d0361328"
export PORT=4100
export NODE_ENV=test
export FRONTEND_ORIGIN="https://hostnsoft.com"   # placeholder until the dashboard frontend exists — see below
export HOSTNSOFT_DEPLOY_URL="https://ship.hostnsoft.com"

export MSG91_AUTHKEY="dbc2b79e90d5ee493948fcf6556c2c9a"
export MSG91_GENERATE_AUTH_TOKEN_URL="https://routes.msg91.com/api/117230j17876397376a8d37b972ce7/generateAuthToken"

# EDGE_HOSTNAME, ORIGIN_SERVER_IP, INTERNAL_API_SECRET (custom domains —
# see api-service's docs/Customdomain-req.md) are NOT set here — all
# three are computed/generated automatically by server-setup.sh itself.
# Do not override them here unless you specifically need to force a
# different value.

# Optional — both have sensible defaults, uncomment only to override.
# export DOMAIN_REVERIFICATION_INTERVAL_MS=86400000
# export ORPHAN_TTL_MS=86400000
# export ORPHAN_CLEANUP_INTERVAL_MS=3600000



# ---------------------------------------------------------------------
# ENV Vars for Deploy Service
# ---------------------------------------------------------------------
export HOSTNSOFT_API_URL="http://127.0.0.1:4100"
export APPS_DOMAIN_SUFFIX="app.hostnsoft.com"

# INTERNAL_API_SECRET is NOT set here either — see the note above.

