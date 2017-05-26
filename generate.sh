#!/bin/sh

set -e -x

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

MAIN_SECRETS=$SCRIPTPATH/secrets.yml
EXT_SECRETS=$SCRIPTPATH/secrets-external.yml
TERRAFORM=$SCRIPTPATH/terraform.yml
MANIFEST=$SCRIPTPATH/manifest.yml

if [ ! -z "$1" ]; then
  MAIN_SECRETS=$1
fi
if [ ! -z "$2" ]; then
  EXT_SECRETS=$2
fi
if [ ! -z "$3" ]; then
  TERRAFORM=$3
fi
if [ ! -z "$4" ]; then
  MANIFEST=$4
fi

spruce merge --prune meta --prune terraform_outputs \
  $SCRIPTPATH/nessus-manager-deployment.yml \
  $MAIN_SECRETS \
  $EXT_SECRETS \
  $TERRAFORM \
  > $MANIFEST