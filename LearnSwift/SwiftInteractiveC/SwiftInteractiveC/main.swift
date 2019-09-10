//
//  main.swift
//  SwiftInteractiveC
//
//  Created by Flex on 2019/6/12.
//  Copyright © 2019 flex. All rights reserved.
//

import Foundation

/*
 C语言中的基础类型
 1 对C中的类型采取驼峰式命名之后，加上前缀字母C
 int变成CInt；
 unsigned char变成CUnsignedChar；
 unsigned long long变成CUnsignedLongLong；
 2 特殊的情况
 wchat_t变成CWideChar；
 char16_t变成CChar16；
 char32_t变成CChar32；
 */

// swift 中使用C的类型定义变量
let cInt:CInt = 10

//引用OC中的全局变量
let ten = global_ten

//引用TrafficLightColor 变成了一个struct
//转换规则是这样的：
//
//根据NS_STRING_ENUM修饰的类型决定导入到Swift时struct的名字，因此，导入的类型名称就是TrafficLightColor；
//去掉和类型名称相同的公共前缀，并把剩余部分首字母小写后，变成struct的type property；
let redColor :TrafficLightColor = .red
let redColorRawValue = redColor.rawValue
//TrafficLightColor 从OC转换成Swift的样子是什么样的呢  看下面的代码
/*
 struct TrafficLightColor: RawRepresentable {
 typealias RawValue = String
 
 init(rawValue: RawValue)
 var rawValue: RawValue { get }
 
 static var red: TrafficLightColor { get }
 static var yellow: TrafficLightColor { get }
 static var green: TrafficLightColor { get }
 }
 */
//struct TrafficLightColor: RawRepresentable {
//    typealias RawValue = String
//
//    init(rawValue: RawValue)
//    var rawValue: RawValue { get }
//
//    static var red: TrafficLightColor { get }
//    static var yellow: TrafficLightColor { get }
//    static var green: TrafficLightColor { get }
//}

//RawRepresentable 是什么东西呢
//https://www.jianshu.com/p/ded6d91bc9f6 返回自身
//包装 硬编码
/*
struct PreferenceName<Type>: RawRepresentable {
    typealias RawValue = String
    
    var rawValue: String
    
    init?(rawValue: PreferenceName.RawValue) {
        self.rawValue = rawValue
    }
}

extension UserDefaults {
    subscript(key: PreferenceName<Bool>) -> Bool {
        set { set(newValue, forKey: key.rawValue) }
        get { return bool(forKey: key.rawValue) }
    }
    subscript(key: PreferenceName<Int>) -> Int {
        set { set(newValue, forKey: key.rawValue) }
        get { return integer(forKey: key.rawValue) }
    }
    subscript(key: PreferenceName<Any>) -> Any {
        set { set(newValue, forKey: key.rawValue) }
        get { return value(forKey: key.rawValue) }
    }
}
//包装硬编码
struct PreferenceNames {
    
    static let maxCacheSize = PreferenceName<Int>(rawValue: "MaxCacheSize")
    
    static let badgeType = PreferenceName<Int>(rawValue: "BadgeType")
    
    static let backgroundImageURL = PreferenceName<URL>(rawValue: "BackgroundImageURL")
    
}
//使用
UserDefaults.standard[PreferenceNames.maxCacheSize] = 30
*/

//NS_EXTENSIBLE_STRING_ENUM 和 NS_STRING_ENUM 有什么不同呢
//类型Shape在Swift中会被导入成一个struct，它和TrafficLight唯一不同的地方在于，多了一个可以省略参数的init方法，使得我们可以在Swift里，这样扩展Shape的值：

extension Shape {
    static var ellipse: Shape {
        return Shape(4)
    }
}

let e: Shape = .ellipse
//NS_STRING_ENUM 也可以扩展
extension TrafficLightColor {
    static var blue: TrafficLightColor {
        return TrafficLightColor(rawValue: "Blue")
    }
}
