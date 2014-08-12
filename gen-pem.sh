#!/bin/sh

set -e

usage() {
    echo "$0 <name>"
    exit $1
}

[ -z "$1" ] && usage 1
DOMAIN="$1"

fail_if_error() {
    [ $1 != 0 ] && {
        unset PASSPHRASE
        exit 10
    }
}

openssl req -new -utf8 -subj "/C=CZ/commonName=$DOMAIN/" -key server.key -out $DOMAIN.csr
openssl x509 -req -days 3650 -in $DOMAIN.csr -signkey server.key -out $DOMAIN.crt
