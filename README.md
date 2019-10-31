# PRettyPRoject

This project is a simple file that helps you initialize a pretty research project. It creates an intuitive directory structure for your new project, initializes a new conda environment and sets up sphinx documentation.

## Installation
The script is a simple bash shell script. To use it, you need to have the following programs installed in your Linux distribution:

* conda. To install conda, please visit the [official website](https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html).

* sphinx. To install sphinx, you may run `apt-get install python3-sphinx`

## Usage
To run the script you need to provide the name of the project and the python version. For example: `.\setup.sh testing 3.7`

This will create a directory testing in your current folder that has the following sub-directories:
projects,source,scripts,third_party,plots,tests,docs

* source. You can keep your source files (ending in .py) here.
* scripts. Python and script files that are not included in the source directory can be kept here.
* projects. This is where your simulations are stored, each one as a different project.
* third_party. Any third_party libraries that need to be imported from source files.
* plots. Plots created during simulations intended for reports and papers.
* tests. Files for unit testing.
* docs. Contains the sphinx documentation. You can access the html documentation under docs/\_build/html/index.html

During the setting up, sphinx will ask you some questions. The name of the project should be the same with the name you used as an argument to the script.

Happy experimenting!
