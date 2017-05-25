//
//  SwiftClass.swift
//  basic_swift
//
//  Created by 刘红波 on 2017/5/25.
//  Copyright © 2017年 刘红波. All rights reserved.
//

//Swift - 构造 和 析构方法

import Foundation

class Student {
    //类的属性
    var name:String = ""
    var number:Int = 0
 
}

class Person {
    var name:String
    var age: Int

    init(newName:String,newAge:Int) {
        self.name = newName
        self.age = newAge
    }
    //类方法
    func say() -> String{
        return "我叫\(name)"
    }
    
    
    
}

//deinit()  类反初始化方法 （析构方法）


class DCMBasic {
    var conn:Person? = Person(newName: "hangge", newAge: 32)
    
    deinit {
        //可以做一些清理工作
        
        self.conn = nil;
    }
    
}
class  SwiftClass{
    //init()：类的初始化方法（构造方法）
    var student = Student()
    
    
    var p  = Person(newName: "hangge", newAge: 32)
    
//    print(p.say())
    
    
//    var db:DBClass? = DBClass()
//    db = nil //设置nil后即可执行deinit()方法
    
    
    
}

