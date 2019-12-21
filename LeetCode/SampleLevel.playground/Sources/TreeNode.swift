import Foundation

public class TreeNode {
    public var val:Int
    public var left:TreeNode?
    public var right:TreeNode?
    public init(_ val:Int){
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode:CustomStringConvertible {
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
    private func diagram(for node: TreeNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
      guard let node = node else {
        return root + "nil\n"
      }
      if node.left == nil && node.right == nil {
        return root + "\(node.val)\n"
      }
      return diagram(for: node.right,
                     top + " ", top + "┌──", top + "│ ")
           + root + "\(node.val)\n"
           + diagram(for: node.left,
                     bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
