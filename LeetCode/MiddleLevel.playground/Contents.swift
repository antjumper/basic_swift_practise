import UIKit
/// leetCode 中等难度的题目
//2. 两数相加
//给出两个 非空 的链表
//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//
//    var p = l1
//    var q = l2
//    let head = ListNode(0)//默认的头结点
//    var carry = 0
//    var cur = head
//    while p != nil || q != nil {
//        let x = p?.val ?? 0
//        let y = q?.val ?? 0
//        cur.next = ListNode( (x + y + carry) % 10 )
//        carry = (x + y + carry) / 10
//        //往下走
//        p = p?.next
//        q = q?.next
//        cur = cur.next!
//    }
//
//    if carry != 0 {
//        cur.next = ListNode(carry)
//    }
//
//    return head.next
//
//}
////12
//let list1 = ListNode(2)
//list1.next = ListNode(1)
//
////28
//let list2 = ListNode(8)
//list2.next = ListNode(2)
//
//let node = addTwoNumbers(list1,list2)
//print(node!)


//3. 无重复字符的最长子串
//解法一 暴力解法 O(n*n*n)
//func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    //判定一个字符串是不是没有重复子串的
//    func isAllUnique(_ s:String) -> Bool{
//        var table = Set<Character>()
//        for value in s {
//            if table.contains(value) {
//                return false
//            }else {
//                table.insert(value)
//            }
//        }
//        return true
//    }
//
//    //枚举所有的字符串
//    var maxLength = 0
//
//    for i in 0..<s.count {
//
//        for j in i..<s.count {
//            //当前的字符串是
//            let start = s.index(s.startIndex, offsetBy: i)
//            let end = s.index(s.startIndex, offsetBy: j)
//            let temp = String(s[start ..< end])
//            print(temp)
//            if isAllUnique(temp) {
//                maxLength = max(temp.count, maxLength)
//            }
//        }
//    }
//
//    return maxLength
//
//}
//解法二 滑动窗口的方法  超时了 更不用说方法一了
/*
 时间复杂度：
 
 O(2n)=O(n)，在最糟糕的情况下，每个字符将被i 和 j 访问两次。

 空间复杂度：O(min(m,n))，与之前的方法相同。滑动窗口法需要O(k) 的空间，其中 k 表示 Set 的大小。而 Set 的大小取决于字符串
n 的大小以及字符集 / 字母
m 的大小。
 */
//func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    var container = Set<Character>()
//    var i = 0
//    var j = 0
//    var maxLength = 0
//    while i < s.count  && j < s.count {
//        //当前的值
//        let i_value = s[s.index(s.startIndex, offsetBy: i)]
//
//        let j_value = s[s.index(s.startIndex, offsetBy: j)]
//
//        if !container.contains(j_value) {//不包含
//            container.insert(j_value)
//            j += 1
//            maxLength = max(j-i, maxLength)
//        }else {
//            container.remove(i_value)
//            i += 1
//        }
//    }
//    return maxLength
//
//}

//优化滑动窗口  还是超时
//func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    var container = [Character:Int]()
//    var i = 0
//    var j = 0
//    var maxLength = 0
//    let sss:[Character] = [Character](s)
//    while i < s.count  && j < s.count {
//        //当前的值
////        let i_value = s[s.index(s.startIndex, offsetBy: i)]
////
////        let j_value = s[s.index(s.startIndex, offsetBy: j)]
//
//        let i_value = sss[i]
//        let j_value = sss[j]
//
//        if container[j_value] == nil {//不包含
//            container[j_value] = j
//            j += 1
//            maxLength = max(j-i, maxLength)
//        }else { //包含的话 直接平移到 重复元素的下一位就可以了
//            i = container[i_value]! + 1
//            container.removeValue(forKey: i_value)
//        }
//    }
//    return maxLength
//
//}
//第三种方法 终于过了
//func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    let sss = [Character](s)
//    var i = 0
//    var j = 0
//    var table = [Character:Int]()
//    var maxLen = 0
//    while j < sss.count {
//        let value = sss[j]
//        if table[value] != nil {
//            i = max(i, table[value]! + 1)
//        }
//       maxLen =  max(j - i + 1, maxLen)
//       //每次更新坐标
//       table[value] = j
//        j += 1
//    }
//
//    return maxLen
//}
//
//lengthOfLongestSubstring("abcabcbb")
//lengthOfLongestSubstring("bbbbb")
//lengthOfLongestSubstring("pwwkew")

