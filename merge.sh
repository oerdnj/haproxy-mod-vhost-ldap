#!/bin/sh
cat $1.crt $1.key > $1.pem
rm $1.crt $1.key
