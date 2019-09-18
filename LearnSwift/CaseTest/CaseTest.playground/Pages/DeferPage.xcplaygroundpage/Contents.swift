
import Foundation

//defer顺序测试 : 先执行return 之后在执行的defer 里面的语句

func deferTest(n:Int) -> Int {
    var new = n;
    defer {
        new = new + 1;
        print(new)
    }
    return new;
}

var test = deferTest(n: 2);
print(test)

//non-escaping属性的closure，传递给需要escaping属性closure的函数 出现问题的修复  withoutActuallyEscaping 的使用

func increaseValue(in array:[Int],with:() -> Int){
    withoutActuallyEscaping(with) { escapedWith  in
        let increasedArray = array.lazy.map{ $0 + escapedWith()}
        print("increaseValue index-0: \(increasedArray[0])")
        print("increaseValue index-1: \(increasedArray[1])")
    }
}

increaseValue(in: [1,2]) { () -> Int in
    1
}


//Swift对@available进行了扩展，现在它不仅可以用于限定操作系统，也可以用来区分Swift版本号了。

//为了表示某个API可用的版本区间
@available(swift, introduced: 3.0, obsoleted: 3.1)
func bar() {}
//为了表示某个API从特定版本之后才可用
@available(swift 3.1)
func foo() {}


//某个特定类型的optional添加extension
//比如给Int？ 添加是否是偶数的类型
extension Optional where Wrapped == Int {//Optional<Wrapped>
    var isEven:Bool {
        guard let value = self else {
            return false
        }
        
        return value % 2 == 0
    }
}


//swift4 新特性
let s = "Hello&Mars"
var i = s.firstIndex(of: "&")!
let greeting = s[s.startIndex ..< i] // Hello

i = s.index(i, offsetBy: 1)
let name = s[i..<s.endIndex] // Mars

//..<i，对应s.prefix(upTo:)，表达从集合开始到i的半闭半开区间；
//...i，对应s.prefix(through:)，表达从集合开始到i的闭区间；
//i...，对应s.suffix(from: i)，表达从i开始到集合结束的半闭半开区间，由于集合的endIndex位置并不能读取，因此这里没有没有所谓的...和..<的差别了，而之所以选择了i...而不是i..<，仅仅是因为前者看上去更好看一些罢了，尽管，它表达的含义的确是i..<；
