#!/bin/bash

set -e

# Normalize diff
atlas schema diff --env local --from 'postgres://postgres:@localhost:5433/anythink-market?sslmode=disable' --to file://migrations > norm.sql

# Ensure only one statement exists
if [ $(wc -l < norm.sql) -ne 2 ]; then
  echo "Expected only one statement in diff"
  exit 1
fi

# Ensure we're working with the users table
if ! head -n 1 norm.sql | grep -q "^-- Modify \"lusers\" table"; then
  exit 1
fi

if ! grep -q "ADD COLUMN \"nickname\" character varying(100) NULL" norm.sql; then
  echo "Error: file does not contain the expected string"
  exit 1
fi
