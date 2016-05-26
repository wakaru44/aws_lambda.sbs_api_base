#!/bin/bash

################################################################################
#
# Script to create a release package with the code
#
# 
# Just include your code, and the site-packages folder in your ENV dir.
# 
# - clone the repo
# - copy everything downloaded to the `release` location
# - in whatever folder, create a virtualenv, and activate it.
# - run the `pip install -r requirements.txt` 
# - copy the contents of `ENV/lib/python2.7/site-packages` to the `release` location
# - zip the `release` location, and ship it to amazon.
# 
# the problem here is activating the environment from the bash file. seems easy.
################################################################################
REPO="https://github.com/wakaru44/aws_lambda.personal_api_base.git"

# TODO: improve logging. or at least add it

################################################################################
# Finish changes in the current repo and prepare

git push
# BASEDIR should be the path of the app. It will be used for naming and all.
BASEDIR=$(pwd)
echo "Working on the path $BASEDIR. Please check"
mkdir -p $BASEDIR/releases
mkdir -p $BASEDIR/tmp
mkdir -p $BASEDIR/packages


################################################################################
# Prepare code in the temporary location
cd $BASEDIR/tmp
git clone $REPO .
cp -rv * $BASEDIR/releases

################################################################################
# Then get the extra packages
virtualenv ENV
source ENV/bin/activate
pip install -r $BASEDIR/requirements.txt
deactivate
cp -rv ENV/lib/python2.7/site-packages/* $BASEDIR/releases

################################################################################
# Now, create the package
cd $BASEDIR/releases
PKG="$(basename ${BASEDIR}_v$(cat version.md ).zip)"
zip -r $PKG *
mv $PKG $BASEDIR/packages


################################################################################
# And finally, cleanup after yourself
# commented out to leave it for debugging. can be achieve with make clean
#rm -fr $BASEDIR/tmp
#rm -fr $BASEDIR/releases
cd $BASEDIR

