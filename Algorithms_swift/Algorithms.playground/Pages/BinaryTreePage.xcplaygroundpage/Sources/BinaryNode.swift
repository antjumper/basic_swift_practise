import Foundation

public class BinaryNode<Element> {
    public var value:Element
    public var leftChild:BinaryNode?
    public var rightChild:BinaryNode?
    
    public init(value:Element){
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {

  public var description: String {
    return diagram(for: self)
  }
  
    /*
     ┌──nil
    ┌──9
    │ └──8
    7
    │ ┌──5
    └──1
     └──0
    */
  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
         + root + "\(node.value)\n"
         + diagram(for: node.leftChild,
                   bottom + "│ ", bottom + "└──", bottom + " ")
  }
}

//中序遍历In-order traversal   前序遍历pre-order   后续遍历post-order  前中后 是相对于节点而言的

extension BinaryNode {
    //中序遍历
    public func traverseInOrder(visit:(Element) -> Void){
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    //前序遍历
    public func traversePreOrder(visit: (Element) -> Void) {
      visit(value)
      leftChild?.traversePreOrder(visit: visit)
      rightChild?.traversePreOrder(visit: visit)
    }
    
    //后续遍历
    public func traversePostOrder(visit: (Element) -> Void) {
      leftChild?.traversePostOrder(visit: visit)
      rightChild?.traversePostOrder(visit: visit)
      visit(value)
    }
}

//二叉树 高度

extension BinaryNode {
   public func deepthOfTreeUsedQueue(root:BinaryNode<Element>?) -> Int {
        if root == nil {
            return 0
        }
        
        var depth:Int = 0
        var queue = Queue<BinaryNode>()
        queue.enqueue(root!)
        
        while !queue.isEmpty {
            depth += 1 //每次数了之后往里面放一层
            
            var numberOfLevel = queue.count
            
            while numberOfLevel > 0 {
                let node = queue.dequeue()

                if node!.leftChild != nil {
                    queue.enqueue(node!.leftChild!)
                }
                if node!.rightChild != nil {
                   queue.enqueue(node!.rightChild!)
                }
                numberOfLevel -= 1
            }
            
        }
        return depth
  
    }
    
    //用递归探知深度
    public func deepthOfTreeUsedRecursion(root:BinaryNode<Element>?) -> Int {
        if root == nil {
            return 0
        }
        let maxDepth = max(deepthOfTreeUsedRecursion(root: root!.leftChild) + 1, deepthOfTreeUsedRecursion(root: root!.rightChild) + 1)
        
        return maxDepth
    }
}



