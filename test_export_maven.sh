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
sleep 5

mkdir Java
pushd Java
$JBANG run tulip-cli@wfouche init Java
$JBANG export maven io/tulip/App.java
cp benchmark_config.json App
cd App
mvn wrapper:wrapper -Dmaven=3.9.9
./mvnw versions:display-dependency-updates
popd

echo "Groovy"
#sleep 5

mkdir Groovy
pushd Groovy
$JBANG run tulip-cli@wfouche init Groovy
$JBANG export maven io/tulip/App.groovy
cp benchmark_config.json App
cd App
mvn wrapper:wrapper -Dmaven=3.9.9
./mvnw versions:display-dependency-updates
popd

echo "Kotlin"
#sleep 5

mkdir Kotlin
pushd Kotlin
$JBANG run tulip-cli@wfouche init Kotlin
$JBANG export maven io/tulip/App.kt
cp benchmark_config.json App
cd App
mvn wrapper:wrapper -Dmaven=3.9.9
./mvnw versions:display-dependency-updates
popd

popd
