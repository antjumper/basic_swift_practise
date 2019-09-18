//
//  SwiftIterator.swift
//  IteratorDemo
//
//  Created by Flex on 2019/6/26.
//  Copyright © 2019 flex. All rights reserved.
//

import Foundation

protocol MyIteratorProtocol {
    associatedtype Element
    mutating func next() -> Element?
}
//因此MyIterator 应该是尊从MyIteratorProtocol

protocol MySequence {
    associatedtype MyIterator:MyIteratorProtocol
    func makeIterator() -> MyIterator
}

//我们自己实现的一遍
//先写MyIterator类
struct FiboIterator:MyIteratorProtocol {
    var state = (0,1)
    mutating func next() -> Int? {
        let value = state.0
        state = (state.1,state.0+state.1)
        return value
    }
}

struct Fibonacci:MySequence {
    func makeIterator() -> FiboIterator {
        return FiboIterator()
    }
}


///////////////////////////////

struct FiboIterator_2:IteratorProtocol {
    typealias Element = Int

    var state:(Int,Int) = (0,1)
    mutating func next() -> Int? {
        let value = state.0
        state = (state.1,state.0+state.1)
        return value
    }
}

struct Fibonacci_2: Sequence {
    typealias Element = Int
    
    func makeIterator() -> AnyIterator<Element> {
        return AnyIterator(FiboIterator_2())
    }
}




@objcMembers
class SwiftIteratorExe: NSObject {
    
    static func dispalySwiftIterator() -> Void {
            //Swift中的实现
            let numbers = [1, 2, 3, 4, 5]
        
            for number in numbers {
                print("内部枚举 + \(number)")
            }
        
            var begin = numbers.makeIterator()
            while let number = begin.next() {
                print("外部枚举 + \(number)")
            }
    }
    
    
    static func displayCustomIterator() -> Void {
        let fib = Fibonacci()
        
        var fibIter = fib.makeIterator()
        
        var i = 1
        
        while let value = fibIter.next(),i < 10 {
            print("displayCustomIterator : \(value)")
            i += 1
        }
    }
    
    static func displayCustomIterator_2() -> Void {
        
        let fibo = Fibonacci_2()
        let fiboIter1 = AnySequence(fibo.makeIterator()).prefix(10)
        for item in fiboIter1 {
            print("displayCustomIterator_2 : \(item)")
        }
    }
    
    
   class func fiboIterator() -> AnyIterator<Int> {
        var state = (0, 1)
        
        return AnyIterator {
            let theNext = state.0
            state = (state.1, state.0 + state.1)
            
            return theNext
        }
    }
    
    static func displaySupriseIterator() -> Void {
        let iterator = SwiftIteratorExe.fiboIterator()
        let fiboSequence = AnySequence(iterator)
        let  arr = Array(fiboSequence.prefix(10))
        print("displaySupriseIterator:\(arr)")
    }


}

