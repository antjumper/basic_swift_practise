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


//罗马数字转字符
//func romanToInt(_ s: String) -> Int {
//    //映射的字典
//    var dict:[String:Int] = [:]
//    dict["I"] = 1
//    dict["V"] = 5
//    dict["X"] = 10
//    dict["L"] = 50
//    dict["C"] = 100
//    dict["D"] = 500
//    dict["M"] = 1000
//    var num = 0
//    //遍历字符串
//    for index in s.indices {
//        //根据规则 前面的序列位小于后面的就是减去当前映射的值
//        //当前面的序列为大于等于后面的序列位就加上当前的映射的值
//
//        if index != s.index(before: s.endIndex) {
//
//            let nextIndex = s.index(after: index)
//            let startEnd = s.index(index, offsetBy: 1)
//            let endEnd = s.index(nextIndex, offsetBy: 1)
//            let cur = dict[String(s[index ..< startEnd])]
//            let net = dict[String(s[nextIndex ..< endEnd])]
//
//            if  let cur = cur,let net = net,cur >= net {
//                num += cur
//            }else{
//                let startEnd = s.index(index, offsetBy: 1)
//                let cur = dict[String(s[index ..< startEnd])]
//                num -= cur!
//            }
//        }else {
//            let startEnd = s.index(index, offsetBy: 1)
//            let cur = dict[String(s[index ..< startEnd])]
//            num += cur!
//        }
//
//    }
//    return num
//
//}
//
////romanToInt("XXVII")
////romanToInt("LVIII")
//
//romanToInt("MCMXCIV")

//
////最长公共前缀
//func longestCommonPrefix(_ strs: [String]) -> String {
//    //如果是空串
//    if(strs.isEmpty){
//        return ""
//    }
//    //默认一个最长子串
//    var ans = strs[0]
//    //遍历字符串数组 两两比较  取出当前的最小子串
//    for i in 1..<strs.count {
//        let currentStr = strs[i]
//        var lastIndex = -1
//        for j in 0..<min(ans.count,currentStr.count) {
//
//            print("i = \(i),ans= \(ans),curr = \(currentStr),j = \(j)")
//            lastIndex = j
//            if ans[ans.index(ans.startIndex, offsetBy: j)] != currentStr[currentStr.index(currentStr.startIndex, offsetBy: j)] {
//                lastIndex -= 1
//                break
//            }
//        }
//        //如果当前的最小子串比默认的子串小 那么就ans 替换成较小的一个
//        if(lastIndex == -1){//如果一个相等的都没有
//            return ""
//        }
//        let temp = String(ans[ans.startIndex ... ans.index(ans.startIndex, offsetBy: lastIndex)])
//        if temp.isEmpty {
//            return ""
//        }
//        if temp.count < ans.count {
//            ans = String(temp)
//        }
//    }
//    return ans
//}
//
//longestCommonPrefix(["dog","racecar","car"])
//
//longestCommonPrefix(["flower","flow","flight"])
//longestCommonPrefix(["c","c"])

//
////有效的括号
//func isValid(_ s: String) -> Bool {
//    //数组模拟栈
//    var stackArr:[Character] = []
//    //遍历字符串如果是左括号就入栈 如果是右括号就出栈 出栈匹配的话 那么就x继续遍历 如果遍历完之后stack是空那么就合法 否则不合法
//    //'('，')'，'{'，'}'，'['，']'
//    for c in s {
//        if (c == "(" || c == "{" || c == "[") {
//            stackArr.append(c)
//        }else if  c == "}" {
//
//            guard !stackArr.isEmpty else {
//                return false
//            }
//            let char = stackArr[stackArr.count - 1]
//            if char == "{" {
//                stackArr.remove(at: stackArr.count - 1)
//            }else {
//                return false
//            }
//
//        }else if  c == "]" {
//            guard !stackArr.isEmpty else {
//                return false
//            }
//
//            let char = stackArr[stackArr.count - 1]
//            if char == "[" {
//                stackArr.remove(at: stackArr.count - 1)
//            }else {
//                return false
//            }
//
//        }else if  c == ")" {
//            guard !stackArr.isEmpty else {
//                return false
//            }
//            let char = stackArr[stackArr.count - 1]
//           if char == "(" {
//               stackArr.remove(at: stackArr.count - 1)
//           }else {
//               return false
//           }
//        }
//
//
//    }
//    if !stackArr.isEmpty {
//        return false
//    }
//
//    return true
//}
//
//isValid("()[]{}")
//
////
//isValid("([)]")

// 链表

