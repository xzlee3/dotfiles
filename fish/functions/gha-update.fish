#!/usr/bin/env fish

for file in .github/workflows/*.yml
  if test -f "$file"
    echo "Updating $file..."
    ratchet update "$file"
    ratchet upgrade "$file"
  end
end
