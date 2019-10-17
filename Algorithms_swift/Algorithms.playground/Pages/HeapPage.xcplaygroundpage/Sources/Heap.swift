import Foundation
//用数组模拟 堆  是因为在堆的操作中 交换的操作比较多 所以 使用数据要比使用二叉树方便

//遍历二叉树火器营左子节点和右节点的操作是Log(n) 而随机访问数据结构（例如数组）中相同的操作只是O(1)
public struct Heap<Element:Equatable> {
    
    var elements:[Element] = []
    
    let sort:(Element,Element) -> Bool
    
    init(sort:@escaping(Element,Element) -> Bool,elements:[Element] = []) {
        self.sort = sort
        self.elements = elements
        
        //1.stride(from:to:by)，开区间处理，最后一个值严格小于最大值；
        //2.stride(from:through:by)，闭区间处理，最后一个值小于或等于最大值；
        
        //To satisfy the heap’s property, you loop through the array backwards, starting from the first non-leaf node, and sift down all parent nodes. You loop through only half of the elements, because there is no point in sifting down leaf nodes, only parent nodes.
        
        /*
         如果是完全二叉树
         如果是完全二叉树，假设非叶节点有K(20+21+22=1+2+4=7)个，叶节点有K+1 (23=8)个。
         假设完全二叉树的高度为h，则
         非叶子节点的数目20+21+22+…+2h-1=2h-1
         叶子节点的数目2h
         全部节点的数目2h+1-1
         如果用n表示全部节点的数目，则n = 2h+1 –1 = 2h – 1 + 2h。显然叶子节点开始于[n/2]+1
         */
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty:Bool {
        return elements.isEmpty
    }
    
    var count:Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    //层遍历 0  开始数
    func leftChildIndex(ofParentAt index:Int) -> Int{
        return (2*index)+1
    }
    
    func rightChildIndex(ofParentAt index:Int) -> Int{
        return (2*index) + 2
    }
    
    func parentIndex(ofChildAt index:Int) -> Int {
        return (index - 1)/2
    }
    
    //remove  操作
    //首先 交换头部和最后一个元素（最后一个叶子节点）之后删除最后一个元素 然后对头部元素做sift down
    //做sift down 的时候检查 两个子节点 如果两个子节点中大于头部节点 那么交换 如果两个子节点都大于当前节点 那么和最大的交换
    //后续 继续sift down
    
    //知道没有子节点没有大于父节点的 或者 到了最后
    
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count-1)
        defer{
            siftDown(from:0)
        }
        return elements.removeLast()
    }
    //O(log n)
    mutating func siftDown(from index:Int) {
        
        var parent = index //跟踪sift down的交换历程
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            if left < count && sort(elements[left],elements[candidate]) {
                candidate = left
            }
            
            if right < count && sort(elements[right],elements[candidate]){
                candidate = right
            }
            
            if candidate == parent { //不在需要交换了 直接就返回了 退出 while 循环
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
            
        }
    }
    
    //Insert
    // 1 插入到最后
    // 2 做sift up 操作 （比较当前插入节点A和A的父节点  如果需要的话交换）
    mutating func insert(_ element:Element) {
        
        elements.append(element)
        
        siftUp(from:elements.count-1)
    }
    //O(log n)
    mutating func siftUp(from index:Int){
        
        var childIndex = index
        var parent = parentIndex(ofChildAt: childIndex)
        
        while childIndex > 0 && sort(elements[childIndex],elements[parent])  {
            elements.swapAt(childIndex, parent)
            childIndex = parent
            parent = parentIndex(ofChildAt: childIndex)
        }
    }
    
    //Removing from an arbitrary index 移除任意的一个元素 O(log n)
    
    mutating func remove(at index:Int) ->Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1  {
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
    
    //Searching for an element in a heap 在heap中查找
    func index(of element:Element,startingAt i:Int) -> Int? {
        //是否越界
        if i >= count {
            return nil
        }
        
        //开始查找的 位置和 查找的元素 比较结果是YES 只能说明 在i 之前查找到
        //Check to see if the element that you are looking for has higher priority than the current element at index i. If it does, the element you are looking for cannot possibly be lower in the heap
        if sort(element,elements[i]) {
            return nil
        }
        
        if element ==  elements[i] { //正好是i 处的元素
            return i
        }
        //Recursively search for the element starting from the left child of i.
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        //Recursively search for the element starting from the right child of i
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        
        return nil
   
    }
    
    
    
    static public func heapTest() {
        var heap = Heap<Int>(sort: >, elements: [1,12,3,4,1,6,8,7])
        while !heap.isEmpty {
            print(heap.remove()!)
        }
    }
    
    
    //查找第n 大的元素  let integers = [3, 10, 18, 5, 21, 100]   n = 3
    
    
    
    
    //Given the following array, visually construct a min heap. Provide a step-by-step diagram of how the min heap is constructed. [21, 10, 18, 5, 3, 100, 1]  打印出最小堆的构建过程
    
    
    //Write a method that combines two heaps. 合并两个堆
    
    
    //Write a function to check if a given array is a min heap 检查数组是否是个最小堆
    
}
