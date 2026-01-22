#!/usr/bin/env fish

# Disable greeting
set fish_greeting

# Initialize Nix environment for login shell
if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
end

# Aliases
alias vi nvim
alias vim nvim

# Abbreviations
if status is-interactive
end
