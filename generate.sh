#!/bin/sh

set -e -x

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

SECRETS=$SCRIPTPATH/secrets.yml
TERRAFORM=$SCRIPTPATH/terraform.yml
MANIFEST=$SCRIPTPATH/manifest.yml
if [ ! -z "$1" ]; then
  SECRETS=$1
fi
if [ ! -z "$2" ]; then
  TERRAFORM=$2
fi
if [ ! -z "$3" ]; then
  MANIFEST=$3
fi

spruce merge --prune meta --prune terraform_outputs \
  $SCRIPTPATH/nessus-manager.yml \
  $SECRETS \
  $TERRAFORM \
  > $MANIFEST