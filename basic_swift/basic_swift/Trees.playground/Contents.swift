//: Playground - noun: a place where people can play

/*
 关于where 的使用
 
 //http://www.yiibai.com/swift/where_clauses.html
 
 //两个容器可以被检查出是否是相同类型的容器
 
 func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
 (someContainer: C1, anotherContainer: C2) -> Bool {
 
 // check that both containers contain the same number of items
 if someContainer.count != anotherContainer.count {
 return false
 }
 
 // check each pair of items to see if they are equivalent
 for i in 0..someContainer.count {
 if someContainer[i] != anotherContainer[i] {
 return false
 }
 }
 
 // all items match, so return true
 return true
 
 }
 
 两个参数 ：someContainer和anotherContainer someContainer参数是类型C1，anotherContainer参数是类型C2
 
 C1必须遵循Container协议 (写作 C1: Container)。
 C2必须遵循Container协议 (写作 C2: Container)。
 C1的ItemType同样是C2的ItemType(写作 C1.ItemType == C2.ItemType)。
 C1的ItemType必须遵循Equatable协议 (写作 C1.ItemType: Equatable)。
 
 第三个和第四个要求被定义为一个where语句的一部分，写在关键字where后面，作为函数类型参数链的一部分

 */

import Cocoa

public class TreeNode<T>{
    public var value:T
    public weak var parent:TreeNode?
    public var children = [TreeNode<T>]()
    public init(nodeValue:T){
        self.value = nodeValue
    }
    
    public func addChild(_ node:TreeNode<T>){
        children.append(node)
        node.parent = self
    }
}

extension TreeNode:CustomStringConvertible{
    public var description:String{
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map
            { $0.description }.joined(separator: ",") + "}"
        }
        return s
    }
}


let tree = TreeNode<String>(nodeValue: "beverages")

let hotNode = TreeNode<String>(nodeValue: "hot")
let coldNode = TreeNode<String>(nodeValue: "cold")

let teaNode = TreeNode<String>(nodeValue: "tea")
let coffeeNode = TreeNode<String>(nodeValue: "coffee")
let chocolateNode = TreeNode<String>(nodeValue: "cocoa")

let blackTeaNode = TreeNode<String>(nodeValue: "black")
let greenTeaNode = TreeNode<String>(nodeValue: "green")
let chaiTeaNode = TreeNode<String>(nodeValue: "chai")

let sodaNode = TreeNode<String>(nodeValue: "soda")
let milkNode = TreeNode<String>(nodeValue: "milk")

let gingerAleNode = TreeNode<String>(nodeValue: "ginger ale")
let bitterLemonNode = TreeNode<String>(nodeValue: "bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)



extension TreeNode where T:Equatable{
    
    func search(_ value:T) -> TreeNode? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        
        return nil
    }
    
}


tree.search("cocoa")    // 返回 "cocoa" 节点
tree.search("chai")     // 返回 "chai" 节点
tree.search("bubbly")   //返回 nil



//二叉树    二叉树来表示算术运算操作(5 * (a - 10)) + (-4 * (3 / b))



//二叉树的表示
//枚举资料 ：http://www.jianshu.com/p/11f5b818cbfe
public indirect enum BinaryTree<T>{
    
    case node(BinaryTree<T>,T,BinaryTree<T>)
    case empty
    
}

//从叶子 到 根  即是从下到上创建

// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let binaryTree = BinaryTree.node(timesLeft, "+", timesRight)



//添加 description 方法

extension BinaryTree:CustomStringConvertible {
    
    public var description:String{
        
        switch self {
        case let .node(left,value,right):
            return "value: \(value),left = [-- \(left.description) --],right = [-- \(right.description) --]"
        case .empty:
            return ""
        }
        
    }
    
}

print(binaryTree)

//添加 计算节点数的拓展

extension BinaryTree{
    
    
    public var count:Int{
        switch self {
        case let .node(left,_,right):
           return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    
    
    
    
    //二叉树的遍历方式 遍历方式是根据 N而言
    //1 中序遍历 访问根节点的操作发生在遍历其左右子书之间 先左节点 再本身节点 最后 右边节点 LNR
    
    public func traverseInOrder(process: (T) -> Void){
        if case let .node(left,value,right) = self {
            left.traverseInOrder(process: process)
            
            process(value)
            
            right.traverseInOrder(process: process)
            
        }
    }
    
    
    //2 先序遍历 访问根节点的操作发生在遍历其左右子书之前 NLR
    
    public func traversePreOrder(process:(T) -> Void){
        
        if case let .node(left,value,right) = self {
            
            process(value)
            
            left.traverseInOrder(process: process)
            
            right.traverseInOrder(process: process)
        }
        
    }
    
    //3 后序遍历 访问根节点的操作发生在遍历其左右子树之后 LRN
    
    public func traverseTailOrder(process:(T) -> Void){
        if case let .node(left,value,right) = self {
            
            left.traverseInOrder(process: process)
            
            right.traverseInOrder(process: process)
            
            process(value)
        }
    }
    
}



binaryTree.count


//这个涉及到 闭包的使用  http://c.biancheng.net/cpp/html/2285.html

print("----------中序遍历------------------\n")

binaryTree.traverseInOrder { (value) in
    print(value)
}



print("----------先序遍历------------------\n")

binaryTree.traversePreOrder { (value) in
    print(value)
}



print("----------后序遍历------------------\n")

binaryTree.traverseTailOrder { print($0) }




