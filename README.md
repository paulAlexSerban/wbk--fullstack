# Software Engineering & Fullstack Workbook

## How to use
### Setup Jupiter Notebook for Local API Testing
- RUN: `python3 -m venv .venv` -  to create a python virtual environment (make sure .venv is in .gitignore)
- RUN: `source .venv/bin/activate` - to activate the virtual environment
- RUN: `pip install -r jupiter-notebook-requirements.txt` - to install the required packages
- RUN: `pip freeze > jupiter-notebook-requirements.lock.txt` - to save the installed packages
- RUN: `python -m ipykernel install --user --name=.venv --display-name "Python (.venv)"` - to add the virtual environment to jupiter notebook
- RUN: `jupyter notebook` - to start the jupiter notebook server
- OPEN: `http://localhost:8888/` - to access the jupiter notebook server
- SELECT: `Python (.venv)` - to create a new notebook using the virtual environment

### Use Git Submodules
- check if submodule exists: `git submodule status` and check .gitmodules file
- add submodule: `git submodule add <repository-url> <path>` - to add a new submodule
- update submodule: `git submodule update --remote --merge` - to update the submodule to the latest commit
- initialize submodule: `git submodule init` - to initialize the submodule
- clone submodule: `git submodule update --init --recursive` - to clone the submodule
- remove submodule: `git rm --cached <path>` - to remove the submodule from the repository
- commit changes: `git commit -m "Updated submodule"` - to commit the changes
- push changes: `git push` - to push the changes to the remote repository