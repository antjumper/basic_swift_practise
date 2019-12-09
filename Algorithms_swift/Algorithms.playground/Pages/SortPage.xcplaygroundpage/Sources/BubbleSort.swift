import Foundation
//O(n^2)
//Bubble sort has a best time complexity of O(n) if it’s already sorted, and a worst and average time complexity of O(n²)
public  func bubbleSort<Element>(_ array:inout [Element]) where Element:Comparable {
    guard array.count >= 2 else {
        return
    }
    for end in (1..<array.count).reversed() {
        
        var swapped = false
        
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        //“If no values were swapped this pass, the collection must be sorted, and you can exit early.
        if !swapped {//当一次交换都没有发生的时候说明 排序是完成的
              return
        }
        
    }
    
  
}


public func BubbleSortWithCollection<T>(_ collection:inout T) where T:MutableCollection,T.Element:Comparable {
    guard collection.count >= 2 else {
        return
    }
    
    for end in collection.indices.reversed() {
        
        var swapped = false
        
        var current = collection.startIndex
        
        while current < end {
            let next = collection.index(after: current)
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            current = next
        }
        
        if !swapped {
            return
        }
        
    }
}
