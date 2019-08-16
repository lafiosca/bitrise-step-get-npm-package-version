#!/bin/bash
set -ex
set -o pipefail

if [[ ! -f $package_json_path ]]
then
	echo "No package config file found at path: ${package_json_path}"
	exit 1
fi

NPM_PACKAGE_VERSION=`cat "$package_json_path" | jq -r '.version | select(type == "string")'`

echo "Found package version: ${NPM_PACKAGE_VERSION}"

envman add --key NPM_PACKAGE_VERSION --value "${NPM_PACKAGE_VERSION}"
