//
//  SwiftFunction.swift
//  basic_swift
//
//  Created by 刘红波 on 2017/5/25.
//  Copyright © 2017年 刘红波. All rights reserved.
//

///Swift - 自定义函数规则说明

import Foundation

//1 无返回值的函数 
func test(name:String){
    
}

//2返回一个返回值
func test (name:String)-> Bool{
    return true
}

//3 返回一个由多个值组装成的符合返回值
func test(name:String) -> (Int,Bool){
    return (1,true)
}

//4 可变形参： 可以接受 0 个或者 任意数量的输入参数
func test (numbers:Int...) -> Int{
    var count:Int = 0;
    for number in numbers {
        count += number
    }
    return count
    
}

//5 如果想要同时 改变函数内外的参数值 可以利用inout 关键字 同时调用函数的时候给参数加上前缀 &

func add( age: inout Int) {
    age += 1
}

//var age = 22
//add(age: &age)
//print(age)

// 6 可以使用函数类型的参数

func additive(a:Int,b:Int) -> Int{
    return a+b
}

//函数类型的参数

func printAdditiveResult(addFun:(Int,Int)->Int,a:Int,b:Int){
    
    print("\(addFun(a,b))")
    
}

// 7 函数类型的返回值

func increase(intput:Int) -> Int{
    return intput + 1
}

func reduce(input:Int) -> Int {
    return input - 1
}

//定义一个返回函数类型的函数

func chooseFunction(backwards:Bool) -> (Int) ->Int {
    return backwards ? reduce : increase
}

//测试代码
//let afun = chooseFunction(backwards: 3>2)
//print("\( afun(3) )")


































