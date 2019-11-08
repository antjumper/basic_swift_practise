import Foundation

//插入排序用于较小的（<20个元素）未排序的分区
//每次把后面的元素插入到前面的有序队列中

public func insertSort<Element:Comparable>(_ array:inout [Element]){
    guard array.count >= 2 else {
        return
    }
    // 默认0 是已经有序的数组 往里面插入
    for current in 1..<array.count {
        for shitfing in (1...current).reversed() {
            if array[shitfing] < array[shitfing - 1] {
                array.swapAt(shitfing, shitfing - 1)
            }else {
                break;//如果大于当前的shifting 那么就退出
            }
        }
    }
}


//“Insertion sort traverses the collection backwards when shifting elements. As such, the collection must be of type BidirectionalCollection.
public func insertionSort<T>(_ collection:inout T) where T:BidirectionalCollection & MutableCollection, T.Element:Comparable{
    
    guard collection.count >= 2 else {
        return
    }
    
    for current in collection.indices {
        var shifting = current
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            }else {
                break
            }
            shifting = previous
        }
    }
    
    
}
