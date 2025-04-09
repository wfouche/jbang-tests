#!/bin/bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk env

unset JBANG_JAVA_OPTIONS

pushd ~/IdeaProjects/jbang
export JBANG="`pwd`/build/install/jbang/bin/jbang"
echo $JANG
popd

rm -f -r temp
mkdir temp
pushd temp

echo "Java"
#sleep 5

mkdir Java
pushd Java
$JBANG run tulip-cli@wfouche init Java
$JBANG export gradle io/tulip/App.java
cp benchmark_config.json App
cd App
# gradle wrapper --gradle-version 8.9
./gradlew run
popd

echo "Groovy"
#sleep 5

mkdir Groovy
pushd Groovy
$JBANG run tulip-cli@wfouche init Groovy
$JBANG export gradle io/tulip/App.groovy
cp benchmark_config.json App
cd App
# gradle wrapper --gradle-version 8.9
./gradlew run
popd

echo "Kotlin"
#sleep 5

mkdir Kotlin
pushd Kotlin
$JBANG run tulip-cli@wfouche init Kotlin
$JBANG export gradle io/tulip/App.kt
cp benchmark_config.json App
cd App
# gradle wrapper --gradle-version 8.9
./gradlew run
popd

popd
