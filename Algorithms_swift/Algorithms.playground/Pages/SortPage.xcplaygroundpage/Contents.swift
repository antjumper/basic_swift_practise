
import Foundation

Tool.example("冒泡排序") {
      var array = [9, 4, 10, 3]
      print("Original: \(array)")
      bubbleSort(&array)
      print("Bubble sorted: \(array)")
}


Tool.example("选择排序") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    selectionSort(&array)
    print("Selection sorted: \(array)")
}

Tool.example("插入排序") {
      var array = [9, 4, 10, 3]
       print("Original: \(array)")
       insertSort(&array)
       print("Selection sorted: \(array)")
}

Tool.example("归并排序") {
      let array = [7, 2, 6, 3, 9]
      print("Original: \(array)")
      print("Merge sorted: \(mergeSort(array))")
}
