import Foundation
//二叉搜索树  必须遵循两个条件
//1 下标取值[] RandomAccessCollection 协议
//2 collection  必须是排序的

public extension RandomAccessCollection where Element:Comparable {
    
    func binarySearch(for value:Element,in range:Range<Index>? = nil) -> Index? {
        
        //startIndex  endIndex  和 lowerBound  upperBound 的区别其实 前者是RandomAccessCollection 中的一个属性  后者是 range 的一个属性 但是意义都是相同的 第一个和最后一个的下一个
        let range = range ?? startIndex..<endIndex
        
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        //3
        let size = distance(from: range.lowerBound, to: range.upperBound)
        
        print("range.lowerBound = \(range.lowerBound),range.upperBound = \(range.upperBound)")
        
        let middle = index(range.lowerBound, offsetBy: size/2)
        
        if self[middle] == value {
            return middle
        }else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        }else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
   
}




