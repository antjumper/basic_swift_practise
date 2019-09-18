import UIKit


//=============================  函数 ======================
//一个简单的函数

func sampleFucn () {
    print("sampleFucn")
}

// 带参数函数  外部名字 _

func paramFunc (outerName interName:Int) {
    print("paramFunc\(interName)")
    
}

//默认值函数

func defauleValueFucn (outerName1 interName1:Int,outerName2 interName2:Int = 0){
    print("paramFunc,interName1 = \(interName1),outerName2 = \(interName2)")
    
}

//可变参数
func paramChangeableFunc (changeableParam numbers:Int ... ) {
    
}

//   默认参数在内部不能修改  使用inout 使其可修改

func inoutParamFucn (number:inout Int) {
    number = 2
    
    print("inoutParamFucn,\(number)")
}
var  v = 1
inoutParamFucn(number: &v)

//返回
func returnFucn(number:Int) -> Int {
    print("returnFucn,\(number)")
    
    return 0
}

//函数当参数

func funcBeParam (a:Int , b:Int,function:(Int,Int) -> Int) -> Int {
    
    let value = function(a,b)
    
    print("funcBeParam, result =\(value)")
    
    return value
}

funcBeParam(a: 1, b: 2, function: +)

//函数当做返回值

func funcBeReturn (_ a:Int) -> (Int)->(Int) {
    func addNumberFunc(b:Int) -> Int {
        return a+b
    }
    
    return addNumberFunc
}

let returnFunc = funcBeReturn(1)

//var lastValue = returnFunc(2)

var lastValue = funcBeReturn(1)(2)

print("lastValue = \(lastValue)")


//clouse expression   : 函数的一种简写形式

//函数
func square(a:Int) -> Int {
    return a*a
}

let squareCloseExpression = { (n:Int) -> Int in
    return n*n
}

squareCloseExpression(2)

let numbers = [1, 2, 3, 4, 5]

//当做函数参数也没有问题
let nowNumber = numbers.map(squareCloseExpression)

//闭包表达式 是可以不断被简化的
let  n2 =  numbers.map({
    (n:Int) -> Int  in
    return n + n
})

//let n3 = numbers.map({<#T##transform: (Int) throws -> T##(Int) throws -> T#>})

let n3 = numbers.map({
    n in return n+n
})

//只有一条语句的话 会吧整个语句作为返回值 可以省略 return
let n4 = numbers.map({
    n in  n+n
})

//closure expression  有内置 参数 $0 $1 ...
let n5 = numbers.map({
    $0 + $0
})

//如果只有一个函数类型的参数  （） 就可以圣罗了

let n6 = numbers.map{$0 * $0}

//忽略参数 的话
let n7 = (0...9).map { _ in arc4random() }
print(n7)

//clouse  是 捕获变量 的函数
func makeCounter() -> () -> Int {
    var value = 0
    return {
        value += 1
        return value
    }
}

let counter1 = makeCounter()
let counter2 = makeCounter()

(0...2).forEach { _ in print(counter1()) } // 1 2 3
(0...5).forEach { _ in print(counter2()) } // 1 2 3 4 5 6

//函数 如果捕获变量的话 同样是一个 clouse

func makerCounter2 () -> (() -> Int) {
    
    var value = 0
    func increment () -> Int {
        value += 1
        return value
    }
    return increment
}

(0...2).forEach { _ in print(makerCounter2()) }

//通过Local function捕获变量共享资源

extension Array where Element:Comparable {
    
    mutating func mergeSort (_ begin:Index,_ end:Index) {
        if(end - begin) > 1 {
            let mid  = (begin + end) / 2;
            mergeSort(begin ,mid)
            mergeSort(mid,end)
            
            merge(begin,mid,end)
        }
    }
    
}

extension Array where Element:Comparable {
    
    private mutating func merge (_ begin:Index,_ mid:Index,_ end:Index) {
        
        // 结果
        var tmp:[Element] = []
        
        //去除最小的一个
        var i = begin
        
        var j = mid
        
        while i != mid  && j != end {
            if self[i] < self[j] {
                tmp.append(self[i])
                i+=1
            }else {
                tmp.append(self[j])
                j+=1
            }
        }
        //添加剩余部分
        tmp.append(contentsOf:self[i ..< mid])
        tmp.append(contentsOf:self[j ..< end])
        //更新自己
        replaceSubrange(begin..<end, with: tmp)
        
    }
    
}

var numbers22 = [1, 2, 6, 9, 8]
numbers22.mergeSort(numbers.startIndex, numbers.endIndex)
print(numbers22)

// 逃逸
typealias SortDescriptor<T> = (T, T) -> Bool

func makeDescriptor<Key, Value>(
    key: @escaping (Key) -> Value,
    _ isAscending: @escaping (Value, Value) -> Bool
    ) -> SortDescriptor<Key> {
    
    return { isAscending(key($0), key($1)) }
}

//  delegate  class  struct  和 循环引用
//正常的delegate
//protocol FinishAltertViewDelegate:class {
//
//    func buttonPressed(at index:Int) -> (Void)
//}
//
//class FinishAlterView {
//    var buttons:[String] = [ "Cancel", "The next" ]
//    weak var delegate:FinishAltertViewDelegate?
//    func goToTheNext() {
//        delegate?.buttonPressed(at: 1)
//    }
//}

//clouse 方式  class  + struct 实现callback

class FinishAlertView {
    var buttons: [String] = [ "Cancel", "The next" ]
    var buttonPressed: ((Int) -> Void)?
    
    func goToTheNext() {
        buttonPressed?(1)
    }
}

struct PressCounter {
    var count = 0
    
    mutating func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

let fav = FinishAlertView()
var counter = PressCounter()

//fav.buttonPressed = counter.buttonPressed //报错了 Partial application of mutating method is not allowed

//fav 不明白是  捕获counter 还是copy counter
//clouse  具有捕获能力 表意明显
//fav.buttonPressed = { counter.buttonPressed(at: $0) }

//最直接的方式
//fav.buttonPressed = { _ in print("OK, go to the next episode") }

//clouse 方式  class  + class 实现callback

class ClassPressCounter {
    var count = 0
    
    func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

var classCounter = ClassPressCounter()

fav.buttonPressed = classCounter.buttonPressed
//为了 防止 循环引用  使用capture  List  表明是 弱引用的捕获  capture list，限定了fav对classCounter是一个弱引用

fav.buttonPressed = { [weak classCounter] index in
    classCounter?.buttonPressed(at: index)
}

