#!/bin/bash

# usage
# if isLinux ; then
#   ...do_something...
# fi

isLinux(){
  [ $(uname) = "Linux" ]
}

isMac(){
  [ $(uname) = "Darwin" ]
}

isCygwin(){
  if [[ isLinux || isMac ]] ; then
   false 
  else
    [ $(uname -o) = "Cygwin" ]
  fi
}

