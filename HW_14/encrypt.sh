#!/bin/bash

read -r "Enter a phrase: " phrase

echo "${phrase}" > encrypt.txt

openssl rsautl -encrypt -inkey public.pem -pubin -in encrypt.txt -out encrypt.dat
