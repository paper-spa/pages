#!/bin/bash

#######################################################################################################
# 
# Calls github-pages executable to build the site using whitelisted plugins and supported configuration
#
#######################################################################################################

set -o errexit

SOURCE_DIRECTORY=${GITHUB_WORKSPACE}/$INPUT_SOURCE
DESTINATION_DIRECTORY=${GITHUB_WORKSPACE}/$INPUT_DESTINATION
PAGES_GEM_HOME=/src/gh/pages-gem
GITHUB_PAGES=$PAGES_GEM_HOME/bin/github-pages

if [ -z $INPUT_VERBOSE ]; then
  VERBOSE=''
else
  VERBOSE='--verbose'
fi

cd $PAGES_GEM_HOME

$GITHUB_PAGES build $VERBOSE --source $SOURCE_DIRECTORY --destination $DESTINATION_DIRECTORY
