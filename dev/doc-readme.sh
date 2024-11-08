#!/bin/bash

declare TRACE
[[ "${TRACE}" == 1 ]] && set -o xtrace
set -o errexit
set -o nounset
set -o pipefail
set -o noclobber
shopt -s inherit_errexit

index() {
  paste -d "" \
    <(
      cat dev/doc-readme.sh |
        grep -E '^#{1,} [A-Z]' |
        sed 's/^ {1,}//g' |
        sed -E 's/(^#{1,}) (.+)/\1\[\2]/g' |
        sed 's/#/  /g' |
        sed -E 's/\[/- [/g'
    ) \
    <(
      cat dev/doc-readme.sh |
        grep -E '^#{1,} [A-Z]' |
        sed 's/#//g' |
        sed -E 's/^ {1,}//g' |
        # https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html
        sed -E "s1[][!#$%&'()*+,./:;<=>?@\\^_\`{|}~]11g" |
        sed -E 's/"//g' |
        sed 's/[A-Z]/\L&/g' |
        sed 's/ /-/g' |
        sed -E 's@(.+)@(#\1)@g'
    )
}

backlink() {
  sed -i -E '/^#{1,} [A-Z]/a\\n\[back^\](#index)' README.md
}

readme() {
  cat <<EOF >|README.md
# makefile-templates

A collection of my commonly used makefile recipes.

# index

$(index)

# Dependencies

- [biome](https://biomejs.dev/)
- [ruff](https://docs.astral.sh/ruff/)
- [taplo](https://github.com/tamasfe/taplo)
- [yamlfmt](https://github.com/google/yamlfmt)
- [yamllint](https://github.com/adrienverge/yamllint)

# Make Recipes

\`\`\`
$(make help)
\`\`\`
EOF

  sed -i -E '/^make\[[0-9]/d' README.md
  backlink
}

trap readme EXIT
