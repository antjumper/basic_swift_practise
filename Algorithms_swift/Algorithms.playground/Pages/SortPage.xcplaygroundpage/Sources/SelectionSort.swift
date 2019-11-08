import Foundation
//从0，1，2，3， 依次选出来最小的放入0，1，2，3，
//选择排序是在 冒泡排序上的改进 主要思路是减少交换的次数  每次选出最小的和头部的交换
//O(n²)
public func selectionSort<Element:Comparable>(_ array:inout [Element]){
    guard array.count >= 2 else {
        return
    }
    
    for current in (0..<array.count) {
        
        //每次选出最小的和当前的交换
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[other] < array[lowest] {
                lowest = other
            }
        }

        if lowest != current {
            array.swapAt(lowest, current)
        }
        
        
    }
}


public func selectionSortWithCollection<T>(_ collection:inout T) where T:MutableCollection,T.Element:Comparable {
    
    guard collection.count >= 2 else {
        return
    }
    
    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)
        while other < collection.endIndex {
            if collection[other] < collection[lowest] {
                lowest = other
            }
            other = collection.index(after: other)
        }
        
        if lowest != current {
            collection.swapAt(lowest, current)
        }
        
    }
}
