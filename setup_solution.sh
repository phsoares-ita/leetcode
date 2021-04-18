#!/bin/bash

file=$( echo $1 | tr '[:upper:]' '[:lower:]' )
file=${file// /_}
file=${file//./}

cp template.rb spec/"$file"_spec.rb