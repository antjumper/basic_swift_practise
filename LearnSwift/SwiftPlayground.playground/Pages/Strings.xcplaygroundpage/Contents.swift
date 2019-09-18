import UIKit

let str = "Hello, playground"
var mutablePlayground = "hello mutable string"
//给字符串添加内容
mutablePlayground += "!"

//字符串中的character
for c: Character in mutablePlayground {
    print("\(c)")
}
//Unicode 标量    \u{}表示Unicode标量

let onCoolDude = "\u{1F60E}"

//使用组合标量

//swift 中的每个字符都是 扩展字形簇（extended grapheme cluster） 由一个或多个Unicode组成
let aAcute = "\u{0061}\u{0301}"

//swift中可以利用 unicodeScalars 属性看到字符串实例中的所有Unicode标量

for scalar in aAcute.unicodeScalars {
    //    print("\(scalar.value)")
    print("\(scalar)")
    
}

//预组合字符串

let aAcutePrecomposed = "\u{00E1}"

//检查等价性
let b = (aAcute == aAcutePrecomposed)//true

// 为什么相等呢？
//swift 的标准等价性
// 标准等价性是指两个Unicode标量序列在语言学层面是否相等 对于两个字符或者两个字符串如果他们具有相同的语言学含义和外观 那么无论是否用相等的Unicode标量创建，都认为是两者相等

print("aAcutePrecomposed 的count = \(aAcutePrecomposed.count)")

//为什么是1？
//count 是字符中的字符的个数 á是被当成单个字符的

//索引和区间
//不能这么访问了 报错
// swift 编译器不准许用下标索引访问字符中的特定字符
//这个限制与Swift字符串和字符的存储方式有关系 不能用整数作为索引访问字符串，因为Swift 无法在不遍历前面每个字符的情况下知道指定的索引对应于哪个Unicode标量 这个操作是很耗时的 因此swift强迫你指定这个操作
//let index = mutablePlayground[1]

//String 特定索引的 Character
//使用 startIndex 属性可以获取一个 String 的第一个 Character 的索引。使用 endIndex 属性可以获取最后一个 Character 的后一个位置的索引。因此，endIndex 属性不能作为一个字符串的有效下标。如果 String 是空串，startIndex 和 endIndex 是相等的。

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index1 = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index1]
// a

//使用 indices 属性会创建一个包含全部索引的范围（Range），用来在一个字符串中访问单个字符。

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// 打印输出“G u t e n   T a g ! ”

//insert
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome 变量现在等于 "hello!"

welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
// welcome 变量现在等于 "hello there!"

//remove
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome 现在等于 "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome 现在等于 "hello"

//substring
let greeting1 = "Hello, world!"
let index = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index]
// beginning 的值为 "Hello"

// 把结果转化为 String 以便长期存储。
//这个是很神奇的东西
/*
 就像 String，每一个 SubString 都会在内存里保存字符集。而 String 和 SubString 的区别在于性能优化上，SubString 可以重用原 String 的内存空间，或者另一个 SubString 的内存空间（String 也有同样的优化，但如果两个 String 共享内存的话，它们就会相等）。这一优化意味着你在修改 String 和 SubString 之前都不需要消耗性能去复制内存。就像前面说的那样，SubString 不适合长期存储 —— 因为它重用了原 String 的内存空间，原 String 的内存空间必须保留直到它的 SubString 不再被使用为止。
 上面的例子，greeting 是一个 String，意味着它在内存里有一片空间保存字符集。而由于 beginning 是 greeting 的 SubString，它重用了 greeting 的内存空间。相反，newString 是一个 String —— 它是使用 SubString 创建的，拥有一片自己的内存空间。
 */
let newString = String(beginning)
