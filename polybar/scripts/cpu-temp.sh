#!/usr/bin/env sh

sensors | grep 'Composite' | awk '{print $2}'
