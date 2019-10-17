import Foundation

public struct Stack<Element>{
    private var storage:[Element] = []
    public init() {}
    
    public init(_ elements: [Element]) {
      storage = elements
    }
    public mutating func push(_ element:Element){
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    //peek 偷偷的看一下
    public func peek() -> Element? {
     return storage.last
    }
    
    public var isEmpty: Bool {
      return peek() == nil
    }
}

extension Stack:CustomStringConvertible {
    public var description:String {
        let topDivider = "----Top----\n"
        let bottomDivider = "\n--------"
        let stackElements = storage.map{"\($0)"}.reversed().joined(separator:"\n")
        return topDivider + stackElements + bottomDivider
    }
}

//让stack 支持 数组字面量语法
extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}

extension Stack: Sequence {
  public func makeIterator() -> AnyIterator<Element> {
    var curr = self
    return AnyIterator {
      return curr.pop()
    }
  }
}
