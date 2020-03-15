#!/bin/bash

tar czf site-a.tar.gz -C abtest/site-a .
scp site-a.tar.gz jonathan@femfs.jonathancunanan.com:/var/www
rm site-a.tar.gz

ssh jonathan@fem_fullstack << 'ENDSSH'
cd /var/www
rm -rf site-a
mkdir site-a
tar xf site-a.tar.gz -C site-a
rm site-a.tar.gz
ENDSSH
