#!/usr/bin/zsh -e
#
# to deploy public contents to AWS
#
echo -e "\nDeploying website contents to AWS"

echo -e "\tdeleting public folder in nature-inspired-src"
if [ -d "public" ]; then 
  rm -fr public
fi

echo -e "\tbuilding site with hugo"
hugo 

echo -e "\tcommiting to nature-inspired-src repo"
git add .
git commit -s -m "website updated"
git push origin master

echo -e "\tuploading to AWS s3 bucket 'nature-inspired'"
echo -e "\t\tuse --dryrun option to test"
aws s3 cp --recursive public s3://nature-inspired/ 

echo "script done"

