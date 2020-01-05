import UIKit
//高级点的排序算法


//一 归并排序 MegerSort

//分两个过程 向下分割 和向上归并的过程
//看出把数组分成了log(n) 的层级 每层合并的时间复杂度是O(n) 因此时间复杂度是nlog(n) 归并的过程需要n个辅助空间用于排序
//func megerSort(_ arr:inout [Int],_ left:Int,_ right:Int) {
//
//    //合并的过程  在元素组的基础上怎么合并呢合并不了 那么只能申请空间了
//    func meger (_ arr:inout [Int], _ left:Int,_ mid:Int,_ right:Int){
//        let tempArr = [Int](arr[left...right])
//        var index1 = left
//        var index2 = mid + 1
//        for i in left ..< (right + 1) {
//            if index1 > mid { //说明前半部分数据用完了
//                arr[i] = tempArr[index2 - left]
//                index2 += 1
//            }else if index2 > right { //说明右半部分用完了
//                arr[i] = tempArr[index1 - left]
//                index1 += 1
//            }else if (tempArr[index1 - left] < tempArr[index2 - left]){// 左半部分所指元素 < 右半部分所指元素
//                arr[i] = tempArr[index1 - left]
//                index1 += 1
//            }else {// 左半部分所指元素 >= 右半部分所指元素
//                arr[i] = tempArr[index2 - left]
//                index2 += 1
//            }
//        }
//    }
//
//    if left >= right {
//        return //只剩一个或者一个不剩的时候就不在向下分割了
//    }
//    let mid = (right - left)/2 + left
//
//    //向下分割
//    megerSort(&arr, left, mid)
//    megerSort(&arr, mid + 1, right)
//    //分割之后合并
//    meger(&arr,left,mid,right)
//
//}

//对于归并排序的优化
//一 对于小规模数据 使用插入排序 因为近乎有序了
// 二 对于arr[mid] <= arr[mid+1] 的情况不在进行递归 因为已经是合并过的样子啦
// 还有一个优化就是空间的优化 使用一个n的数组 每次归并的时候使用同一个数组

//func advancedMegerSort(_ arr:inout [Int],_ left:Int,_ right:Int) {
//
//    //插入排序
//    func insertionSort(_ arr:inout [Int],_ l:Int,_ r:Int){
//        for i in (l + 1) ... r  {
//            let temp = arr[i]
//            var j = i
//            while j >= 1 && arr[j - 1] > temp {
//                arr[j] = arr[j-1]
//                j -= 1
//            }
//            arr[j] = temp
//        }
//    }
//
//    //合并的过程  在元素组的基础上怎么合并呢合并不了 那么只能申请空间了
//    func meger (_ arr:inout [Int], _ left:Int,_ mid:Int,_ right:Int){
//        let tempArr = [Int](arr[left...right])
//        var index1 = left
//        var index2 = mid + 1
//        for i in left ..< (right + 1) {
//            if index1 > mid { //说明前半部分数据用完了
//                arr[i] = tempArr[index2 - left]
//                index2 += 1
//            }else if index2 > right { //说明右半部分用完了
//                arr[i] = tempArr[index1 - left]
//                index1 += 1
//            }else if (tempArr[index1 - left] < tempArr[index2 - left]){// 左半部分所指元素 < 右半部分所指元素
//                arr[i] = tempArr[index1 - left]
//                index1 += 1
//            }else {// 左半部分所指元素 >= 右半部分所指元素
//                arr[i] = tempArr[index2 - left]
//                index2 += 1
//            }
//        }
//    }
//
//    if left - right <= 15 {
//        insertionSort(&arr, left, right) //只剩一个或者一个不剩的时候就不在向下分割了
//    }
//    let mid = (right - left)/2 + left
//
//    //向下分割
//    megerSort(&arr, left, mid)
//    megerSort(&arr, mid + 1, right)
//    //分割之后合并 对于arr[mid] <= arr[mid+1]的情况,不进行merge
//    //小于等于的情况不用在归并了
//    if arr[mid] > arr[mid + 1] {
//        meger(&arr,left,mid,right)
//    }
//
//}

