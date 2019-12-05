//: Playground - noun: a place where people can play

import UIKit
8.truncatingRemainder(dividingBy: 2.5)
//**********************第一章：******************************
//==================第一节：变量和常量=============================
//编译器自己推导变量的类型就叫做    在Swift里叫做Type Inference
var str = "Hello, playground"
//告诉编译器具体的类型的时候叫做 Type annotation
var x:Int

//定义一个不可变的变量用let

let letString:String = "letString"


//==================第二节：整数和浮点数=============================

//整数 - Int & UInt

let x0Int:Int = 0

let x1Uint:UInt = 1
//type(of:)查看一个变量的类型

type(of: x0Int)

//我们可以把不同类型数字的 字面值  直接进行运算：PI = 3 + 0.14
//我们不能把不同数字类型的 变量   直接进行算数运算:PI = three + zeroPointForteen
//类型的转换 Double(three)

//==================第三节：使用Tuple打包数据=============================

//tuple 的定义  //tuple 变量的获取

//(value1, value2, value3...)
let success = (200, "HTTP OK")

success.0
success.1

//(name1: value1, name2: value2, name3: value3...)  Tuple中的每一个数据成员指定一个名字
let me = (name: "Mars", no: 11, email: "11@boxue.io")

//tuple 的type annotation
var redirect: (Int, String) = (302, "temporary redirect")

me.name
me.no
me.email


//我们在定义Tuple的时候，还可以把一个Tuple的值，一一对应的拆分到不同的变量上，这叫做Tuple Decomposition

var (successCode, successMessage) = success

print(successCode) // 200
print(successMessage) // HTTP OK

//-------说明的是，我们这里是使用success的值，构建了一个新的Tuple，因此修改succeCode或successMessage的值，不会影响到原来的success。



//如果我们只是想对应到Tuple中特定的成员，而忽略其它成员，我们可以使用下划线'_'来代表那些不需要被对应的成员。例如：
let (_, successMessage2) = success
print(successMessage2)

//tuple 的比较  Tuple comparison

//只有元素个数相同的Tuple变量之间，才能进行比较

//--说明 我们只可以对最多包含6个元素的Tuple变量进行比较，超过这个数量，Swift会报错

let tuple11 = (1, 1)
let tuple12 = (1, 2)

tuple11 < tuple12 // true

//==================第四节：快速过一遍常用操作符=============================
/*
 赋值操作符  =
 
 基本算术运算操作符  + - * / %
 
 “Swift 3不再允许浮点数取模  如果要对浮点数取模，只能这样： 8.truncatingRemainder(dividingBy: 2.5)。”
 
 复合运算操作符 和以前一样 += 等等的
 
 
 比较操作符  > < == !=  >=  <= 除了这些还有一个比较特别的是Swift还支持两个用于比较对象引用的操作符：Identity operator  === !==
 
 三元操作符  和以前一样  isEqual ? "Yes" : "No"
 
 
 特有的操作符:Nil Coalescing Operator   用来处理和Optional有关的判断：
 
 // opt != nil ? opt! : b
 
 var userInput: String? = "A user input"
 let value = userInput ?? "A default input"  --说明下 当其不为nil时，就使用optional变量自身的值，否则，就使用??后面的“默认值”
 */
//也是特有的操作符  比如区间运算符   [begin, end)的半开半闭区间：begin ..< end：

//逻辑运算符  !  &&  ||



//==================第五节：忘记旧有的"C风格"字符串吧=============================  这个是 UTC 基础的讲解 对 理解 string的底层实现很有帮助
//这个章节 保存在了印象笔记里面了
//==================第六节：String和NSString处理Unicode时的差异=============================
//除了code unit的长度可变之外，在这一节，我们将看到unicode另外一个可变的特性，即组成同一个字符的code unit组合也是可变的
//而区分String和NSString的一个重要方式，就是它们对unicode的这个特性的处理方式，是不同的


//==================第六节：基于unicode的字符串常用操作=============================
//=========================== 字符串练习 ===========================

var mixString :String = "Swift很有趣"
//遍历
//        for (index,value) in mixStr.enumerated() {
//            print("\(index): \(value)")
//        }

//插入
//        if let index = mixStr.index(of: "很") {
//            mixStr.insert(contentsOf: "3.0", at: index)
//            print(mixStr)
//        }

//Range的查找和替换
if let cnIndex = mixString.firstIndex(of: "很") {
    mixString.replaceSubrange(cnIndex ..< mixString.endIndex, with: " is intersting")
    print(mixString)
}

//字符串切片
let swiftView = mixString.suffix(12).dropLast();
print(String(swiftView))


let strViews = mixString.split(separator: " ")
strViews.map(String.init)
// ["Swift", "3.0", "is", "interesting!"]





