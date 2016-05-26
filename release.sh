#!/bin/bash

################################################################################
#
# Script to create a release package with the code
#
################################################################################
REPO="https://github.com/wakaru44/aws_lambda.python_boilerplate.git"

# TODO: improve logging. or at least add it

################################################################################
# Finish changes in the current repo and prepare

git push
# BASEDIR should be the path of the app. It will be used for naming and all.
BASEDIR=$(pwd)
echo "Working on the path $BASEDIR. Please check"
mkdir -p $BASEDIR/release
mkdir -p $BASEDIR/tmp
mkdir -p $BASEDIR/packages


################################################################################
# Prepare code in the temporary location
cd $BASEDIR/tmp
git clone $REPO .
cp -rv * $BASEDIR/release

################################################################################
# Then get the extra packages
virtualenv ENV
source ENV/bin/activate
pip install -r $BASEDIR/requirements.txt
deactivate
cp -rv ENV/lib/python2.7/site-packages/* $BASEDIR/release

################################################################################
# Now, create the package
cd $BASEDIR/release
PKG="$(basename ${BASEDIR}_v$(cat version.md ).zip)"
zip $PKG *
mv $PKG $BASEDIR/packages


################################################################################
# And finally, cleanup after yourself
# commented out to leave it for debugging. can be achieve with make clean
#rm -fr $BASEDIR/tmp
#rm -fr $BASEDIR/release
cd $BASEDIR

