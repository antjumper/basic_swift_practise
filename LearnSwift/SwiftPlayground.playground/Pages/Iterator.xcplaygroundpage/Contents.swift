import UIKit
//顺序访问一个数据
let numbers = [1, 2, 3, 4, 5]

for number in numbers {
    print(number)
}

//但是 如果我们要访问的是 Dictionary(Map) 或者 Set 呢

// 那么我就要抛开容器本身 依然能够依序遍历集合中的每一个元素

//比如我们把依序遍历集合中的元素的行为抽象成一个协议 叫MySequence
// 顺序访问集合元素的行为抽象成一个方法 叫makeIterator
// 方法返回一个MyIterator 的类型对象 依次访问集合类型中的每一个元素

//protocol MySequence {
//    associatedtype MyIterator
//    func makeIterator() -> MyIterator
//}

//这样遵从了MySequence 协议的类型我们都可以 通过makeIterator 方法获取一个MyIterator类型的对象来顺序访问集合类型中的每一个元素


//可以看到MyIterator 是容器和遍历访问的桥梁  它可以顺序获取集合中的元素 那么 1 他必须知道 容器中的元素类型 2 可以取到容器中下一个元素
//注意它依然 不知道容器的具体类型 所以它也是个协议

protocol MyIteratorProtocol {
    associatedtype Element
    mutating func next() -> Element?
}
//因此MyIterator 应该是尊从MyIteratorProtocol

protocol MySequence {
    associatedtype MyIterator:MyIteratorProtocol
    func makeIterator() -> MyIterator
}

//综上所述 当顺序访问一个集合类型是 我们让集合类型尊从MySequence 同时要实现一个MyIterator 类型获取集合内部的元素 并且这个类型必须有一个方法next 获取下一个元素 当最后一个元的时候返回nil

// 然后访问 一个集合T 调用T的makeIterator 返回MyIterator 调用MyIterator的next方法 遍历每一个元素

// swift的实现
var begin = numbers.makeIterator()
while let number = begin.next() {
    print(number)
}

//我们自己实现的一遍
//先写MyIterator类
struct FiboIterator:MyIteratorProtocol {
    var state = (0,1)
    mutating func next() -> Int? {
        let value = state.0
        state = (state.1,state.0+state.1)
        return value
    }
}

struct Fibonacci:MySequence {
    func makeIterator() -> FiboIterator {
        return FiboIterator()
    }
}

let fib = Fibonacci()

var fibIter = fib.makeIterator()

var i = 1

while let value = fibIter.next(),i != 10 {
    print(value)
    i += 1
}

//var fiboIter2 = fiboIter1
//fiboIter1.next() // Optional(0)
//fiboIter1.next() // Optional(1)
//
//fiboIter2.next() // Optional(0)
//fiboIter2.next() // Optional(1)
//fiboIter2.next() // Optional(1)
//迭代器的拷贝 引用和 值拷贝  也是我们一般避免的行为

// 上诉的MyIterator 会有多个尊从MyIteratorProtocol 的类存在
// 因此我们在swift中可以通过一个AnyIterator 把MyIterator 类型屏蔽掉

struct FiboIterator_2:IteratorProtocol {
    var state = (0,1)
    mutating func next() -> Int? {
        let value = state.0
        state = (state.1,state.0+state.1)
        return value
    }
}

struct Fibonacci_2: Sequence {
    typealias Element = Int
    
    func makeIterator() -> AnyIterator<Element> {
        return AnyIterator(FiboIterator_2())
    }
}
let fibo = Fibonacci_2()

var fiboIter1 = fibo.makeIterator()
var fiboIter2 = fiboIter1
//fiboIter1.next() // Optional(0)
//fiboIter1.next() // Optional(1)
//
//fiboIter2.next() // Optional(1)
//fiboIter2.next() // Optional(2)
//fiboIter2.next() // Optional(3)

//AnyIterator还有一个功能，它可以把一个函数直接封装成Iterator，避免了定义struct的麻烦。
//AnyIterator传递一个遵从IteratorProtocol的类型之外，它还可以接受一个函数类型的参数
func fiboIterator() -> AnyIterator<Int> {
    var state = (0, 1)
    
    return AnyIterator {
        let theNext = state.0
        state = (state.1, state.0 + state.1)
        
        return theNext
    }
}

let fiboSequence = AnySequence(fiboIterator)
Array(fiboSequence.prefix(10))


//AnySequence生成序列之外，Swift 3中还新增了两个函数

//1、sequence(first:next:)方法的第一个参数表示初始值，next根据上一个生成的值，生成序列中的下一个值，直到next返回nil，生成序列的过程就结束了
let tenToOne = sequence(first: 10, next: {
    guard $0 != 1 else { return nil }
    
    return $0 - 1
})

Array(tenToOne)
// [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]


//2
let fiboSequence_2 = sequence(state: (0, 1), next: {
    (state: inout (Int, Int)) -> Int? in
    let theNext = state.0
    state = (state.1, state.0 + state.1)
    
    return theNext
})
Array(fiboSequence_2.prefix(10))
// [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

//我们再回过头看一下，其实所有的元素最终都是Iterator生成的，就算是没有Sequence，我们一样可以生成一系列内容出来，并逐个访问它们。所以，现在是时候认真考虑一下这个问题了：到底Sequence和Iterator是什么关系呢？为什么Swift没有把IteratorProtocol中的约束，直接放到Sequence中呢？

//可以理解成Iterator是一个遍历时消费自身的Sequence


//但也有一些遍历时不消费自身元素的序列
//遍历不会消耗掉它的成员，无论我们遍历多少次，结果都应该是相同的 这个就是把Sequence和Iterator类型要分开的原因
//Sequence和SubSequence
let fibo1 = Fibonacci_2().prefix(10)
let fibo2 = Fibonacci_2().prefix(10).suffix(5)

//dropFirst&dropLast，用来访问序列中除去开始或结束的n个元素后，剩余的部分；
let fibo3 = Fibonacci_2().dropFirst(10).prefix(10)
// [55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181]

let fibo4 = Fibonacci_2().prefix(10).dropLast(5)
// [0, 1, 1, 2, 3]
//split
let fiboArray = fibo1.split(whereSeparator: { $0 % 2 == 0 })
//split(whereSeparator:)返回一个Array之外，prefix / suffix / dropFirst / dropLast方法返回的，都不是Fibonacci_2。
//在Sequence里，有另外一个associatedtype，叫SubSequence，这些方法返回的类型都是SubSequence。
//在自定义的序列里，如果我们不明确指定SubSequence，编译器会把它设置为AnySequence<Iterator.Element>。
/*
 如果不是事先告诉你，你丝毫不会感受到Sequence和SubSequence在类型上的差别。
 
 既然如此，为什么我们还需要两个独立的类型表示序列呢？答案很简单，当我们需要表达子序列的时候，除了访问序列中的成员，我们还需要记录这个子序列的起始和结束位置。如果我们只是根据截取的区间从原序列生成一个新的序列，子序列表示的区间就不可变了。
 
 当然，由于SubSequence默认的类型是AnySequence<T>，它的Iterator类型，自然也就是AnyIterator<T>。当复制这个Iterator的时候，会执行引用语义，这是我们要注意的地方。
 
 如果你不希望这个行为，就得自己定义一个SubSequence类型，然后实现我们上面提到的5个方法。并在序列类型的定义里，自定义SubSequence就好了。
 */
