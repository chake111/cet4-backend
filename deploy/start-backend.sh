#!/usr/bin/env bash
# ============================================================
# CET-4 Platform — Backend Startup Script
# Usage: ./start-backend.sh [prod|dev]
# ============================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JAR_DIR="$(dirname "$SCRIPT_DIR")/target"
PROFILE="${1:-prod}"
JAR_NAME="cet4-backend-0.0.1-SNAPSHOT.jar"

# ---------- environment checks ----------
if [ ! -f "${JAR_DIR}/${JAR_NAME}" ]; then
  echo "ERROR: ${JAR_DIR}/${JAR_NAME} not found. Run 'mvn clean package' first."
  exit 1
fi

if [ -z "${DB_PASSWORD:-}" ]; then
  echo "ERROR: DB_PASSWORD environment variable is required."
  exit 1
fi

if [ -z "${JWT_SECRET:-}" ]; then
  echo "ERROR: JWT_SECRET environment variable is required."
  exit 1
fi

# ---------- build java opts ----------
JAVA_OPTS="${JAVA_OPTS:--Xms256m -Xmx512m}"

# ---------- start ----------
echo "Starting cet4-backend [profile=${PROFILE}] ..."
exec java ${JAVA_OPTS} \
  -Dspring.profiles.active="${PROFILE}" \
  -DJWT_SECRET="${JWT_SECRET}" \
  -DDB_PASSWORD="${DB_PASSWORD}" \
  -DDEEPSEEK_API_KEY="${DEEPSEEK_API_KEY:-sk-placeholder}" \
  -jar "${JAR_DIR}/${JAR_NAME}"
