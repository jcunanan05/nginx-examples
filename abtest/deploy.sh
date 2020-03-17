#!/bin/bash

tar czf abtest.tar.gz -C abtest .
scp abtest.tar.gz jonathan@femfs.jonathancunanan.com:/var/www
rm abtest.tar.gz

ssh jonathan@fem_fullstack << 'ENDSSH'
cd /var/www
rm -rf abtest
mkdir abtest
tar xf abtest.tar.gz -C abtest
rm abtest.tar.gz
cd abtest 
npm install
ENDSSH
