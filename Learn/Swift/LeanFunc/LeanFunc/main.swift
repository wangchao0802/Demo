//
//  main.swift
//  LeanFunc
//
//  Created by WangChao on 6/18/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

import Foundation

func  sayHello (name:String)
{
    println("Hello, World!\(name)")
}

sayHello("fuck gril")

func getNum()-> (Int,Int)
{
    return (23,3)
}

let (a,b) = getNum()
println(a)

var fun = sayHello
fun("zhangsan")








