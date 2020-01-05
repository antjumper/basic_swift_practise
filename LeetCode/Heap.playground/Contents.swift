import UIKit
//经典的堆  ---二叉堆、
//二叉堆的性质
//二叉堆是一种特殊的堆，二叉堆是完全二元树（二叉树）或者是近似完全二元树（二叉树）。二叉堆有两种：最大堆和最小堆。最大堆：父结点的键值总是大于或等于任何一个子节点的键值；最小堆：父结点的键值总是小于或等于任何一个子节点的键值。
//能用数组存储二叉堆 是因为二叉堆是完全二叉树 根节点下标是1   parent(i) = i / 2  left child(i) = 2 * i rightChild = 2 * i + 1

// 堆 主要涉及到两个操作 siftDown 元素下浮   和 siftUp 元素上浮
 
struct Heap<Element:Equatable> {
    
    var elements:[Element] = []
    let sort:(Element,Element) ->Bool //去确定是最大堆还是最小堆
    init(sort:@escaping (Element,Element) -> Bool) {
        self.sort = sort
    }
    
    init(sort:@escaping(Element,Element) -> Bool,elements:[Element] = []) {
        self.sort = sort
        self.elements = elements
        
        //构成一个二叉堆 从第一个非叶子节点开始
//        在完全二叉树中， 第一个非叶子结点 其实就是 最后一个叶子结点的父节点。
//        假定父节点为i；则 其左叶子为2i+1 ， 右叶子为2i+2；
//        则当叶子节点为n-1时，就有了n/2 -1 的结论
        //时间复杂度是 o(n) 这个过程叫heapify 的过程
        if !elements.isEmpty{
            for i in stride(from: elements.count / 2 - 1, to: 0, by: -1) {
                siftDown(from:i)
            }
        }
        
    }
    
    var isEmpty:Bool {
        return elements.isEmpty
    }
    
    var count:Int {
        return elements.count
    }
    
    func peak() -> Element? {
        return elements.first
    }
    
    // 开头从 0 开始
    func leftChildIndex(ofParent index:Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(ofParent index:Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index:Int) -> Int {
        return (index -  1) / 2
    }
    
    //移除顶部元素的话 先和最后一个元素交换 然后下浮 之后移除
    
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        
        defer {
            siftDown(from:0)
        }
        return elements.removeLast()
    }
    
    //移除一个元素  O(log n)
    mutating func remove(at index:Int) -> Element?{
        guard  index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        }else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    //O(log n)
    mutating func insert(_ element:Element){
        elements.append(element)
        siftUp(from:elements.count - 1)
    }
    
    func index(of element:Element,startingAt i:Int) -> Int? {
        if i >= count { //越界了
            return nil
        }
        
        if sort(element,elements[i]){
            return nil //higher priority than the current element at index
        }
        
        if element == elements[i]{
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParent: i)) { //递归的搜索从左子树开始
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParent: i)) { //递归的搜索从右子树开始
            return j
        }
        return nil
    }
    
    //上浮操作
    mutating func siftUp(from index:Int){
        var child = index
        var parent = parentIndex(ofChildAt: index)
        while child > 0 && sort(elements[child],elements[parent]) {
            
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    

    //下浮操作 复杂度O(log n)
    mutating func siftDown(from index:Int){
        
        var parent = index
        
        while true {
            
            let left = leftChildIndex(ofParent: parent)
            let right = rightChildIndex(ofParent: parent)
            var candidate = parent
            if left < count && sort(elements[left],elements[candidate]) { //left < count 保证了有左子节点 下面同理
                candidate = left
            }
            if right < count && sort(elements[right],elements[candidate]){
                candidate = right
            }
            
            if candidate == parent {
                return //不用下c浮了
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    
    
    //最后附送 原地堆排序
    //首先吧数组构建成最大堆
    //然后交换吧 第一个和最后一个元素交换  最大元素就在了自己应该在的位置（末尾）
    //然后对第一个元素做siftDown 之后就继续交换倒数第二个 ....
    //然后对第一个元素做siftDown 之后继续交换倒数第三个.....
    
  public static func heapSort(_ arr:inout [Int],_ n:Int){
        func __siftDown(array arr:inout [Int], size count:Int, from index:Int){
            var parent = index
            while 2 * parent + 1 < count {//左孩子不越界
                let left = 2 * parent + 1
                let right = left + 1
                var candidate = parent
                //最大堆 和最大的元素交换 这行代码确定了 左右孩子中最大的是谁
                if right < count && arr[right] > arr[candidate] {
                    candidate = right
                }
                
                if arr[left] > arr[candidate] {
                    candidate = left
                }
                
                if candidate == parent {
                    break
                }
                arr.swapAt(candidate, parent)
                parent = candidate
            }
        }
        //首先吧数组变成一个最大堆
        let firstNoLeaf = (n - 1)/2 //第一个非叶子节点

    for i in (0 ... firstNoLeaf).reversed() {
            __siftDown(array: &arr, size: n, from: i)
        }
        //之后 第一个元素 和倒数第一个元素 倒数第二个元素 倒数第三个元素 逐渐交换 获得排序后的数组
        for j in (1 ... n-1).reversed() {
            
            arr.swapAt(j, 0)
            __siftDown(array: &arr, size:j, from: 0)
        }
    }
    
}

var arr = [2,1,5,7,4,8,0]
Heap<Int>.heapSort(&arr, arr.count)
print(arr)

