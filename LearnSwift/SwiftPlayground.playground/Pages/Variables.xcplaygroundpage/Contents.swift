import UIKit

//变量和常量 var 表示一个可以改变的变量 let 表示初始化之后不能改变的常量
var astring :String = "一个字符串变量"
let bstring:String = "一个字符串常量"
//不同类型的变量 或者常量  冒号后边指定了类型 目前是Int 可以是各种类型 double float bool struct class enum

var aInt:Int = 0
let bInt:Int = 1

//类型推断
//swift 会根据当前变量或者常量的值推断出 当前变量或者常量的类型 因此类型是可以省略的
var c = 2

//######## 字符串插值 "\(name)....."
let name = "myname"

let fullName = "\(name) 把name以字符串插值的形式连接进来"
print(fullName)

