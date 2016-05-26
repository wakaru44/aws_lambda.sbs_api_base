a basic boilerplate to start a lambda with python

# Usage

the `setup.cfg` file contains the prefix used to install any module
not included in AWS by default (all but boto3). 

You can use the `requirements.boto.txt` file to install that. Maybe you want to rename the `setup.cfg` while you install this.

Once you are inside your virtualenv, you should be using the dependencies included in the root folder, as those are the ones that AWS will use.


