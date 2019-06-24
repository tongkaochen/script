#!/bin/bash
p1=$1
p2=$2
p3=$3
p4=$4
p5=$5
p6=$6
num=$#
attrs="-nr"
if [ "$p1" == "-i" ];then
 p1=$2
 p2=$3
 p3=$4
 p4=$5
 p5=$6
 let num=num-1
 attrs="-nri"
fi
fun1()
{
 grep $attrs "$p1" --color *
}
fun2()
{
 grep $attrs -e "$p1" --color $p2
}
fun3()
{
 grep $attrs -e "$p1" -e "$p2" --color $p3
}
fun4()
{
 grep $attrs -e "$p1" -e "$p2" -e "$p3" --color $p4
}
fun5()
{
 grep $attrs -e "$p1" -e "$p2" -e "$p3" -e "$p4" --color $p5
}
fun6()
{
 grep $attrs -e "$p1" -e "$p2" -e "$p3" -e "$p4" -e "$p5" --color $p6
}
case $num in
1) fun1;;
2) fun2;;
3) fun3;;
4) fun4;;
5) fun5;;
6) fun6;;
esac
