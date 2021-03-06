#!/bin/bash

reps=5

> ./log1.txt

for i in `seq 1 $reps`;
do
    hadoop fs -rm -r hdfs:///user/hadoop/output1
    spark-submit --master local[*] ./df1.jar | grep milliseconds >> ./log1.txt
done

> ./log4.txt

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    hadoop fs -rm -r hdfs:///user/hadoop/output4
    spark-submit --master local[*] ./df4.jar | grep milliseconds >> ./log4.txt
done

> ./log5.txt

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    hadoop fs -rm -r hdfs:///user/hadoop/output5
    spark-submit --master local[*] ./df5.jar | grep milliseconds >> ./log5.txt
done


