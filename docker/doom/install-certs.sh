#!/usr/bin/env bash
set -euo pipefail

CERT_SRC="nscacert.pem"
CERT_DIR="/usr/local/share/ca-certificates"

if [[ -s "$CERT_SRC" ]]; then
    echo "==> Installing custom CA certificate $CERT_SRC"
    cp ./"$CERT_SRC" "$CERT_DIR/"
    openssl x509 -inform PEM -in "$CERT_DIR/$CERT_SRC" \
                 -out "$CERT_DIR/${CERT_SRC%.*}.crt"
    update-ca-certificates
else
    echo "==> No custom CA certificate found – nothing to do"
fi

