#######################################################################################
# dbt commands

docs:
	dbt docs generate && dbt docs serve

gen:
	python code/model_generate.py

#######################################################################################
# git commit, push, and pull requests

push:
	git checkout -B feature/jacob_feature
	@powershell -Command $$msg = Read-Host "Enter commit message"; `
	git add .; `
	git commit -m "$$msg"; `
	git push origin feature/jacob_feature || git push -u origin feature/jacob_feature

pull:
	git checkout main && git pull origin main

#######################################################################################
# code formatter
fmt:
	sqlfmt models