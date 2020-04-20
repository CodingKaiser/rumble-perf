#!/bin/bash

rm -f ./log-io-*.txt

reps=25

> ./log-io-p.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-io-p
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path index-of1.jq --output-path output-io-p --log-path ./log-io-p-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-io-p-tmp.txt >> ./log-io-p.txt
done

> ./log-io-l.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-io-l
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path index-of1.jq --output-path output-io-l --log-path ./log-io-l-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-io-l-tmp.txt >> ./log-io-l.txt
done
