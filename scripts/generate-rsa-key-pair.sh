#!/usr/bin/env bash
echo "Generating a new RSA (4096 bit) key pair"
openssl genrsa -des3 -out ../local/rsa-private.pem 4096
openssl rsa -in ../local/rsa-private.pem -outform PEM -pubout -out ../local/rsa-public.pem
openssl rsa -in ../local/rsa-private.pem -out ../local/rsa-private-unencrypted.pem -outform PEM