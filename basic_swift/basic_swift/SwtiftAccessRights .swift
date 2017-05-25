//
//  SwtiftAccessRights .swift
//  basic_swift
//
//  Created by 刘红波 on 2017/5/25.
//  Copyright © 2017年 刘红波. All rights reserved.
//

import Foundation
/*
 
 
 在Swift语言中，访问修饰符有五种，分别为fileprivate，private，internal，public和open。
 
 
 
 其中 fileprivate和open是Swift 3新添加的。由于过去 Swift对于访问权限的控制，不是基于类的，而是基于文件的。这样会有问题，所以Swift 3新增了两个修饰符对原来的private、public进行细分。
 
 
 private访问级别所修饰的属性或者方法只能在当前类里访问 --- 当前类里面访问
 
 fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问 -- 当前文件里面访问
 
 internal（默认访问级别，internal修饰符可写可不写）   -----------------------整个框架里都可以使用 但是对外面的框架不暴露
 internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
 如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
 如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
 
 
 public  可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。 --模块内可以被继承和override 但是其他的模块不可以被继承和重写

 
 
 
 
 类扩展（extension）
 
 1，给已有的类添加计算属性和计算静态属性 ---不能添加存储属性   不能添加属性监视器
 2，定义新的实例方法和类方法
 3，提供新的构造器
 4，定义下标脚本
 5，是一个已有的类型符合某个协议       ------就是可以继承相应的协议
 
 
 
 
协议（protocol）
 
 1  Swift中协议类似于别的语言里的接口，协议里只做方法的声明，包括方法名、返回值、参数等信息，而没有具体的方法实现
 
    //读写属性
	var name:String{get set}
	
	//只读属性
	var age:Int{get}
	
	//类型方法
	static func method1()
	
	//实例方法
	func method2() -> Int
	
	//突变方法
	mutating func method3()
 
 
 
 
 2，协议可以继承另一个协议

 Bird遵循Animal协议的写法
 
 protocol Bird:Animal{
 }
 
 协议B 继承 协议A 有遵循协议 c d e 写法如下
 
 B:A,c,d,....{
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */
