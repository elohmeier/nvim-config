#!/usr/bin/env bash

set -e
set -x

nix-update --flake --commit --version=branch attempt-nvim
nix-update --flake --commit --version=branch ssr-nvim
nix-update --flake --commit --version=branch telescope-luasnip-nvim
nix-update --flake --commit resession-nvim
