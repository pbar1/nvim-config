#!/usr/bin/env bash

set -o nounset -o errexit -o pipefail

function hello() {
	local world

	world="world"

	echo "Hello, ${world}"
}

hello
