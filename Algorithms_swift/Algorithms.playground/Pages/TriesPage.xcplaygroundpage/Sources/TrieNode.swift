import Foundation

public class TrieNode<Key:Hashable> {
    public var key:Key? //可选类型是因为 root的key是空的
    public weak var parent:TrieNode? //父类节点是因为为了 remove方法准备的
    public var children:[Key:TrieNode] = [:]
    public var isTerminating = false
    
    public init(key:Key?,parent:TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
