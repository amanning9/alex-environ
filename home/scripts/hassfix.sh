#!/usr/bin/bash

yprint.py $@ | sed -E -e "s/'(\!include.*)'/\1/g"
