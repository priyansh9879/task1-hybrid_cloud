#!/usr/bin/bash

# Variable to fetch cloufront url:
CF=$(aws cloudfront list-distributions --query DistributionList.Items[].DomainName | grep cloudfront.net | sed 's/"//g' | sed 's/[[:space:]]\{2,\}\|//g')

SED1=$(echo 'src="images')

SED2=$(echo 'src="')

# -------------------------------------------------------------------------------------------------

echo -------------------------------------------------------------
echo "Changing the Images paths with Cloudfront URL in index.html"
echo -------------------------------------------------------------
if sudo cat index.html | grep "cloudfront.net"
then
	echo -------------------------------------------------
	echo "Path is already up-to-date"
	echo -------------------------------------------------
else
	sudo sed -i "s/$SED1/$SED2$CF/g" index.html
	echo -------------------------------------------------
	echo "Path Changed"
	echo -------------------------------------------------
fi


echo ----------------------------------------------------------------
echo "Changing the Images paths with Cloudfront URL in services.html"
echo ----------------------------------------------------------------
if sudo cat services.html | grep "cloudfront.net"
then
        echo -------------------------------------------------
        echo "Path is already up-to-date"
        echo -------------------------------------------------
else
        sudo sed -i "s/$SED1/$SED2$CF/g" services.html
        echo -------------------------------------------------
        echo "Path Changed"
        echo -------------------------------------------------
fi


echo -------------------------------------------------------------
echo "Changing the Images paths with Cloudfront URL in about.html"
echo -------------------------------------------------------------
if sudo cat about.html | grep "cloudfront.net"
then
        echo -------------------------------------------------
        echo "Path is already up-to-date"
        echo -------------------------------------------------
else
        sudo sed -i "s/$SED1/$SED2$CF/g" about.html
        echo -------------------------------------------------
        echo "Path Changed"
        echo -------------------------------------------------
fi


echo ---------------------------------------------------------------
echo "Changing the Images paths with Cloudfront URL in contact.html"
echo ---------------------------------------------------------------
if cat contact.html | grep "cloudfront.net"
then
        echo -------------------------------------------------
        echo "Path is already up-to-date"
        echo -------------------------------------------------
else
        sudo sed -i "s/$SED1/$SED2$CF/g" contact.html
        echo -------------------------------------------------
        echo "Path Changed"
        echo -------------------------------------------------
fi