// 自低向上的归并  首先分成一个元素一个小段的归并  分成两个元素一个小段的归并 分成4个元素一个小段的归并 分成8个元素一个小段的归并.....等等
//
//func megerSortBottomUp(_ arr:inout [Int],_ n:Int){
//
//    //归并的函数
//    func meger (_ arr:inout [Int], _ left:Int,_ mid:Int,_ right:Int){
//        let tempArr = [Int](arr[left...right])
//        var index1 = left
//        var index2 = mid + 1
//        for i in left ..< (right + 1) {
//            if index1 > mid { //说明前半部分数据用完了
//                arr[i] = tempArr[index2 - left]
//                index2 += 1
//            }else if index2 > right { //说明右半部分用完了
//                arr[i] = tempArr[index1 - left]
//                index1 += 1
//            }else if (tempArr[index1 - left] < tempArr[index2 - left]){// 左半部分所指元素 < 右半部分所指元素
//                arr[i] = tempArr[index1 - left]
//                index1 += 1
//            }else {// 左半部分所指元素 >= 右半部分所指元素
//                arr[i] = tempArr[index2 - left]
//                index2 += 1
//            }
//        }
//    }
//
//    if arr.isEmpty {
//        return
//    }
//
//    var size = 1;
//    while size < n { //分段
//
//        var i = 0
//        while i < n - size  {//对每一小段进行归并
//
//            //对arr[i...i+sz-1] 和 arr[i+sz...i+2*sz-1] 进行归并 。。。
//            meger(&arr, i, i + size - 1, min(i + size + size - 1, n-1))
//
//            i += size+size //每次归并了两段的
//        }
//
//        size += size //每次两倍
//
//    }
//
//}
//
//var arr = [8,6,2,3,1,5,7,4,8,6,2,3,1,5,7,4,8,6,2,3,1,5,7,4,8,6,2,3,1,5,7,4,8,6,2,3,1,5,7,4,8,6,2,3,1,5,7,4]
//
//megerSortBottomUp(&arr,arr.count)
//print(arr)
//


//快速排序
//流程就是 选一个标定点 把数组分成大于 和小于标定点的两部分 这样的话 标定点就呆在了自己应该在的位置 结束条件就是只剩下一个标定元素的数据段就是最小段了

//快速排序的两个优化
// 一 在小于15个元素的时候使用插入排序

//func quickSort(_ arr:inout [Int],_ left:Int,_ right:Int){
//
//
//    if left >= right{
//        return
//    }
//    //优化一
////    if left - right <= 15{
////        insertSort(&arr,left,rigth)
////    }
//    //优化二 平衡性的h考虑在 标定点两边的元素尽量平衡
//    let randomNum = Int(arc4random() % UInt32(right - left + 1)) + left
//    arr.swapAt(left,randomNum)
//    let flag = arr[left]
//
////    let flag = arr[left]
//
//
//    var j = left
//    for i in left + 1 ... right {
//        if arr[i] < flag {
//            j += 1
//            arr.swapAt(i, j)
//        }
//    }
//
//    arr.swapAt(left, j)
//
//    quickSort(&arr, left, j-1)
//    quickSort(&arr, j + 1, right)
//
//}

//var arr = [4,6,2,3,1,5,7,8]
//quickSort(&arr, 0, arr.count - 1)

//双路快排 解决的问题是 d数组中存在大量相等的元素是 把大量的相等元素尽量平衡分布 放在左右两边

//func quickSortTwoWay(_ arr:inout [Int],_ left:Int,_ right:Int){
//
//    if left >= right {
//        return
//    }
//    let flag = arr[left]
//    var i = left + 1
//    var j = right
//
//    while true {
//
//        while i <= right && arr[i] < flag  {
//            i += 1
//        }
//
//        while j >= left + 1 && arr[j] > flag {
//            j -= 1
//        }
//
//        if i > j  {
//            break
//        }
//
//        arr.swapAt(i, j)
//        i += 1
//        j -= 1
//    }
//
//    arr.swapAt(left, j)
//
//    quickSortTwoWay(&arr, left, j - 1)
//    quickSortTwoWay(&arr, j + 1, right)
//}
//
//var arr = [4,6,2,3,1,5,7,8]
//quickSortTwoWay(&arr, 0, arr.count - 1)

//三路快排 吧数组分成三段 第一段 小于标定点 arr[l+1...lt] < v
//第二段等于标定点 arr[lt+1...i) == v
//第三段 大于标定点 arr[gt...r] > v
//func quickSortThreeWay(_ arr:inout [Int],_ left:Int,_ right:Int){
//
//    if left >= right {
//        return
//    }
//
//    var i = left + 1
//    var lt = left
//    var gt = right + 1
//
//    let flag = arr[left]
//
//    while i < gt { //碰到gt就结束了
//        if (arr[i] == flag){
//            i += 1
//        }else if (arr[i] < flag){
//            lt += 1
//            arr.swapAt(lt, i)
//            i += 1
//        }else {
//            gt -= 1
//            arr.swapAt(gt, i)
//        }
//    }
//
//    arr.swapAt(left, lt)
//    quickSortThreeWay(&arr, left, lt-1)
//    quickSortThreeWay(&arr, gt, right)
//}
//
//var arr = [4,6,2,3,1,5,7,8]
//quickSortThreeWay(&arr, 0, arr.count - 1)







