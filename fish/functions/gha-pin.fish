#!/usr/bin/env fish

for file in .github/workflows/*.yml
  if test -f "$file"
    echo "Pinning $file..."
    ratchet pin "$file"
  end
end
