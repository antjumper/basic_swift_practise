//
//  SwiftStaticPropertyANDFunction.swift
//  basic_swift
//
//  Created by 刘红波 on 2017/5/25.
//  Copyright © 2017年 刘红波. All rights reserved.
//

//Swift - 类型属性（类静态属性）和类方法（类静态方法）

import Foundation

//1，结构体struct和枚举enum的静态属性，静态方法使用static关键字

struct Account {
    var amount:Double = 0.0
    
    var owner:String = ""
    
    static var interestRate:Double = 0.668
    
    static func interestBy(amount:Double) -> Double{
        
        return interestRate * amount
        
    }
    
    
}

// 2类class 的类属性 类方法 使用class 关键字

class AccountClass {
    var amount:Double = 0.0
    
    var owner : String = ""

    class var staticProp:Double{
        return 0.668
    }
    
    class func interestBy(amount:Double) -> Double {
        return amount * 0.668
    }
    
    //访问静态属性
//    print(Account.staticProp)

}
