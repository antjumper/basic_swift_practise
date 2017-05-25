//
//  Stack.swift
//  basic_swift
//
//  Created by 刘红波 on 2017/5/25.
//  Copyright © 2017年 刘红波. All rights reserved.
//

/*
 在Swift语言中，访问修饰符有五种，分别为fileprivate，private，internal，public和open
 
 1 private访问级别所修饰的属性或者方法只能在当前类里访问。
 2 fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问
 
 3 internal（默认访问级别，internal修饰符可写可不写）
 internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
 如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
 如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
 
 原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_524.html
 
 4 public 可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。
 5 open 可以被任何人使用，包括override和继承。
 
 6 open > public > interal > fileprivate > private
 */

import Foundation

public struct Stack<T> {
    fileprivate var array = [T]()
    public var isEmpty:Bool{
        return array.isEmpty
    }
    public var count: Int{
        return array.count
    }
    
    public mutating func push(_ element: T){
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}
