
import Foundation

var tree:BinaryNode<Int> = {
      let zero = BinaryNode(value: 0)
      let one = BinaryNode(value: 1)
      let five = BinaryNode(value: 5)
      let seven = BinaryNode(value: 7)
      let eight = BinaryNode(value: 8)
      let nine = BinaryNode(value: 9)
    
      seven.leftChild = one
      one.leftChild = zero
      one.rightChild = five
      seven.rightChild = nine
      nine.leftChild = eight
      
      return seven
}()

Tool.example("tree diagram") {
  print(tree)
}

Tool.example("in-order traversal") {
  tree.traverseInOrder { print($0) }
}

Tool.example("pre-order traversal") {
  tree.traversePreOrder { print($0) }
}

Tool.example("post-order traversal") {
  tree.traversePostOrder { print($0) }
}

Tool.example("树的高度--用队列") {
 let depth = tree.deepthOfTreeUsedQueue(root: tree)
 print(depth)

}

Tool.example("树的高度--用递归") {
 let depth = tree.deepthOfTreeUsedRecursion(root: tree)
 print(depth)
}


var exampleTree: BinarySearchTree<Int> {
  var bst = BinarySearchTree<Int>()
  bst.insert(3)
  bst.insert(1)
  bst.insert(4)
  bst.insert(0)
  bst.insert(2)
  bst.insert(5)
    
  return bst
}


Tool.example("building a BST") {
  print(exampleTree)
}

Tool.example("find  a node") {

    if exampleTree.contains(5) {
        print("找到了 5")
    }else{
        print("没有找到5")
    }
}

Tool.example("removing a node") {
  var tree = exampleTree
  print("Tree before removal:")
  print(tree)
  tree.remove(3)
  print("Tree after removing root:")
  print(tree)
}

Tool.example("检测是否是BST") {
    let isBTS =  BinarySearchTree.isBinarySearchTree(exampleTree.root)
    print(isBTS)
}
