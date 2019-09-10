import UIKit

// if else else if语句

var population:Int = 5422

var message:String

if population < 1000 {
    message = "\(population) is a small town"
}else if population >= 1000 && population <= 5000{
    message = "\(population) is mid big"
}else{
    message = "\(population) is pretty big"
}

print(message)

//比较运算符的介绍
/*
 < <= > >= == !=
 === 计算两个实例是否指向同一个引用
 !== 计算两个实例是否 不 指向同一个引用
 */

//逻辑运算符
/*
 &&
 ||
 !
 */

//三目运算符
// a?b:c
//?? 运算符
//a??b a不等于nil 的话 那么返回值是a  如果a是nil 那么就取b的值



