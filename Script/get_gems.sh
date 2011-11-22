#!/bin/bash

#Function for installing gems
function installgems 
{
echo -n "I will install all the needed ruby gems for u! - *Press any key*"
read
for i in httparty rest-open-uri json CFPropertyList uuidtools eventmachine
do
echo
   sudo gem install $i
done

git clone git://github.com/plamoni/SiriProxy.git

echo "Now u are done! Ready for some Siri Proxy? *Yes or No?*"
echo "**REMEMBER** U have to make the DNS and certificat stuff too!!"
read YesNo
if [ $YesNo = "Yes" -o $YesNo = "y" -o $YesNo = "Y" -o $YesNo = "yes" ]
then
clear
echo "Starting Siri Proxy Server…"
echo "Siri Proxy Server started"
cd ~/SiriProxy
sudo ruby ./start.rb
else
exit
fi

}

#Set if gem is installed
GEMINFO=`which gem`

clear

if [ x$GEMINFO = "x/usr/bin/gem" ]
then
	installgems
else
	echo "Ohh.. Looks like u don't have gem installed.. I'll install it for u! *Press any Key*"
read
curl -O http://rubyforge.mirrors.roedu.net/files/rubygems/rubygems-1.3.4.tgz
tar xzvf rubygems-1.3.4.tgz
cd ~/rubygems-1.3.4
sudo ruby ./setup.rb
rm -rf ~/rubygems-1.3.4
rm -rf ~/rubygems-1.3.4.tgz
cd ~/
installgems
fi