//
//  main.swift
//  LearnOO
//
//  Created by WangChao on 6/18/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

import Foundation


class Hi
{
    func sayHi()
    {
        println("fuck hell")
    }
}


class Hello:Hi
{
    var _name:String
    
    init(name:String)
    {
        println("init hello")
        self._name = name;
    }
    
    
    override  func sayHi()
    {
        println("say hello\(self._name)")
    }
}



var hi = Hi()
hi.sayHi()

var hi2 = Hello(name: "fucka")
hi2.sayHi()







