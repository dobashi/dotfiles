#!/bin/bash

curl -s "https://get.sdkman.io" | bash

echo source "$HOME/.sdkman/bin/sdkman-init.sh"

# need bash -c ?
sdk install java
sdk install kotlin

