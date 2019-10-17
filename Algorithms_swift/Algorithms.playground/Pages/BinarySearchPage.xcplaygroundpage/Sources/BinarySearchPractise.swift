import Foundation


public class BinarySearchPractise {
    //这个吧 collection 当做了参数
      static public func binarySearch_2<Elements:RandomAccessCollection>(for element:Elements.Element,in collection:Elements,in range:Range<Elements.Index>? = nil) -> Elements.Index? where Elements.Element:Comparable {
           
                 let range = range ?? collection.startIndex..<collection.endIndex
               
                 guard range.lowerBound < range.upperBound else {
                   return nil
                 }
                 let size = collection.distance(from: range.lowerBound,
                                                to: range.upperBound)
                 let middle = collection.index(range.lowerBound, offsetBy: size / 2)
                 if collection[middle] == element {
                   return middle
                 } else if collection[middle] > element {
                   return binarySearch_2(for: element, in: collection, in: range.lowerBound..<middle)
                 } else {
                    return binarySearch_2(for: element,
                                           in: collection,
                                           in: collection.index(after:middle)..<range.upperBound)
                }
       }
       
    //第二个题
     static public func findIndices(of value:Int,in array:[Int]) -> Range<Int>? {
           guard let leftIndex = array.firstIndex(of: value) else {
               return nil
           }
           guard let rightIndex = array.reversed().firstIndex(of: value) else {
               return nil
           }
           
           return leftIndex..<rightIndex.base
           
    }
    
    static public func findIndices_2(of value:Int,in array:[Int]) -> CountableRange<Int>? {
        guard let startIndex = BinarySearchPractise.startIndex(of: value, in: array, range: 0..<array.count) else {
            return nil
        }
        
        guard let endIndex = BinarySearchPractise.endIndex(of: value, in: array, range: 0..<array.count) else {
            return nil
        }
        return startIndex..<endIndex
        
        
        
    }
    
   static public func startIndex(of value:Int,in array:[Int], range:CountableRange<Int>) -> Int? {
    
       

        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
    
        print("startIndex-----原始数组\(array)-----middleIndex = \(middleIndex)")
        print("startIndex-----在\(array[range])数组中寻找")
    
        if middleIndex == 0 || middleIndex == array.count - 1 {
            if array[middleIndex] == value {
                return middleIndex
            }else {
                return nil
            }
        }
    
        if  array[middleIndex] == value {
            //If the middle index is the first or last accessible index of the array, you don’t need to call binary search any further

            if array[middleIndex - 1] != value {
                
                return middleIndex
                
            }else{
                
                return startIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
                
            }
            
        }else if array[middleIndex] > value{
            
            return startIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
            
        }else {
            
            return startIndex(of: value, in: array, range: middleIndex..<range.upperBound)
            
        }
        
    }
    
   static public func endIndex(of value:Int,in array:[Int], range:CountableRange<Int>) -> Int? {
    
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2

    
        print("endIndex-----在\(array[range])数组中寻找")
        print("endIndex-----原始数组\(array)-----middleIndex = \(middleIndex)")

        if middleIndex == 0 || middleIndex == array.count - 1 {
            if array[middleIndex] == value {
                return middleIndex + 1
            }else {
                return nil
            }
        }
            
        if array[middleIndex] == value {
            if array[middleIndex + 1] != value {
                return middleIndex + 1
            }else {
                return endIndex(of: value, in: array, range: middleIndex..<range.upperBound)
            }
        }else if array[middleIndex] > value {
            return endIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
        }else {
            let start = middleIndex
            return endIndex(of: value, in: array, range: start..<range.upperBound)
        }
        
   }
          
}
