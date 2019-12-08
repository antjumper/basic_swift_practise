import UIKit

//翻转Int
//func reverse(_ x: Int) -> Int {
//    var ans:Int = 0
//    var n = x
//    let max_gewei = Int(Int32.max % 10)
//    let min_gewei = Int(Int32.min % 10)
//
//    while n != 0 {
//        //pop
//        let pop:Int = n % 10
//
//        n = n / 10;
//        //溢出判定
//        let maxAns = Int(Int32.max / 10)
//        let minAns = Int(Int32.min / 10)
//
//        //最大溢出判定
//        if (ans > maxAns) || (ans == maxAns && pop > max_gewei  ) {
//            return 0
//        }
//        //最小溢出判定
//        if (ans < minAns || (ans == minAns && pop < min_gewei)) {
//            return 0
//        }
//
//        ans = ans * 10 + pop
//    }
//
//    return ans
//}
//
//print(reverse(123))
//

//回文数字
//func isPalindrome(_ x: Int) -> Bool {
//    //负数和末尾是0 的情况的
//    if(x < 0 || (x % 10 == 0 && x != 0)){
//        return false
//    }
//    //逆序一半的位数  当 剩余数值>= 旋转的数值说明已经一半位数了
//    var ans = 0
//    var n = x
//    while n > ans {
//        ans = ans * 10 + Int(n % 10)
//        n = n / 10
//    }
//    //偶数位情况 || 奇数位的情况
//    return n == ans || Int(ans / 10) == n
//}

//isPalindrome(12321)
//isPalindrome(1221)



////删除排序数组中的重复项
////注意传入的数组就是要修改的数组
//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    if nums.isEmpty {
//        return 0
//    }
//    //不同字符的个数
//    var count = 0
//    //当前count 和index 不相等 count++
//    //当前count 和index 相等 count 不变
//    //快慢指针 以第一个为参照物
//    for index in 1..<nums.count {
//        if nums[count] != nums[index] {
//            count += 1
//            nums[count] = nums[index]
//        }
//    }
//    return count + 1
//
// }
////var nums = [0,0,1,1,1,2,2,3,3,4]
//var nums = [1,1,2]
////var nums = [1,2]
//
//
//let len = removeDuplicates(&nums)
//for i in 0 ..< len {
//    print(nums[i])
//}

//实现 strStr()
//KMP https://blog.csdn.net/stay_foolish12/article/details/89065424
//KMP:https://www.jianshu.com/p/0061b2615c6e

func strStr(_ haystack: String, _ needle: String) -> Int {
      
    let haystackLen = haystack.count
    let needleLen = needle.count
    //构造Next数组 needle 本身和本身对比生成
    
    var next:[Int] = [Int](repeating: 0, count: needleLen)
    var i = 0 //当前“截取”的字符串的最后一个字符
    var j = -1 //当前“截取”的字符串的第一个字符及帮助i值的后移操作
   
    
    while i<needleLen-1 {
        if j == -1 || (needle[needle.index(needle.startIndex, offsetBy: i)] == needle[needle.index(needle.startIndex, offsetBy: j)]){
            print(111)
            i+=1
            j+=1
            next[i] = j + 1
        }else{
            j = next[j] - 1
        }
    }
    print("next = \(next)")
    //开始对比  不匹配的话从needle 的next[j]开始匹配
    i = 0
    j = 0
    while i < haystackLen && j < needleLen {
        if j == -1 || (haystack[haystack.index(haystack.startIndex, offsetBy: j)] == needle[needle.index(needle.startIndex, offsetBy: j)])  {
            i+=1
            j+=1
            print("KMP前进: i = \(i) j = \(j)")

        }else{
            j = next[j]-1
            print("KMP回退: i = \(i) j = \(j)")

        }
    }
    print("i = \(i)")
    if j == needleLen {
        return i-j
    }else{
        return -1
    }
}
strStr("hello", "ll")
//strStr("aaaaa", "bba")

