import UIKit

//注意 String? 和String 不是同一种类型
//可空类型
var str: String?

print(str)

str = "404"
print(str)//Optional("404")

//解绑 ！ （forced unwrapping）
if str != nil {
    let theError = str!
    print(theError)
}

//可空类型的实例绑定

if let theError = str {
    print(theError)
}

//展开多个可空类型

var errorString:String?
errorString = "404"

if let theError = errorString,
    let errorCodeInteger = Int(theError) {
    print("\(theError):\(errorCodeInteger)")
}

//可空类型的额外检查
if let theError = errorString,
    let errorCodeInteger = Int(theError),
    errorCodeInteger == 404{
    print("\(theError):\(errorCodeInteger)")
}

//隐式可空类型
var errorCodeString: String!
errorCodeString = "404"
print(errorCodeString)

//如果隐式可空类型没有值的话就会崩溃 所以要谨慎使用
//errorCodeString = nil
//let another:String = errorCodeString

//如果隐式可空类型是 nil  那么another 的赋值会报错

//可空链式调用
//链式调用中的任意可空实例是nil  那么整个链式调用会返回nil

var errorDescription:String?
if let theError = errorCodeString,
    let errorCodeInteger = Int(theError),
    errorCodeInteger == 404{
    errorDescription = "404的描述信息"
}
var upcaseDescriptionString = errorDescription?.uppercased()

upcaseDescriptionString?.append("新的子串")

// 如果a ?? b 为空那么就返回b  否则就返回a
print(upcaseDescriptionString ?? "1111")
