
a=10
b=20
val=`expr $a + $b`
echo "a + b : $val"

vab=`expr $a + $b`
echo "a+b:$vab"


val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
   echo "a is equal to b"
fi

if [ $a != $b ]
then
   echo "a is not equal to b"
fi


if [ $a != $b ]
 then 
 echo "="
else 
 echo "not ="
fi

if [ $a -lt 100 -o $b -gt 20 ]
 then 
echo "go righ"
else 
echo "not go "
fi 

