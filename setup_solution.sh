#!/bin/bash

solution=$( echo $1 | tr '[:upper:]' '[:lower:]' )
solution=${solution// /_}
solution=${solution//./}

mkdir -p solutions/$solution/spec
cp template/template.rb solutions/$solution/spec/solution_spec.rb

echo "Created solution solutions/$solution"
bash test.sh solutions/$solution

echo "bash test.sh solutions/$solution/spec" | xclip -sel clip
echo "Test command pasted to your clipboard"