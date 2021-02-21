#!/bin/bash

workdir=$(dirname "${BASH_SOURCE[0]}")/_workspace
vscodeDir=$workdir/_vscode

if [ ! -f $vscodeDir/cpptools-linux.vsix ]; then
  mkdir $vscodeDir
  cd $vscodeDir
  curl -LO https://hub.fastgit.org/microsoft/vscode-cpptools/releases/download/1.2.1/cpptools-linux.vsix
  cd -
fi

remote=https://github.com/apache/incubator-brpc
rev=60159fc3f3e13490fb9806ea0a0cb0dcdbda7f7d
outDir=$workdir/_brpc

rm -rf $outDir
git clone $remote $outDir

cd $outDir
git checkout $rev
