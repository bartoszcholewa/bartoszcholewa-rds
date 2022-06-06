#!/bin/bash
mkdir -p CA
openssl req -new -text -passout pass:abcd -subj /CN=localhost -out CA/server.req -keyout CA/privkey.pem
openssl rsa -in CA/privkey.pem -passin pass:abcd -out CA/server.key
openssl req -x509 -in CA/server.req -text -key CA/server.key -out CA/server.crt