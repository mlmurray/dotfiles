#!/bin/sh

mv ~/.bash_profile ~/.old-bash-profile
ln `pwd`/bash_profile ~/.bash_profile
source ~/.bash_profile
