#!/bin/bash
#Set error catch
set -xe

#Delete old crap, export the DigitalOcean API key and begin renewal for Airpoint.net
rm -rf $HOME/.acme.sh/wildcard* && \
cd $HOME && export DO_API_KEY="PUT_DO_API_HERE" && \
$HOME/.acme.sh/acme.sh --issue --dns dns_dgon -d *.craigthacker.org && \

#Change Airpoint.net from the * to literal spelling for Windows support
cd $HOME/.acme.sh/ && \
mv '*.craigthacker.org' wildcard.craigthacker.org			&& \
cd wildcard.craigthacker.org						&& \
mv '*.craigthacker.org.cer' wildcard.craigthacker.org.cer 		&& \
mv '*.craigthacker.org.conf' wildcard.craigthacker.org.conf 		&& \
mv '*.craigthacker.org.csr' wildcard.craigthacker.org.csr 		&& \
mv '*.craigthacker.org.csr.conf' wildcard.craigthacker.org.csr.conf 	&& \
mv '*.craigthacker.org.key' wildcard.craigthacker.org.key 		&& \

#Move files to home
cp -r $HOME/.acme.sh/wildcard.craigthacker.org $HOME && \

#Move to home and zip certs
cd $HOME && chmod 777 -R wildcard.craigthacker.* && \
             zip -r wildcard.craigthacker.org.zip wildcard.craigthacker.org && \

echo "Done!"
