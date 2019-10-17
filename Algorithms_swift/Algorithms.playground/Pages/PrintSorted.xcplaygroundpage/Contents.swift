
import Foundation

//顺序打印 空间复杂度是1
func printSorted(_ array:[Int]) {
    //空数组就退出
    guard !array.isEmpty else {
        return
    }

    //2
    var currentCount = 0 //标记当前打印的个数
    var minValue = Int.min //最小值为什么要提出来呢
    
    for value in array {
        if value == minValue {
            print(value)
            currentCount += 1
        }
    }
    
    while currentCount < array.count {//输出的主流程
        //4
        var currentValue = array.max()!//最大值
        for value in array {  //选取最小的值
            if value <= currentValue && value > minValue {
                currentValue = value
            }
        }
        //5
        for value in array {
            if value == currentValue {
                print(value)
                currentCount += 1
            }
        }
        //6
        minValue = currentValue
    }
    
}
let numbers = [80, 99, 105, 450,1, 3, 56, 66, 68]

printSorted(numbers)
