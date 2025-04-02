#!/bin/bash
pushd ~/IdeaProjects/jbang
unset JBANG_JAVA_OPTIONS
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk env
rm -f -r build
rm -f -r temp
./gradlew spotlessCheck
./gradlew installDist
popd
