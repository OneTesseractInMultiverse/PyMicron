#!/usr/bin/env bash
echo "======================================================"
echo "Generating a new Elliptic-Curve Key Pairs"
echo "======================================================"
echo " "
echo "Generating EC-256 Key Pair ==========================="
openssl ecparam -genkey -name prime256v1 -out ../local/ec256-private.pem
openssl ec -in ../local/ec256-private.pem -pubout -out ../local/ec256-public.pem
echo " "
echo "Generating EC-384 Key Pair ==========================="
openssl ecparam -genkey -name secp384r1 -noout -out ../local/ec384-private.pem
openssl ec -in ../local/ec384-private.pem -pubout -out ../local/ec384-public.pem
echo " "
echo "Generating EC-512 Key Pair ==========================="
openssl ecparam -genkey -name secp521r1 -noout -out ../local/ec512-private.pem
openssl ec -in ../local/ec512-private.pem -pubout -out ../local/ec512-public.pem
