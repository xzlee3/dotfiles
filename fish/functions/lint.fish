#!/usr/bin/env fish

prettier --write .
for file in ./**/*.{fish,sh}
  if test -f "$file"
    echo "Linting $file..."
    shellcheck -x "$file"
  end
end
shfmt -w .
markdownlint-cli2 --fix "*/**/*.md"
dotenv-linter fix .
gitleaks git
editorconfig-checker
