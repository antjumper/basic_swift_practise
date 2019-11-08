import Foundation

//时间复杂度是 O(n log n)
//控件复杂度 O(n log n)
// 背后的思想是 divide and conquer 分治
// 什么是分治：to break up a big problem into several smaller, easier-to-solve problems and then combine those solutions into a final result. The merge sort mantra is to split first and merge after.

public func mergeSort<Element>(_ array:[Element]) -> [Element] where Element:Comparable {
    //1
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count / 2
    //2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    return merge(left, right)
    
}

private func merge<Element>(_ left:[Element],_ right:[Element]) -> [Element] where Element:Comparable {
    var leftIndex = 0
    var rightIndex = 0
    var result:[Element] = []
    //3
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        // 4
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        }else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        }else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    //5
    if leftIndex < left.count {
        result.append(contentsOf:left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf:right[rightIndex...])
    }
    
    return result
}
