#!/bin/bash
# A simple shell script for setting up a new project that looks pretty and is functional
# Inputs: the name of the project 

Project=$1
Python=$2

# ----- create directories -----
mkdir -p $Project

Directories="projects,source,scripts,third_party,plots,tests,docs"
FieldSeparator=$IFS$

IFS=,
for dir in $Directories
do
  NewDir="${Project}/${dir}"
  mkdir -p "${NewDir}"
done
IFS=$Field_Separator


# ----- create README.md -----
DummyReadmeContent=$'\nBriefly describe project \n\n\n\n## Getting started \n\n\n\n### Prerequisites \n\n\n\n### Installing \n\n\n\n## How to run \n\n\n## License \n his project was created using PRettyPRoject, written by Elena Nisioti.'
Title="# ${Project}"
Title+=$DummyReadmeContent
DummyReadmeFile="${Project}/README.md"
echo $Title >> $DummyReadmeFile

# ----- create conda environment -----
if [ -z "$2"]
  then
   echo "No conda environment created."
  else
    conda create -n "${Project}Env" python=$2
fi

# ----- initialize documentation ------
cd "${Project}/docs"
sphinx-quickstart
cd ../..

# create dummy test file to check that documentation is working
DummyComment=$'### This is a dummy test file to check if shpinx works. \nTodo:
\n  * Delete this file. \n###'
DummySourceFile="${Project}/source/test_sphinx.py"
cp test_sphinx.py $DummySourceFile

# change line in config.py
sed -i '1i import os \nimport sys \nsys.path.insert(0, "../source")' "${Project}/docs/conf.py"
echo $'\nextensions = ["sphinx.ext.autodoc"]' >> "${Project}/docs/conf.py"


sed -i '13i \   rst/modules.rst \n   ' "${Project}/docs/index.rst"

cd "${Project}/docs"
sphinx-apidoc -o rst ../source
make html

