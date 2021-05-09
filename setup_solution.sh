#!/bin/bash

solution=$( echo $1 | tr '[:upper:]' '[:lower:]' )
solution=${solution// /_}
solution=${solution//./}

mkdir $solution
mkdir $solution/spec
cp spec/spec_helper.rb $solution/spec/
cp template.rb $solution/spec/solution_spec.rb

echo "Created solution $solution"
echo "To test run: bash test.sh $solution"

echo "bash test.sh $solution" | xclip -sel clip
echo "Command pasted to your clipboard"