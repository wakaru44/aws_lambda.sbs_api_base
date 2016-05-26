#!/bin/bash

################################################################################
#
# Script to create a release package with the code
#
################################################################################
REPO="https://github.com/wakaru44/aws_lambda.python_boilerplate"


################################################################################
# Finish changes in the current repo and prepare

git push
BASEDIR=$(pwd)
echo "Working on the path $BASEDIR. Please check"
mkdir -p $BASEDIR/release
mkdir -p $BASEDIR/tmp


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
# And finally, create the package
cd $BASEDIR/release
zip boilerplate_release.zip



