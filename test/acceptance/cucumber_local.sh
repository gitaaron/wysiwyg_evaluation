#!/bin/bash
# Run cucumber with a local server
browser= feature=

while getopts b:f: opt; do
    case $opt in
    b)
        browser=$OPTARG
        ;;
    f)
        feature=$OPTARG
        ;;
    esac
done

shift $((OPTIND - 1))

# Run cucumber with a remote selenium server
if [ -z "$ENV_DATA" ]
  then
    ENV_DATA=atvm
fi

cmd="ENV_DATA=$ENV_DATA"

if [ -n "$browser" ]
  then
    cmd+=" BROWSER=${browser:1}"
  else
    cmd+=" BROWSER=firefox"
fi

cmd+=" cucumber"

if [ -n "$feature" ]
  then
    cmd+=" features/${feature:1}"
fi

cmd+=" features/test.feature"

echo $cmd
eval $cmd
