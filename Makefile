# A simple makefile to make things simpler

help:
	@echo "AWS Lambda. Python Boilerplate
	@echo "";
	@echo "help           - This text.";
	@echo "todo           - Will print all the TODO's in the code.";
	@echo "release        - make a release using a simple script.";
	@echo "";


todo:
	grep  -r "TODO:" * --exclude-dir ENV --exclude Makefile

run:
	python app.py

