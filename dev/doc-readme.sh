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

\`\`\`
$(make help)
\`\`\`
EOF

  sd '(make\[1\]:.+\n)' '' README.md
}

trap readme EXIT
