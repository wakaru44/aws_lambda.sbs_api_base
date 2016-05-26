a basic boilerplate to start a lambda with python

# Usage

the `setup.cfg` file contains the prefix used to install any module
not included in AWS by default (all but boto3). 

You can use the `requirements.boto.txt` file to install that. Maybe you want to rename the `setup.cfg` while you install this.

Once you are inside your virtualenv, you should be using the dependencies included in the root folder, as those are the ones that AWS will use.


# TODO: It seems that there are better ways  to do this with virtualenv. 

Just include your code, and the site-packages folder in your ENV dir.

- clone the repo
- copy everything downloaded to the `release` location
- in whatever folder, create a virtualenv, and activate it.
- run the `pip install -r requirements.txt` 
- copy the contents of `ENV/lib/python2.7/site-packages` to the `release` location
- zip the `release` location, and ship it to amazon.

the problem here is activating the environment from the bash file. seems easy.
