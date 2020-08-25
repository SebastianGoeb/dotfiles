#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

function section() {
  printf '\n== %s\n' "$1"
}

section "ensuring homedir exists"
gpg --list-keys >/dev/null

section "saving SHA256 preference"
# FIXME not idempotent
cat >>~/.gnupg/gpg.conf <<EOF
personal-digest-preferences SHA256
cert-digest-algo SHA256
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
EOF

section "creating master key"
gpg --batch --full-generate-key "$DIR"/key-params.txt
