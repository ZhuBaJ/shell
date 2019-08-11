#!/bin/bash
# For example by jack

echo "基本使用"
# 基本使用
pwd
ls -al

echo "获取用户参数"
# 获取用户参数
echo "bash shell name:$0"
echo "total argc:$#,include $*"
echo "first:$1 five:$5"
 
echo "判断用户参数"
# 判断用户参数
# 条件表达式分为四种：文件测试、逻辑测试、整数值比较、字符串比较
# -d: 测试文件是否为目录类型   dir
# -e: 测试文件是否存在	exist
# -f: 判断是否为一般文件	file
# -r: 判断是否有读取权限 read
# -w: 判断是否有写入权限 write
# -x: 判断是否有执行权限 executive
echo $USER
if [ -e /etc/fstab ]; then
    echo "[ -e /etc/fstab ] exist..." 
else
    echo "[ -e /etc/fstab ] not exist..." 
fi
if [ -e /etc/fsteb ]; then
    echo "[ -e /etc/fsteb ] exist..." 
else
    echo "[ -e /etc/fsteb ] not exist..." 
fi
echo "[ -d /etc/fstab ]"
echo "[ -f /etc/fstab ]"
echo "[ -r /etc/fstab ]"
if [ -w /etc/fsteb ]; then
    echo "[ -w /etc/fsteb ] write ..." 
else
    echo "[ -w /etc/fsteb ] no write ..." 
fi
echo "[ -r /etc/fstab ]"

echo "逻辑判断"
# 逻辑判断
# 与：A && B: A为真才会执行B
# 或：A || B: A为假才会执行B
# 非：!A    : 对结果取相反值
[ $USER = jack ]   && echo "jack"
[ $USER = root ]   || echo "jack"
[ $USER != root ]  && echo "jack"
[ ! $USER = root ] && echo "jack"

echo "比较"
#比较
# -eq: 是否等于 equal
# -ne: 是否不等于 not equal
# -gt: 是否大于 greater
# -lt: 是否小于 less
# -le：是否小于等于
# -ge：是否大于等于
[ 1 -eq 1 ]  && echo "="
[ 1 -eq 10 ] || echo "!="
free | grep Mem: | awk '{print $4}'
# 定义变量等号和数值之间不能留空格
FreeMem=512  
[ $FreeMem -eq 512 ] && echo "ok"
# 字符串比较
# = != -z
hellp_str="hello"
#$[ $hellp_str = "hello" ] && echo "hellp_str equal hello"
if [ $hellp_str = "hello" ]; then
    echo "hellp_str equal hello"
fi
echo "函数测试"
# 函数测试
func_echo() {
    echo "hello world"
    echo "I am func ......"
}
func_echo
echo "if判断"
# if条件判断
DIR="/home/jack"
if [ -e ${DIR} ]; then
    echo "/home/jack is exist ..."
fi
# 执行命令并判断
ping -c 3 -i 0.2 -W 3 $1 &> /dev/null
if [ $? -eq 0 ]
then
    echo "host $1 is on-line"
else
    echo "host $1 is off-lne"
fi
# 多分支条件判断
if   [ $1 -ge 85 ] && [ $1 -le 100 ]; then
    echo "85-100"
elif [ $1 -ge 60 ] && [ $1 -lt 85 ];  then
    echo "60-85"
else
    echo "<60"
fi

echo "for循环"
# 循环语句
HLIST=$(cat ./ipaddrs.txt)
for IP in $HLIST
do
    ping -c 3 -i 0.2 -W 3 $IP &> /dev/null
if [ $? -eq 0 ]; then
    echo "Host $IP is on-line"
else
    echo "Host $IP is off-line"
fi
done

echo "case语句"
# case语句测试
read -p "请输入一个字符，并按Enter键确认" KEY
case "$KEY" in
[a-z]|[A-Z])
echo "您输入的是字母"
;;
[0-9])
echo "您输入的是数字"
;;
*)
esac

echo "while循环"
# while循环语句
PRICE=$(expr $RANDOM % 1000)
TIMES=0
echo "商品的实际价格在0-999之间，猜猜是多少？"
while true
do
    read -p "请输入您猜测的价格数目：" INT 
    if [ $INT = 'q' ]; then
        exit 0
    fi
    let TIMES++
    echo "INT: $INT"
if [ $INT -eq $PRICE ]; then
    echo "恭喜您答对了，实际价格是 $PRICE"
    echo "您共猜测了 $TIMES 次"
    exit 0
elif [ $INT -gt $PRICE ]; then
    echo "太高了"
else
    echo "太低了"
fi
done
