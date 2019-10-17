import Foundation
//二叉搜索树的特点是 node  大于左子树  小于右子树
public struct BinarySearchTree<Element:Comparable>{
    public private(set) var root:BinaryNode<Element>?
    public init() {}
   
      
}

extension BinarySearchTree:CustomStringConvertible {
    public var description: String {
        guard let root = root else {
            return "empty tree"
        }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    
    public mutating func insert(_ value:Element){
             root = __insert(from:root,value:value)
       }
       
    private func __insert(from node:BinaryNode<Element>?,value:Element) -> BinaryNode<Element>{
        //1
        guard let node = node else {
            return BinaryNode(value: value)
        }
        //2
        if value < node.value{
            node.leftChild = __insert(from: node.leftChild, value: value)
        }else {
            node.rightChild = __insert(from: node.rightChild, value: value)
        }
        //3
        return node
    }
}

//搜索

extension BinarySearchTree {
    public func contains(_ value:Element) ->Bool {
//        guard let root = root else {
//            return false
//        }
//        var found = false
//        root.traverseInOrder {
//            if $0 == value {
//             found = true
//            }
//        }
        
        // 根据 二叉搜索树的特性来优化查找的算法
        var current = root
        while let node = current {
            
            if node.value == value {
                return true
            }
            
            if node.value > value {
                current = current?.rightChild
            }else {
                current = current?.leftChild
            }
        }
        return false
    }
}

//remove  node  是叶子节点直接移除就好  只有一个子节点  那么node父节点指向自己的子节点就好 有两个子节点的话 那么先找到node右边的的最小子节点 然后交换 删除交换后的叶子节点

extension BinaryNode {
    /*
         Returns the leftmost descendent. O(h) time.
       */
       public func minimum() -> BinaryNode<Element> {
         var node = self
         while let next = node.leftChild {
           node = next
         }
         return node
       }

       /*
         Returns the rightmost descendent. O(h) time.
       */
       public func maximum() -> BinaryNode<Element> {
         var node = self
         while let next = node.rightChild {
           node = next
         }
         return node
       }
}

extension BinarySearchTree {
    
    private func __remove(node:BinaryNode<Element>?,value:Element) -> BinaryNode<Element>? {
       guard let node = node else {
           return nil
       }
    
        if value == node.value {
            //1
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            //2
            if node.leftChild == nil {
                return node.rightChild
            }
            //3
            if node.rightChild == nil {
                return node.leftChild
            }
            //4 有两个子节点
            node.value = node.rightChild!.minimum().value
            node.rightChild = __remove(node: node.rightChild, value: node.value)
            
        }else if value < node.value {
            node.leftChild = __remove(node: node.leftChild, value: value)
        }else {
            node.rightChild = __remove(node: node.rightChild, value: value)
        }
        return node
        
    }
    
    public mutating func remove(_ value:Element) {
        root = __remove(node:root,value:value)
    }
    
   
}

//检测是否是个二叉搜索树
extension BinarySearchTree {
    
   static public func isBinarySearchTree(_ node:BinaryNode<Element>?) -> Bool {
        let current = node
        guard  current != nil else{
            return true
        }
        
        let left = current!.leftChild
        let right = current!.rightChild
        
        if left != nil && current!.value < left!.value{
           return false
        }
        
        if right != nil && current!.value > right!.value{
            return false
        }
        
        if !isBinarySearchTree(left) || !isBinarySearchTree(right) {
            return false
        }
        
        return true
        
        
    }
}
