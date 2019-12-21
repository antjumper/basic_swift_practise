import Foundation

public class ListNode {
    public var val:Int
    public var next:ListNode?
    public init(_ value:Int) {
        self.val = value
        self.next = nil
    }
}


extension ListNode:CustomStringConvertible {
    
    public var description: String {
        
        guard let next = next else{
            return "\(val)->null"
        }
        return "\(val)->" + next.description
    }
    
}
