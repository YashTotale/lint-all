#!/bin/bash

GREEN='\e[92m'
NC='\033[0m'

set -e

lint-all() {
  eslinter
  printf "\n"
  markdownlinter
  printf "\n"
  prettierlinter
}

eslinter() {
  printf "Linting with ESLint...\n\n"

  npx eslint .

  printf "${GREEN}ESLint Done${NC}\n"
}

markdownlinter() {
  printf 'Linting with MarkdownLint...\n\n'

  npx markdownlint .

  printf "${GREEN}MarkdownLint Done${NC}\n"
}

prettierlinter() {
  printf 'Linting with Prettier...\n'

  npx prettier --check .

  printf "\n${GREEN}Prettier Done${NC}\n"
}

lint-all
