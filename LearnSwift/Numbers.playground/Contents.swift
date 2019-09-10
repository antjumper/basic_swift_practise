import UIKit

//整数
//Int的最大值和最小值
print("the maxinum Int value is \(Int.max)")
print("the mininum Int value is \(Int.min)")
//Int32的最大值和最小值
print("the maxinum value for a 32-bit integer is \(Int32.max)")
print("the mininum value for a 32-bit integer is \(Int32.min)")
//无符号整数的最大和最小值 有符号形需要把一半的可能值留给负数用
print("the maxinum UInt value is \(UInt.max)")
print("the mininum UInt value is \(UInt.min)")
print("the maxinum value for a 32-bit unsigned integer is \(UInt32.max)")
print("the mininum value for a 32-bit unsigned integer is \(UInt32.min)")

//隐式声明 Int

let numberInt = 3
type(of: numberInt)

//转换整数类型
//类型不同事不能相加的 有些语言会进行自动类型转换但是 swift不会 需要自己转换
let a:Int16 = 200
let b:Int8 = 50
//let c = a+b

let c = a + Int16(b)


//浮点数
//32 的浮点数 Float  64位的浮点数 Double
let d1 = 1.1
type(of: d1)

let d2:Double = 1.1
let f1:Float = 100.3

//浮点数的比较是 不能直接用大于小于的 是要 大于小于一个绝对值
//这种写法是错误的
if d2 != 1.1 {
    print("d2 是不等于 1.1")
}

if d2 - 1.1 < 0.000001 {
    print("d2 是等于 1.1")
}



