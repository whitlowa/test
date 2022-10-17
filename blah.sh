#!/bin/bash

suffix=$1

result=$(curl "https://raw.githubusercontent.com/$suffix/test/main/mkdir.sh")

echo $result
