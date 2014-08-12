#!/bin/sh
sed -e "s/#DOMAIN#/$1/g" < vhost >> import.ldif
