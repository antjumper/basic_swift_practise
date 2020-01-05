import UIKit

//基础的排序算法

// 一 选择排序
// 扫描 n 次 每次选择 剩下的[i, n)之中的最小值 交换到i的位置
//func selectionSort(_ arr:inout [Int],_ n:Int){
//    for i in 0 ..< n { //每次选择出一个最小数
//        var minIndex = i
//        for j in i+1 ..< n { //选出剩下的数里面的最小数  i+1 开始还是i  开始呢 i+1 因为初始化 minIndex = i  是默认了i最小了
//            if arr[j] < arr[minIndex] {
//                minIndex = j
//            }
//        }
//        //选出最小值之后交换
//        arr.swapAt(i, minIndex)
//    }
//}
//
////选择排序的改进 每次遍历找出其中的最大和和最小值 进行确定 这样的话就少了一般的循环次数
//
//func advancedSelectionSort(_ arr:inout [Int], _ n:Int){
//    var left = 0
//    var right = arr.count - 1
//
//    //结束的条件是什么呢 < 小于就可以了 因为基数的话 挑了最大和最小剩下的就是中间数 偶数的话结束条件就是这个
//    while left < right {
//        //保证left 比right位置的小 方便后续的min max初始化
//        if arr[left] > arr[right] {
//            arr.swapAt(left, right)
//        }
//        //默认的最大值和最小值
//        var minIndex = left
//        var maxIndex = right
//        //找出其中的最大值和最小值
//        for i in left + 1 ..< right {
//            if arr[minIndex] > arr[i] {
//                minIndex = i
//            }
//
//            if arr[maxIndex] < arr[i] {
//                maxIndex = i
//            }
//        }
//        //找出最大值和最小值之后 那么就交换最大值和最小值的位置
//        arr.swapAt(left, minIndex)
//        arr.swapAt(right, maxIndex)
//        //之后改变left  和right
//        left += 1
//        right -= 1
//
//    }
//
//}

//测试案例
//var arr = [0,5,7,2,1,7,22,6]
//
////selectionSort(&arr, arr.count)
//advancedSelectionSort(&arr, arr.count)
//print(arr)

//插入排序

// 每次去取来一个数 插入到前半部分的有序数组中
//func insertionSort(_ arr:inout [Int], _ n:Int) {
//    if arr.isEmpty {
//        return
//    }
//    for i in 1 ..< arr.count {//默认前半部分的有序数组有一个元素
//
//        for j in (1 ..< i+1).reversed() { //从前半部分有序数组中的后面开始遍历插入到合适的位置
//            if( arr[j] < arr[j-1]){ //大的话就往后移
//                arr.swapAt(j, j-1)
//            }else {
//                break //当比前一个大的时候就说明已经有插入成功了 可以退出了
//            }
//        }
//    }
//}
//
//// 上面可以看到每次和前面比较之后都需要交换 本来里面有break这个条件按理说会比选择排序多了提前退出的可能时间应该更少但是实际却比选择排序更耗时
////这是因为 swap 这个操作 比较耗时 而且每次比较之后都交换了 减少交换次数的话 会达到我们理想的减少时间的效果
//
////改进的话 把swap改成每次平移
//
////插入排序的话对近乎有序的数组排序效率很高 因为break 的存在
//func advancedInsertionSort(_ arr:inout [Int],_ n:Int){
//    if arr.isEmpty {
//        return
//    }
//
//    for i in 1 ..< arr.count { //还是每次选择一个数
//
//        let temp = arr[i] //把选择的数保存到临时变量
//        var j = i
//        while j >= 1 && arr[j-1] > temp{ //后面平移的条件是 arr[j-1] > temp 注意这点
//            arr[j] = arr[j - 1]
//            j -= 1
//        }
//        arr[j] = temp
//
//    }
//}

//var arr = [0,5,7,2,1,7,22,6]
//insertionSort(&arr,arr.count - 1)
////advancedInsertionSort(&arr,arr.count - 1)
//print(arr)

//冒泡排序
//冒泡排序是每次选出一个最大的放到最后  是不是和选择排序很像呀 只是代码写法不一样 原理是一样的

//func bubbleSort(_ arr:inout [Int],_ n:Int) {
//    if arr.isEmpty {
//        return
//    }
//
//    for i in 0 ..< n - 1 { //排序的躺数
//
//        for  j in 0 ..< n - 1 - i { //比较的次数
//            if arr[j] > arr[j + 1] {
//                arr.swapAt(j, j+1)
//            }
//        }
//    }
//}
//
////优化 当优化的话 比如在比较的时候一次比较都没有发生 说明什么呢 说明数组已经有序了 可以退出循环
//
//func advandedBubbleSort(_ arr:inout [Int], _ n:Int){
//    if arr.isEmpty {
//        return
//    }
//
//    for i in 0 ..< n - 1{ //确定躺数
//        var flag = false
//        for j in 0 ..< n - 1 - i {
//            if arr[j] > arr[j+1] {
//                arr.swapAt(j, j+1)
//                flag = true
//            }
//        }
//
//        if flag == false {
//            break
//        }
//    }
//}

//冒泡排序还可以优化 当发生交换说明之前的无序 当没发生说明已经有序 所以记录每次比较时最后一次交换发生的位置去减少比较的次数
//func advandedBubbleSort(_ arr:inout [Int], _ n:Int){
//    if arr.isEmpty {
//        return
//    }
//    var k = n - 1
//    for _ in 0 ..< n - 1 {
//
//        var flag = false
//        var pos = k
//        for j in 0 ..< pos {
//
//            if arr[j] > arr[j + 1] {
//                arr.swapAt(j, j+1)
//                flag = true
//                pos = j
//            }
//
//        }
//
//        if flag == false {
//            break
//        }
//        k = pos
//
//    }
//
//
//}
//
//var arr = [0,5,7,2,1,7,22,6]
////bubbleSort(&arr, arr.count)
//advandedBubbleSort(&arr, arr.count)
//print(arr)
//

//希尔排序
//希尔排序是非稳定排序算法
//希尔排序其实是一种插入排序的的变种 插入排序是以相邻元素移动 而希尔排序是夸元素移动
func shellSort(_ arr:inout [Int],_ n:Int){
    //计算增量
    var h = 1
    while h < n / 3 {
        h = 3 * h + 1
    }
    //等分成h 份
    while h >= 1 {
        //对其中的不同的组进行排序
        for i  in h ..< n { //选择排序的思路 每次选择一个数
            // 对 arr[i], arr[i-h], arr[i-2*h], arr[i-3*h]... 使用插入排序
            let temp = arr[i]
            var j = i
            while j >= h && arr[j-h] > temp {
                arr[j] = arr[j-h]
                j -= h
            }
            arr[j] = temp
            
        }
        //一组的排序完成之后改变增量 排序下一组
        h = h / 3
    }
}

var arr = [0,5,7,2,1,7,22,6]
shellSort(&arr, arr.count)
print(arr)

