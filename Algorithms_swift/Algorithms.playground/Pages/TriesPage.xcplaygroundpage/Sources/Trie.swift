import Foundation

public class Trie<CollectionType:Collection> where CollectionType.Element:Hashable{
    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil, parent: nil)
    public init() {}
    
    //未实现的功能 1 all the collection in trie  2 count property 3 isEmpty 属性的实现
    //insert
    public func insert(_ collection:CollectionType) {
        var current = root
        for element in collection {
            if current.children[element] == nil { //不存在和这个key的话 那么就插入
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]! //存在的话 那么就跳过就行了
        }
        current.isTerminating = true
    }
    
    // contain
    public func contains(_ collection:CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    public func remove(_ collention:CollectionType) {
        var current = root
        for element in collention {
            //不存在某个字符的话 说明不存在直接返回
            guard let child = current.children[element] else {
                return
            }
            //字符存在的话 直接往下走
            current = child
        }
        
        //确保遍历到最后 标识确实存在
        guard current.isTerminating else {
            return
        }
        
        current.isTerminating = false
        
        //最后一个字符的父类存在 当前的孩子节点是空 并且当前节点不是最后一个节点
        while let parent = current.parent,
        current.children.isEmpty && !current.isTerminating{
            parent.children[current.key!] = nil //说明只有 连续只有一个节点的节点才会被删除
            current = parent
        }
    }
}

public extension Trie where CollectionType:RangeReplaceableCollection {
    
    /*
    collection(startingWith:) has a time complexity of O(k*m), where k represents the longest collection matching the prefix and m represents the number of collections that match the prefix.
    Recall that arrays have a time complexity of O(k*n), where n is the number of elements in the collection.
    */
    func collections(startingWith prefix:CollectionType) -> [CollectionType] {
        var current = root
        for element in prefix {
            guard let  child = current.children[element] else {
                return []
            }
            current = child
        }
    
        return collections(startingWith: prefix,after:current)
    
    }
    
    //返回当前node后面的所有字符串
    private func collections(startingWith prefix:CollectionType, after node:Node) -> [CollectionType] {
        var results:[CollectionType] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
        
        for child in node.children.values {
            
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf:collections(startingWith: prefix,after: child))
            
        }
        return results
        
    }
    
}
