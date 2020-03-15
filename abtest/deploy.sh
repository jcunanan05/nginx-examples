#!/bin/bash

tar czf site-ab.tar.gz -C abtest/site-ab .
scp site-ab.tar.gz jonathan@femfs.jonathancunanan.com:/var/www
rm site-ab.tar.gz

ssh jonathan@fem_fullstack << 'ENDSSH'
cd /var/www
rm -rf site-ab
mkdir site-ab
tar xf site-ab.tar.gz -C site-ab
rm site-ab.tar.gz
ENDSSH
