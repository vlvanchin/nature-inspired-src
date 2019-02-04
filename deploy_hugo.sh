#!/usr/bin/zsh -e
#
# to deploy public contents to vlvanchin.github.io/nature-inspired
#
echo -e "\nDeploying website contents to vlvanchin.github.io/nature-inspired"

echo -e "\tdeleting public folder in nature-inspired-src"
if [ -d "public" ]; then 
  rm -fr public
fi

#echo -e "\tdeleting old contents in vlvanchin.github.io/nature-inspired"
cd ../nature-inspired

git checkout master
if [ $(ls -al | wc -l) -gt 4 ] ; then
  rm -fr * 
fi

cd ../nature-inspired-src

git checkout master
echo -e "\tbuilding site with hugo"
hugo -d ../nature-inspired

echo -e "\tcommiting to nature-bites repo"
cd ../nature-inspired
git add .
git commit -s -m "website updated"
git push origin master

echo "script done"

