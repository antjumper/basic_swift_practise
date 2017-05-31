//
//  main.swift
//  basic_swift
//
//  Created by 刘红波 on 2017/2/8.
//  Copyright © 2017年 刘红波. All rights reserved.
//

import Foundation

//队列 优化

//FIFO  出队列的时候要 平移数组里面的元素 所以 每次出队列的时候 用head标记 然后 当达到 50 个 并且 达到数组长度的 0.25时  删除一次前面的废弃空间

public struct Queue<T>{
    
    fileprivate var array = [T?]()
    
    fileprivate var head = 0;
    
    public var isEmpty:Bool{

        return array.count==0
        
    }
    
    public mutating func enqueue(_ element:T){
        
        array.append(element)
        
    }
    
    public mutating func dequeue() -> T?{
        
        //
        guard head < array.count,let element = array[head] else{
            
            return nil
            
        }
        
        array[head] = nil;
        head += 1;
        
        let percentage = Double(head)/Double(array.count)
        
        if array.count > 50 && percentage>0.25 {
            array.removeFirst(head)
            head = 0
        }
        return element
        
    }
    
    
    public var front:T?{
        if isEmpty {
            return nil
        }else{
            return array[head]
        }
    }
    
}


//n大小不大于10，用插值排序来取代快速排序。
func insertionSort(_ array:[Int]) -> [Int]{
    var a = array
    for x in 1..<a.count {
        var y = x
        while y>0 && a[y] < a[y-1] {
            swap(&a[y-1], &a[y])
            y = y - 1
        }
        
    }
    return a
}


let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
print(insertionSort(list))

//Merge Sort  归并排序

func mergerSort(_ array:[Int]) -> [Int]{
    
    guard array.count > 1 else{
        return array
    }
    
    //数组的中间值 作为分解点
    let middleIndex = array.count/2
    
    //归并左边
    let leftArray = mergerSort(Array(array[0..<middleIndex]))
    //归并右边
    let rightArray = mergerSort(Array(array[middleIndex..<array.count]))
    
    //合并左右边的数组
    return merger(leftPile: leftArray,rightPile: rightArray)
    
}

func merger(leftPile:[Int], rightPile:[Int]) -> [Int]{
    
    //左边的数组其实下标
    var leftIndex = 0
    //右边的数组起始下标
    var rightIndex = 0
    
    //把左右数组合并成 一个新的数组 orderedPile
    var orderedPile = [Int]()
    
    // 合并
    while leftIndex < leftPile.count && rightIndex < rightPile.count{
        
        //把小的放到前面 大的放到后面
        if leftPile[leftIndex] < rightPile[rightIndex] {
            
            orderedPile.append(leftPile[leftIndex])
            leftIndex = leftIndex + 1
        }else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex+=1
        }else{//相等的话 挨个进入
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
    }
    //看哪个还有剩余 合并大最后
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

//归并方法 ---跳过拆分过程，直接从合并数组开始。这种方法称作从下向上 ------ 这个方法值得在此研究

func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    let n = a.count
    
    //双缓冲区  z[d] 读  z[d-1]用来写
    var z = [a, a]      // 1
    var d = 0
    
    var width = 1 //合并数组长度为1  2  4  8
    while width < n {   // 2
        
        var i = 0
        while i < n { //3合并过程 合并的数组放入 z[1-d]
            
            var j = i
            var l = i
            var r = i + width
            
            let lmax = min(l + width, n)
            let rmax = min(r + width, n)
            
            while l < lmax && r < rmax {  // 4  z[d]上读数值，在z[1-d]写数组
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1 - d][j] = z[d][l]
                    l += 1
                } else {
                    z[1 - d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1 - d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }
            
            i += width*2
            print("width = \(width), d = \(d), i = \(i), z =  \(z)")
        }
        
        width *= 2
        d = 1 - d      // 5
    }
    return z[d]
}
//let array = [2, 1, 5, 4, 9]
//
//print(mergeSortBottomUp(array, <))
  // [1, 2, 4, 5, 9]

