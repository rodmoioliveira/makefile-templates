#!/bin/bash

declare TRACE
[[ "${TRACE}" == 1 ]] && set -o xtrace
set -o errexit
set -o nounset
set -o pipefail
set -o noclobber

readme() {
  cat <<EOF >|README.md
# makefile-templates

## Dependencies

- [biome](https://biomejs.dev/)
- [ruff](https://docs.astral.sh/ruff/)

## Make Recipes

\`\`\`
$(make help)
\`\`\`
EOF

  sd '(make\[1\]:.+\n)' '' README.md
}

trap readme EXIT
