// Playground - noun: a place where people can play

import Cocoa




let somPoint = (10,10)

switch somPoint
{
case (0,0):
    println("AA");
    
    
case (let x,0):
    println(" \(x)BB");
case (0,let y):
    println("CC\(y)");
case (-2...2,-2...2):
    println("DD");
    
case (let x, let y) where x == y:
    println("x\(x) y \(y)");

default:
    println("EE");
}


let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    
default:
    description += " an integer."
}
println(description)



func join(str  s1:String , st2 s2:String,joiner:String = "aaa")->String
{
    return s1 + joiner + s2;
}

join(str: "fuck", st2: "go", joiner:"lala");

join(str: "fa", st2: "gg")


func aime(numbers:Double...)
{
    for number in numbers
    {
        println(number);
    }
}


aime(2,3,4,5,5)