//public class ListNode {
//     public var val: Int
//     public var next: ListNode?
//     public init(_ val: Int) {
//         self.val = val
//         self.next = nil
//     }
//}
//
//
//
//func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//
//    var p = ListNode(-1)
//    let s = p
//
//    var leftP = l1;
//    var rightP = l2
//    //1 2 4 1 3 4
//    while leftP != nil && rightP != nil {
//        if leftP!.val > rightP!.val {
//
//            print("测试--2链表小")
//            p.next = rightP
//            rightP = rightP!.next
//        }else {
//            p.next = leftP
//            leftP = leftP!.next
//            print("测试--1链表小")
//
//        }
//        p = p.next!
//
//    }
//
//    if let _ = leftP{
//        p.next = leftP!
//    }
//    if let _ = rightP{
//        p.next = rightP!
//    }
//
//    return s.next
//}
//
//// [1,2,4]
////[1,3,4]
//var list1 = ListNode(1)
//list1.next = ListNode(2)
//list1.next?.next = ListNode(4)
//
//var list2 = ListNode(1)
//list2.next = ListNode(3)
//list2.next?.next = ListNode(4)
//
//var mergeNode = mergeTwoLists(list1, list2)
//
//while mergeNode != nil {
//    print(mergeNode!.val)
//    mergeNode = mergeNode?.next
//}


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
//KMP算法详解：http://www.ruanyifeng.com/blog/2013/05/Knuth–Morris–Pratt_algorithm.html
//Sunday 算法：https://leetcode-cn.com/problems/implement-strstr/solution/python3-sundayjie-fa-9996-by-tes/

//sunday 算法 最坏的情况是O(nm) 平均是O()
/*
 匹配机制：
 目标字符串String

 模式串 Pattern

 当前查询索引 idx （初始为0）

 待匹配字符串 str_cut : String [ idx : idx + len(Pattern) ]

 每次匹配都会从 目标字符串中 提取 待匹配字符串与 模式串 进行匹配：

 若匹配，则返回当前 idx

 不匹配，则查看 待匹配字符串 的后一位字符 c：

 若c存在于Pattern中，则 idx = idx + 偏移表[c]

 否则，idx = idx + len(pattern)

 Repeat Loop 直到 idx + len(pattern) > len(String)

 偏离表：
 偏移表的作用是存储每一个在 模式串 中出现的字符，在 模式串 中出现的最右位置到尾部的距离+1
例如 aab：
 a 的偏移位就是 len(pattern)-1 = 2
 b 的偏移位就是 len(pattern)-2 = 1
 其他的字符均为 len(pattern)+1 = 4

 */
func strStr(_ haystack:String,_ needle:String) -> Int {
    print("needle.count= \(needle.count) haystack.count = \(haystack.count)")

    if needle.count > haystack.count {
        return -1
    }
    
    if needle.isEmpty || needle == haystack {
        return 0
    }
    
    //生成偏差表
    var offsetTable = [Character:Int]()
    for index in 0 ..< needle.count {
        offsetTable[needle[needle.index(needle.startIndex, offsetBy: index)]] = needle.count - index
    }
    
    print("offsetTable = \(offsetTable)")

    
    //开始遍历的指针
    var idx = 0
    while idx + needle.count <= haystack.count {
        //获取待匹配的字符
        let strIndex = haystack.index(haystack.startIndex, offsetBy: idx);
        print("获取待匹配的字符 strIndex = \(strIndex)")

        let endIndex = haystack.index(haystack.startIndex, offsetBy:idx + needle.count)
        print("获取待匹配的字符 endIndex = \(endIndex)")

        let str_cut = String(haystack[strIndex ..< endIndex])
        print("str_cut = \(str_cut)")
        if str_cut == needle {
            return idx
        }else {
            //处理边界情况
            if idx + needle.count >= haystack.count {
                return -1
            }
            //不匹配的情况下 根据下一个字符去偏移 idx
            
            let charIndex = haystack.index(haystack.startIndex, offsetBy: idx + needle.count )
            let cur_char = haystack[charIndex]
            print("不匹配的情况下 charIndex = \(charIndex) cur_char = \(cur_char)")

            if offsetTable[cur_char] != nil {
                idx += offsetTable[cur_char]!
            }else {
                idx += needle.count + 1
            }
            
            print("对比结束后的idx = \(idx)")
        }
    }
    
    return (idx + needle.count >= haystack.count) ? -1 : idx
}

//strStr("aaaaa", "bba")

//strStr("hello", "ll")

//KMP

