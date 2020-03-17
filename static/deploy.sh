#!/bin/bash

tar czf static-site.tar.gz -C static/static-site .
scp static-site.tar.gz jonathan@femfs.jonathancunanan.com:/var/www
rm static-site.tar.gz

ssh jonathan@fem_fullstack << 'ENDSSH'
cd /var/www
rm -rf static-site
mkdir static-site
tar xf static-site.tar.gz -C static-site
rm static-site.tar.gz
ENDSSH
