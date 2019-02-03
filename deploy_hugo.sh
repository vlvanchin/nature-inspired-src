#!/usr/bin/zsh -e
#
# to deploy public contents to vlvanchin.github.io/nature-bites
#
echo -e "\nDeploying website contents to vlvanchin.github.io/nature-bites"

echo -e "\tdeleting public folder in nature-bites-src"
if [ -d "public" ]; then 
  rm -fr public
fi

#echo -e "\tdeleting old contents in vlvanchin.github.io/nature-bites"
cd ../nature-bites
if [ $(ls -al | wc -l) -gt 4 ] ; then
  rm -fr * 
fi

cd ../nature-bites-src

echo -e "\tbuilding site with hugo"
hugo -d ../nature-bites

echo -e "\tcommiting to nature-bites repo"
cd ../nature-bites
git add .
git commit -s -m "website updated"
git push origin master

echo "script done"

