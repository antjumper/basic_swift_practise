//: Playground - noun: a place where people can play

import Cocoa
/*
 二分搜索(Binary Search)  使用的前提是 有序的数组 因为 要二分  不有序 就不知道 在哪去查找呀
*/

//递归法 实现 二分搜索
//func binarySearch<T:Comparable>(_ a:[T],key:T,range:Range<Int>) -> Int?{
//    
//    if range.lowerBound >= range.upperBound {
//        //找不到直接返回
//        return nil
//    }else{
//        //计算数组一分为二的位置
//        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
//        
//        if a[midIndex] > key {//判断寻找的元素是不是在数组左侧
//            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
//        }else if a[midIndex] < key{ //判断寻找的元素是不是在数组右侧侧
//            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
//        }else{ //否则的话就说明 找到了这个元素
//            return midIndex
//        }
//    }
//    
//}

//迭代法 实现

func binarySearch<T:Comparable>(_ a:[T],key:T) -> Int?{
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        
        let minIndex = lowerBound + (upperBound - lowerBound)/2
        
        if a[minIndex] == key {
            return minIndex
        }else if a[minIndex] < key{
            lowerBound = minIndex + 1
        }else{
            upperBound = minIndex
        }
    }
    
    return nil
    
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

//binarySearch(numbers, key: 43, range: 0 ..< numbers.count)

binarySearch(numbers, key: 43)