//38 报数
//当前数是对前一个数的读数
//func countAndSay(_ n: Int) -> String {
//
//    if(n == 1){
//        return "1"
//    }
//    //当前数需要获取上一个数
//    let str = countAndSay(n - 1)
//    let zero:Character = "0"
//
//    //数组保存读取的结果
//    var res:[Int] = [Int]()
//    var count = 0;
//    var cha = str[str.startIndex]
//    for value in str {
//        //相等 计数器加一
//        if value == cha {
//            count += 1
//        }else {//不相等 切换char count 而且要读取了
//            res.append(count)
//            res.append(Int(cha.asciiValue! - zero.asciiValue!))
//            cha = value
//            count = 1
//        }
//    }
//    res.append(count)
//    res.append(Int(cha.asciiValue! - zero.asciiValue!))
//    return res.compactMap { String($0) }.joined(separator: "")
//
//}
//
//countAndSay(2)
//countAndSay(5)
//countAndSay(30)

//53 最大子序和
//暴力解法 O(n^2)
//func maxSubArray(_ nums: [Int]) -> Int {
//
//    var max = Int.min
//
//    for i_index in 0 ..< nums.count {
//        var sum = 0
//        for j_index in i_index ..< nums.count {
//            sum += nums[j_index]
//            if sum > max {
//                max = sum
//            }
//        }
//    }
//    return max
//}
//
//maxSubArray([-2,1,-3,4,-1,2,1,-5,4])

//动态规划 O(n)
/*
如果 sum > 0，则说明 sum 对结果有增益效果，则 sum 保留并加上当前遍历数字
如果 sum <= 0，则说明 sum 对结果无增益效果，需要舍弃，则 sum 直接更新为当前遍历数字
*/
//func maxSubArray(_ nums: [Int]) -> Int {
//    var m = Int.min
//    var sum = 0
//    for value in nums {
//        if sum > 0 {
//             sum += value//sum 有增益的效果 后续可能会出现最大
//        }else {//sum 有减益的效果 后续不可能出现连续的最大 所以直接重新开始计算
//            sum = value
//        }
//        m = max(sum, m)
//    }
//    return m
//}
//maxSubArray([-2,1,-3,4,-1,2,1,-5,4])

//分治思想的解法  这个暂时没有去研究


// 66 加一
//func plusOne(_ digits: [Int]) -> [Int] {
//    var carry = 0;
//    var arr = Array(digits)
//    for index in (0..<digits.count).reversed() {
//        if digits[index] == 9 {
//            arr[index] = 0
//            carry = 1
//        }else {
//            arr[index] += 1
//            carry = 0
//            break;
//        }
//    }
//    if(carry == 1){
//        arr.insert(1, at: 0)
//    }
//    return arr;
//}
//
//plusOne([4,3,2,1])
//plusOne([9,9,9,9])
//plusOne([4,9,9,9])

//x的平方根
//https://leetcode-cn.com/problems/sqrtx/solution/er-fen-cha-zhao-niu-dun-fa-python-dai-ma-by-liweiw/
//func mySqrt(_ x: Int) -> Int {
//    if x == 0 {
//        return 0
//    }
//    var left = 1
//    var right = Int(x / 2)
//    while left < right {
//        let mid =  left + Int(((right + 1) - left )/2)//这里一定取右中位数，如果取左中位数，代码会进入死循环 所以加一 要不会造成死循环 比如 9
//        let square = mid * mid
//        if square > x {
//            right = mid - 1
//        }else {
//            left = mid
//        }
//    }
//    return Int(left)
//}
//mySqrt(15)


//70. 爬楼梯
// f(n) = f(n-1) + f(n-2)
//func climbStairs(_ n: Int) -> Int {
//    if n<3 {
//        return n
//    }
//    var first = 1
//    var second = 2
//    for _ in 3 ..< n+1 {
//        let next = first + second
//        first = second
//        second = next
//    }
//    return second
//}
//
//climbStairs(3)

//88. 合并两个有序数组

//从头开始遍历的话 那么需要一个新的m 个控件的数组存储nums1里面的值 然后遍历把所有的值存储到num1里面去

// 2 第二种方法是把 尾部开始存储 就能节省m个控件

//func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//
//    var mindex = m-1
//    var nindex = n-1
//    var mergeIndex = m+n-1
//    while mindex >= 0 && nindex >= 0 {
//        if nums1[mindex] > nums2[nindex] {
//            nums1[mergeIndex] = nums1[mindex]
//            mindex -= 1
//        }else {
//            nums1[mergeIndex] = nums2[nindex]
//            nindex -= 1
//        }
//        mergeIndex -= 1
//    }
//
//    while mindex >= 0 {
//        nums1[mergeIndex] = nums1[mindex]
//        mergeIndex -= 1
//        mindex -= 1
//    }
//
//    while nindex >= 0 {
//        nums1[mergeIndex] = nums2[nindex]
//        mergeIndex -= 1
//        nindex -= 1
//    }
//}
//var nums1 = [1,2,3,0,0,0]
//var m = 3
//var nums2 = [2,5,6]
//var n = 3
//merge(&nums1, 3, nums2, 3)

