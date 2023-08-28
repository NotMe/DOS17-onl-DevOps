#!/bin/bash

openssl rsautl -decrypt -inkey private.pem -in encrypt.dat -out new_encrypt.txt

cat new_encrypt.txt
