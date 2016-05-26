# A simple makefile to make things simpler

help:
	@echo "AWS Lambda. Python Boilerplate";
	@echo "";
	@echo "help           - This text.";
	@echo "todo           - Will print all the TODO's in the code.";
	@echo "release        - make a release using a simple script.";
	@echo "bump           - Bump the version file";
	@echo "clean          - Clean the folder of temp dirs and pyc";
	@echo "";


todo:
	grep  -r "TODO:" * --exclude-dir ENV --exclude Makefile

release:
	bash release.sh; echo "done"

bump:
	python -c 'fh=open("version.md");c=fh.readline();n=map(lambda x: int(x),c.split("."));print ".".join(map(str, [n[0],n[1],n[2]+1]))' > new_version.md; mv new_version.md version.md

clean:
	rm -rf release; rm -rf tmp; rm *pyc
