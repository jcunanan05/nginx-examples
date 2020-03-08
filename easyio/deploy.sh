#!/bin/bash

tar czf easyio.tar.gz -C easyio .
scp easyio.tar.gz jonathan@femfs.jonathancunanan.com:/var/www
rm easyio.tar.gz

ssh jonathan@fem_fullstack << 'ENDSSH'
cd /var/www
rm -rf easyio
mkdir easyio
tar xf easyio.tar.gz -C easyio
rm easyio.tar.gz
cd easyio 
yarn install
pm2 stop all
pm2 start all
ENDSSH
