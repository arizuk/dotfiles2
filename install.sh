#!/bin/bash

bin/setup.sh


case "$(uname)" in
  "Darwin")  bin/mitamae local $@ recipe.rb ;;
  *) sudo -E bin/mitamae local $@ recipe.rb ;;
esac