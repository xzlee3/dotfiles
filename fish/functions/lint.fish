#!/usr/bin/env fish

prettier --write .
for file in ./**/*.{fish,sh}
  if test -f "$file"
    echo "Linting $file..."
    shellcheck -x "$file"
  end
end
shfmt -w .
for file in .github/workflows/*.yml
  if test -f "$file"
    echo "Linting $file..."
    ratchet lint "$file"
    zizmor "$file"
  end
end
actionlint
markdownlint-cli2 --fix "*/**/*.md"
dotenv-linter fix .
gitleaks git
editorconfig-checker