//5. 最长回文子串 
// 方法一 暴力检索 时间复杂度O(n*n*n) 空间复杂度O(1)  遍历所有的子串 注意子串和子序列的区别   然后判定子串是不是回文串
//func longestPalindrome(_ s: String) -> String {
//    //检测是不是一个回文串
//    func isPalindrome(_ arr:[Character]) -> Bool {
//        for i in 0 ..< arr.count/2 {
//            if arr[i] != arr[arr.count - 1 - i] {
//                return false
//            }
//        }
//        return true
//    }
//    let sss = [Character](s)
//    var maxLen = 0
//    var tempMax = [Character]()
//    for i in 0..<sss.count {
//        for j in i..<sss.count {
//            //验证[i,j]是不是回文串
//            let temp = [Character](sss[i..<(j+1)])
//            if isPalindrome(temp){
//                if j-i+1 >  maxLen{
//                    maxLen = j-i+1
//                    tempMax = temp
//                }
//            }
//        }
//    }
//    return String(tempMax)
//}

//方法2 最长公共子串的方法  时间复杂度：两层循环 O(n²) 空间复杂度 O(n²)

//https://leetcode-cn.com/problems/longest-palindromic-substring/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-bao-gu/
//func longestPalindrome(_ s: String) -> String {
//    if s.isEmpty {
//        return ""
//    }
//    //倒置字符串 找公共子串
//    let sss:[Character] = [Character](s)
//    let reverseS:[Character] = s.reversed()
//
//    //首先建立一个二维数组 初始化都是零 里面用来保存公共子串的长度
//    var arr:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: s.count), count: s.count)
//    var maxLen = 0
//    var end = 0
//    //如果i = j  那么 a[i][j] = a[i-1][j-1] + 1 如果 i=0 || j=0  那么arr[i][j] = 1
//    for i in 0 ..< sss.count {
//
//        for j in 0 ..< reverseS.count {
//
//            if sss[i] == reverseS[j] {
//                if i == 0 || j == 0 {
//                    arr[i][j] = 1
//                }else {
//                    arr[i][j] = arr[i-1][j-1] + 1
//                }
//            }
//            // 公共子串不一定是最大的回文 可以判定最后一个字符下标是不是和原来的一样
//            let beforeReverseStart = reverseS.count - (j + 1)
//            let beforeReverseEnd = beforeReverseStart + arr[i][j] - 1
//            if (arr[i][j] > maxLen) && beforeReverseEnd == i {
//                maxLen = arr[i][j]
//                end = i //以 i 位置结尾的字符
//            }
//        }
//    }
//
//    return String(sss[(end - maxLen + 1)..<end + 1])
//}

//解法三 用一个一维的数组存储数据 因为 arr[i][j] = arr[i-1][j-1] + 1  只是用到了上一列j-1的计算结果而已

//func longestPalindrome(_ s: String) -> String {
//
//    if s.isEmpty {
//        return ""
//    }
//    var arr = [Int](repeating: 0, count: s.count)
//    let reverse:[Character] = s.reversed()
//    let sss = [Character](s)
//    var maxLen = 0
//    var endIndex = 0
//    for i in 0 ..< sss.count {
//        //a[8]=a[7]+1 为什么倒序列遍历呢 因为 a[8]正序的时候a[7]已经被覆盖了 所以倒序
//        for j in (0 ..< reverse.count).reversed() {
//            if sss[i] == reverse[j] {
//                if j == 0 || i == 0{
//                    arr[j] = 1
//                }else {
//                 arr[j] = arr[j-1] + 1
//                }
//            }else {
//                arr[j] = 0
//            }
//            let beforeReverseStarr = reverse.count - (j + 1)
//            let beforeReverseEnd =  beforeReverseStarr + arr[j] - 1
//            if arr[j] > maxLen  && beforeReverseEnd == i{
//                maxLen = arr[j]
//                endIndex = i
//            }
//        }
//    }
//    return String(sss[(endIndex - maxLen + 1) ..< (endIndex + 1)])
//}

//第三种 优化暴力方法 假设 p[i,j] = s[i,j] 是回文串 那么 p[i,j]   是回文的话等价于 p[i + 1,j-1] && s[i] == s[j]
//初始化长度是1的 p[i,j]回文字符串 那么推进 3，5.。。
//初始化长度是2的 p[i,j]回文字符串 那么推进 4，6.。。

//func longestPalindrome(_ s: String) -> String {
//    let sss = [Character](s)
//    var res = [Character]()
//    var arr = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
//    var maxLen = 0
//    for len in 1 ..< s.count + 1 { //字符串长度
//
//        for start in 0 ..< s.count {
//
//            let end = start + len - 1
//            if end >= s.count {
//                break
//            }
//            if (len == 1 || len == 2 || arr[start + 1][end - 1])
//                && sss[start] == sss[end]{
//
//                arr[start][end] = true
//            }
//
//            if arr[start][end] && len > maxLen {
//                maxLen = len
//                res = [Character](sss[start ..< (end + 1)])
//            }
//
//        }
//
//    }
//    return String(res)
//}
//
////输入: "babad" 输出: "bab" "aba" 也是一个有效答案。  输入: "cbbd" "bb"
//
//longestPalindrome("babad")
//longestPalindrome("cbbd")
//longestPalindrome("abc435cba")
