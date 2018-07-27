//: Playground - noun: a place where people can play

import UIKit

//================  Array 的创建   ====================
var array1 :Array<Int> = Array<Int>()  //type annotation

var array2 : [Int] = []

var array3 = array2

var threeInts = [Int](repeating: 3, count: 0)

var sixInts = threeInts + threeInts

var fiveInts = [1,2,3,4,5,6]

//获取个数
fiveInts.count
//判定是不是空数组
if array2.isEmpty {
    
}

//不推荐 下标的写法 因为不安全  这个并没有生成新的数组
fiveInts[0..<2]//使用range operator得到的，并不是一个Array，而是一个ArraySlice。什么是ArraySlice呢？简单来说，就是Array某一段内容的view，它不真正保存数组的内容，只保存这个view         引用     的数组的范围


//通过这个view创建新的Array对象：
Array(fiveInts[0...2]) // [1, 2, 3]
//这样，就得到了一个值是[1, 2, 3]的Array对象。

//遍历
//1
for value in fiveInts {
    print("\(value)")
}
//2  enumerated()方法，它会返回一个Sequence对象
for (index, value) in fiveInts.enumerated() {
    print("\(index): \(value)")
}

//3 forEach 的方法
fiveInts.forEach { print($0) }


//==========添加 删除元素==========

array1.append(1)     // [1]
array1 += [2, 3, 4]  // [1, 2, 3, 4]
array1.insert(5, at: array1.endIndex)

//你必须自行保证使用的at参数不超过数组的合法范围
array1.remove(at: 4) // [1, 2, 3, 4]
array1.removeLast()//你同样要对removeLast()的应用安全负责  当你删除一个空数组中最后一个元素的时候，会直接引发运行时错误


//==========理解Array和NSArray的差异==========

//===按  值  语义实现的Array
//Array是按照值语义实现的，当我们复制一个Array对象时，会拷贝整个Array的内容：
var a = [1, 2, 3] // [1, 2, 3]
let copyA = a     // [1, 2, 3]

//a.append(4)
// a  [1, 2, 3, 4]
// copyA [1, 2, 3]
// copyA.append(4)   // Compile error

//说明 1、Swift数组是否可以被修改完全是通过var和let关键字来决定的
//    2、它使用了copy on write的方式。即如果你仅仅复制了Array而不对它修改时，真正的复制是不会发生的，两个数组仍旧引用同一个内存地址。只有当你修改了其中一个Array的内容时，才会真正让两个Array对象分开

func getBufferAddress<T>(of array: [T]) -> String {
    return array.withUnsafeBufferPointer({ (buffer)  in
        return String(describing: buffer.baseAddress)
    })
}

getBufferAddress(of: a)

getBufferAddress(of: copyA)

a.append(4)

getBufferAddress(of: a)

getBufferAddress(of: copyA)

//===按  引用  语义实现的NSArray

let b = NSMutableArray(array: [1, 2, 3])
let copyB: NSArray = b
let deepCopyB = b.copy() as! NSArray

b.insert(0, at: 0) // [0, 1, 2, 3]
copyB              // [0, 1, 2, 3]
deepCopyB          // [1, 2, 3]

//======说明 下 当我们使用NSArray和NSMutableArray时，Swift中的var和let关键字就和数组是  否可以被修改   没关系了。它们只控制对应的变量 是否可以  被赋值 成新的NSArray或NSMutableArray对象。



//==========用Swift的方式使用Array==========
//#waring  绝大多数时候，其实你不需要[]

//对于array[index]这样的访问，甚至都没有使用optional来保护越界的情况
let aaaa = [1, 2, 3]
type(of: aaaa[1]) // Int.type   ------ a[1]的类型是Int，而不是Optional<Int>

aaaa.first // 1
aaaa.last  // 3
type(of: aaaa.first) // Optional<Int>.Type  是Optional  的返回值  比较安全

//removeLast，你需要自行确保数组中有元素，否则会引发运行时错误；
//popLast，如果数组为空，会返回nil；

//==========通过closure参数化对数组元素的变形操作==========

//比较low 的方式
var fibonacci  = [0,1,1,2,3,5]

var squares = [Int]()

for value in fibonacci {
    squares.append(value*value)
}

//当需要是常量的时候就没办法完全胜任了

let squares_2 = fibonacci.map{ $0*$0 }
//自己实现自己的map  给Array  实现了自己的扩展
extension Array {
    
    func myMap<T>(_ transform:(Element) -> T) -> [T] {
        var tmp : [T] = []
        tmp.reserveCapacity(count)//y给新数组预留了空间之外
        for value in self {
            tmp.append(transform(value))
        }
        return tmp;
    }
    
}


let constSequence1 = fibonacci.myMap { $0 * $0 }
//=======参数化数组元素的执行动作
//用closure来参数化对数组的操作行为的含义-------myMap的实现，就会发现它最大的意义，就是保留了遍历Array的过程，而把要执行的动作留给了myMap的调用者通过参数去定制。而这，就是我们一开始提到的用closure来参数化对数组的操作行为的含义
//相关的函数  min max  .filter

//比较
// false
//fibonacci.elementsEqual([0, 1, 1], by: { $0 == $1 })
// true
//fibonacci.starts(with: [0, 1, 1], by: { $0 == $1 })

//遍历   fibonacci.forEach { print($0) }  //forEach并不处理closure参数的返回值
//排序

fibonacci.sorted()//默认采用升序排列
// [5, 3, 2, 1, 1, 0]
fibonacci.sorted(by: >)//by自定义排序规则


//而partition(by:)则会先对传递给它的数组进行重排，然后根据指定的条件在重排的结果中返回一个分界点位置。这个分界点分开的两部分中，前半部分的元素都不满足指定条件；后半部分都满足指定条件
let pivot = fibonacci.partition(by: { $0 < 1 })
fibonacci[0 ..< pivot] // [5, 1，1，2, 3]
fibonacci[pivot ..< fibonacci.endIndex] // [0]

//合并  fibonacci.reduce(0, +) // 12  //需要指定的，是合并前的初始值，以及“合并”的规则


//这些API，开始让我们的代码从面向机器的，转变成面向业务需求的


//==========区分修改外部变量和保存内部状态 ==========

//带有closure参数的Array方法时，一个不好的做法就是通过closure去修改外部变量

var sum = 0
let constSquares2 = fibonacci.map { (fib: Int) -> Int in
    sum += fib
    return fib * fib
}
//map的执行产生了一个副作用，就是对fibonacci中所有的元素求和。这不是一个好的方法，我们应该避免这样。你应该单独使用reduce来完成这个操作
//如果一定要在closure参数里修改外部变量，哪怕用forEach也是比map更好的方案


//但是，在函数实现内部，专门用一个外部变量来保存closure参数的执行状态，则是一个常用的实现技法--------------------这个不太懂

extension Array {
    func accumulate<T>(_ initial: T,
                       _ nextSum: (T, Element) -> T) -> [T] {
        var sum = initial
        
        return map { next in
            sum = nextSum(sum, next)
            return sum
        }
    }
}

enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

let defaultRecord:[String:RecordType] = [
    "uid": .number(0),
    "exp": .number(100),
    "favourite": .bool(false),
    "title": .text("")
]

var template = defaultRecord
let recordPatch: [String:RecordType] = [
    "uid": .number(11),
    "title": .text("Common dictionary extensions")
]

//extension Dictionary {
//    mutating func merge<S:Sequence>(_ sequence:S)
//}






