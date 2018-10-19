#!/usr/bin/env bash

BACKUPTIME=`date +%b-%d-%y`
echo $BACKUPTIME
WORKING_DIR=$(pwd)
SCRIPTS_DIR=$WORKING_DIR'/scripts'
VENV_DIR=$WORKING_DIR'/venv'
MESSAGE='CURRENT SCRIPTS DIRECTORY: '
MESSAGE+=$SCRIPTS_DIR
echo $MESSAGE

# Check for python, pip and virtual env
echo 'Checking Python 3.x is installed in current system...'
if command -v python3 &> /dev/null;
then
    echo "Python 3 found! Checking virtualenv"

    if command -v pip3 &> /dev/null;
    then
        echo 'pip3 is installed! Checking virtualenv'
        if ! command -v virtualenv &> /dev/null;
        then
          sudo pip3 install virtualenv
        fi
        if ! -d  ${VENV_DIR};
        then
            virtualenv -p python3 venv
        fi
        source venv/bin/activate
        echo "Updating packages to last version"
        pip install -r requirements.txt
        pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
        pip freeze > requirements.txt
        echo "Package update complete!"
    else
        echo 'pip3 is required by PyMicron. Please installed pip3 by running sudo apt install python3-pip'
    fi
else
    echo 'Python 3.4+ is required by PyMicron. Please use sudo apt install python3 to install Python in your system'
fi
