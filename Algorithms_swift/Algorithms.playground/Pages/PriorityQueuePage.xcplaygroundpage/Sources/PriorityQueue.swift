import Foundation

public struct PriorityQueue<Element:Equatable>:Queue {
    
   private var heap:Heap<Element>
    
   init(sort:@escaping (Element,Element) -> Bool,elements:[Element] = []){
        heap = Heap(sort: sort, elements: elements)
    }
    
   public var isEmpty: Bool {
        return heap.isEmpty
    }
    
   public var peek: Element? {
        return heap.peek()
    }
    
   public mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
   public mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
    
}

extension PriorityQueue {
    static public func testPriorityQueue(){
        
        var priorityQueue = PriorityQueue<Int>(sort: >, elements: [1,12,3,4,1,6,7,8])
        
        while !priorityQueue.isEmpty {
            print(priorityQueue.dequeue()!)
        }
    }
}
