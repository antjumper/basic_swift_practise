import Foundation

public struct LinkList<Value> {
    public var head:Node<Value>?
    public var tail:Node<Value>?
    
    public init() {}
    
    public var isEmpty:Bool {
        return head == nil
    }
    
    
    //push 操作 在头部插入
    public mutating func push(_ value:Value){
        
        //COW
        copyNodes()
        
        let newNode = Node(value: value, next: head)
        head = newNode
//        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    
    //append  在尾部插入
    public mutating func append(_ value:Value){
        
        //1
        guard !isEmpty  else {
            push(value)
            return
        }
        copyNodes()

        //2
        let node = Node(value: value)
        tail!.next = node
        //3
        tail = tail!.next
    }
    
    
    //insert  在某个index后面插入
    
    //---查找某个节点
    public func node(at index:Int) -> Node<Value>? {
        //初始化
        var currentIndex = 0
        var currentNode = head
        //查找
        while  currentNode != nil && currentIndex < index  {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(after node:Node<Value>,value:Value) -> Node<Value>{
        
        copyNodes()

        guard tail !== node else {
            //不是尾部的话
            append(value)
            return tail!
        }
        
        //是尾部的话 
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    
    //pragma mark =============== remove ===============
    
    @discardableResult
    public mutating func pop() -> Value? {
        
        copyNodes()

        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        
        copyNodes()

        // 1 没有值
        guard let head = head else{
            return nil
        }
        
        //只有一个值
        guard head.next != nil else {
            return pop()
        }
        
        //正常处理 前后node 保存前一个node 和 当前的node
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev

        return current.value
    }
    
    
    @discardableResult
    public mutating func remove(after node:Node<Value>) -> Value? {
        
        copyNodes()

        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    private mutating func copyNodes() {
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        while let nextOldNode = oldNode.next  {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
}

extension LinkList:CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "空链表"
        }
        return String(describing: head)
    }
    
}
//pragma mark =============== 遵循Collection协议 ===============

extension LinkList:Collection {
   
   public struct Index: Comparable {

      public var node: Node<Value>?
      
      static public func ==(lhs: Index, rhs: Index) -> Bool {
        switch (lhs.node, rhs.node) {
        case let (left?, right?):
          return left.next === right.next
        case (nil, nil):
          return true
        default:
          return false
        }
      }
      
      static public func <(lhs: Index, rhs: Index) -> Bool {
        guard lhs != rhs else {
          return false
        }
        let nodes = sequence(first: lhs.node) { $0?.next }
        return nodes.contains { $0 === rhs.node }
      }
    }
    
     // 1
       public var startIndex: Index {
         return Index(node: head)
       }
       // 2
       public var endIndex: Index {
         return Index(node: tail?.next)
       }
       // 3
       public func index(after i: Index) -> Index {
         return Index(node: i.node?.next)
       }
       // 4
       public subscript(position: Index) -> Value {
         return position.node!.value
       }
       
       
    
}
