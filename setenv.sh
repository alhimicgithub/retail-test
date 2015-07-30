# ######################################################################### ##
# ALl Software, Inc.
# Copyright (c) ALl Software, Inc. 2014-2014
# All Rights Reserved.
## ######################################################################### ##


## ######################################################################### ##
## SET ENVIRONMENT VARIBLES                                                  ##
## ######################################################################### ##

BASE_HOME="$PWD/../test1"
export POSTGREE_HOME="$BASE_HOME/lib/pgsql"

#export LD_LIBRARY_PATH="$POSTGREE_HOME/pgAdmin3/lib"
export PATH="$PATH:$POSTGREE_HOME/bin"

echo $PATH