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
//KMP https://blog.csdn.net/stay_foolish12/article/details/89065424
//KMP:https://www.jianshu.com/p/0061b2615c6e
//
//func strStr(_ haystack: String, _ needle: String) -> Int {
//
//    let haystackLen = haystack.count
//    let needleLen = needle.count
//    //构造Next数组 needle 本身和本身对比生成
//
//    var next:[Int] = [Int](repeating: 0, count: needleLen)
//    var i = 0 //当前“截取”的字符串的最后一个字符
//    var j = -1 //当前“截取”的字符串的第一个字符及帮助i值的后移操作
//
//
//    while i<needleLen-1 {
//        if j == -1 || (needle[needle.index(needle.startIndex, offsetBy: i)] == needle[needle.index(needle.startIndex, offsetBy: j)]){
//            print(111)
//            i+=1
//            j+=1
//            next[i] = j + 1
//        }else{
//            j = next[j] - 1
//        }
//    }
//    print("next = \(next)")
//    //开始对比  不匹配的话从needle 的next[j]开始匹配
//    i = 0
//    j = 0
//    while i < haystackLen && j < needleLen {
//        if j == -1 || (haystack[haystack.index(haystack.startIndex, offsetBy: j)] == needle[needle.index(needle.startIndex, offsetBy: j)])  {
//            i+=1
//            j+=1
//            print("KMP前进: i = \(i) j = \(j)")
//
//        }else{
//            j = next[j]-1
//            print("KMP回退: i = \(i) j = \(j)")
//
//        }
//    }
//    print("i = \(i)")
//    if j == needleLen {
//        return i-j
//    }else{
//        return -1
//    }
//}
//strStr("hello", "ll")
//strStr("aaaaa", "bba")

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

// */
//func strStr(_ haystack:String,_ needle:String) -> Int {
//    print("needle.count= \(needle.count) haystack.count = \(haystack.count)")
//
//    if needle.count > haystack.count {
//        return -1
//    }
//
//    if needle.isEmpty || needle == haystack {
//        return 0
//    }
//
//    //生成偏差表
//    var offsetTable = [Character:Int]()
//    for index in 0 ..< needle.count {
//        offsetTable[needle[needle.index(needle.startIndex, offsetBy: index)]] = needle.count - index
//    }
//
//    print("offsetTable = \(offsetTable)")
//
//
//    //开始遍历的指针
//    var idx = 0
//    while idx + needle.count <= haystack.count {
//        //获取待匹配的字符
//        let strIndex = haystack.index(haystack.startIndex, offsetBy: idx);
//        print("获取待匹配的字符 strIndex = \(strIndex)")
//
//        let endIndex = haystack.index(haystack.startIndex, offsetBy:idx + needle.count)
//        print("获取待匹配的字符 endIndex = \(endIndex)")
//
//        let str_cut = String(haystack[strIndex ..< endIndex])
//        print("str_cut = \(str_cut)")
//        if str_cut == needle {
//            return idx
//        }else {
//            //处理边界情况
//            if idx + needle.count >= haystack.count {
//                return -1
//            }
//            //不匹配的情况下 根据下一个字符去偏移 idx
//
//            let charIndex = haystack.index(haystack.startIndex, offsetBy: idx + needle.count )
//            let cur_char = haystack[charIndex]
//            print("不匹配的情况下 charIndex = \(charIndex) cur_char = \(cur_char)")
//
//            if offsetTable[cur_char] != nil {
//                idx += offsetTable[cur_char]!
//            }else {
//                idx += needle.count + 1
//            }
//
//            print("对比结束后的idx = \(idx)")
//        }
//    }
//
//    return (idx + needle.count >= haystack.count) ? -1 : idx
//}

//strStr("aaaaa", "bba")

//strStr("hello", "ll")
