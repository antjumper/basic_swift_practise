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

//KMP
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

//283. 移动零
//func moveZeroes(_ nums: inout [Int]) {
//  //有几个零就往前移动几位 当前移动位设置为0
//   var zeroCount = 0
//    for index in 0..<nums.count {
//        if nums[index] == 0 {
//            zeroCount += 1
//        }else {
//            nums[index - zeroCount] = nums[index]
//            if zeroCount != 0 {
//               nums[index] = 0
//            }
//        }
//    }
//}
//var nums = [0,1,0,3,12]
//moveZeroes(&nums)
//


//101 对称二叉树
//递归和队列实现  队列实现 其实就是层次遍历 真是牛逼了
//地址:https://leetcode-cn.com/problems/symmetric-tree/solution/dong-hua-yan-shi-101-dui-cheng-er-cha-shu-by-user7/
//递归实现

//
//func isSymmetric(_ root: TreeNode?) -> Bool {
//
//    func isMirror(_ left:TreeNode?,_ right:TreeNode?) -> Bool{
//        if left == nil && right == nil {return true}
//        if left == nil || right == nil {return false}
//        return (left!.val == right!.val)
//               && isMirror(left?.right, right?.left)
//               && isMirror(left?.left, right?.right)
//    }
//
//    return isMirror(root, root)
//}
//var root:TreeNode = TreeNode(1)
//var left = TreeNode(2)
//var right = TreeNode(2)
//root.left = left
//root.right = right
//
//var left_1 = TreeNode(3)
//var right_1 = TreeNode(4)
//left.left = left_1
//left.right = right_1
//
//var left_2 = TreeNode(4)
//var right_2 = TreeNode(3)
//right.left = left_2
//right.right = right_2
//
//isSymmetric(root)

//迭代法
//func isSymmetric(_ root: TreeNode?) -> Bool {
//    if root == nil {
//        return true
//    }
//    var q =  Queue<TreeNode>()
//    q.enqueue(root!)
//    q.enqueue(root!)
//    while !q.isEmpty {
//        var t1:TreeNode? = q.dequeue()
//        var t2:TreeNode? = q.dequeue()
//        if t1 == nil && t2 == nil {continue}
//        if t1 == nil || t2 == nil {return false}
//        if t1!.val != t2!.val {return false}
//
////        q.enqueue(t1!.left)
////        q.enqueue(t2!.right)
////        q.enqueue(t1!.right)
////        q.enqueue(t2!.left)
//
//    }
//    return true
//}


////104. 二叉树的最大深度

//public func deepthOfTreeUsedQueue(root:BinaryNode<Element>?) -> Int {
//      if root == nil {
//          return 0
//      }
//
//      var depth:Int = 0
//      var queue = Queue<BinaryNode>()
//      queue.enqueue(root!)
//
//      while !queue.isEmpty {
//          depth += 1 //每次数了之后往里面放一层
//
//          var numberOfLevel = queue.count
//
//          while numberOfLevel > 0 {
//              let node = queue.dequeue()
//
//              if node!.leftChild != nil {
//                  queue.enqueue(node!.leftChild!)
//              }
//              if node!.rightChild != nil {
//                 queue.enqueue(node!.rightChild!)
//              }
//              numberOfLevel -= 1
//          }
//
//      }
//      return depth
//
//}

//
////迭代法
//class Solution {
//    //自定义一个Pair对象，用来保存(栈深度，节点)
//    class Pair {
//        final int cur_depth;
//        final TreeNode node;
//        Pair(int cur_depth,TreeNode node) {
//            this.cur_depth = cur_depth;
//            this.node = node;
//        }
//    }
//
//    public int maxDepth(TreeNode root) {
//        if(root==null) {
//            return 0;
//        }
//        Stack<Pair> stack = new Stack<Pair>();
//        //将(1,root)加入栈后不断遍历栈
//        stack.add(new Pair(1,root));
//        int max_depth = 0;
//        while(!stack.empty()) {
//            //首先从栈中弹出元素
//            Pair p = stack.pop();
//            int cur_depth = p.cur_depth;
//            TreeNode node = p.node;
//            //如果弹出的节点不为空
//            if(node!=null) {
//                //比较这个节点的深度和depth的大小
//                max_depth = Math.max(max_depth,cur_depth);
//                //将 (当前深度+1，left)放入栈中
//                stack.add(new Pair(cur_depth+1,node.left));
//                //同理将(当前深度+1,right)放入栈中
//                stack.add(new Pair(cur_depth+1,node.right));
//            }
//        }
//        return max_depth;
//    }
//}

////递归法  和上个题目很是类似
//func maxDepth(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    return max(maxDepth(root!.left),maxDepth(root!.right))+1
//}
//
//var root:TreeNode = TreeNode(1)
//var left = TreeNode(2)
//var right = TreeNode(2)
//root.left = left
//root.right = right
//
//var left_1 = TreeNode(3)
//var right_1 = TreeNode(4)
//left.left = left_1
//left.right = right_1
//
//var left_2 = TreeNode(4)
//var right_2 = TreeNode(3)
//right.left = left_2
//right.right = right_2
//right_2.left = TreeNode(7)
//maxDepth(root)

//108. 将有序数组转换为二叉搜索树

//这个是 递归的调用
//func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
//
//    func recursion_sortedArrayToBSF(_ nums:[Int],_ start:Int,_ end:Int) -> TreeNode?{
//        if start == end {
//            return nil
//        }
//
//        let mid:Int = (start + end) >> 1
//        let root:TreeNode = TreeNode(nums[mid])
//        root.left = recursion_sortedArrayToBSF(nums, start, mid)
//        root.right = recursion_sortedArrayToBSF(nums, mid + 1, end)
//        return root
//    }
//
//    return recursion_sortedArrayToBSF(nums, 0, nums.count)
//}
//
//let node = sortedArrayToBST([-10,-3,0,5,9])
//print(node!)
//这个是 迭代方式的实现  分队列 和 栈 实现 不太一样哈 ！！！棒棒的！！！
//https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-24/

//118. 杨辉三角
//func generate(_ numRows: Int) -> [[Int]] {
//    var arr = [[Int]]()
//
//
//    for i_index in 0 ..< numRows {
//        var item_arr = [Int]()
//        for j_index in 0 ..< i_index + 1 {
//
//            print("i = \(i_index),j = \(j_index)")
//           if (j_index == 0 || (i_index == j_index)){
////               item_arr[j_index] = 1
//            item_arr.append(1)
//
//           }else {
////               item_arr[j_index] = arr[i_index - 1][j_index - 1] + arr[i_index - 1][j_index]
//            item_arr.append(arr[i_index - 1][j_index - 1] + arr[i_index - 1][j_index])
//
//           }
//        }
//        arr.append(item_arr)
//    }
//    return arr
//}

//generate(5)

//121. 买卖股票的最佳时机
//买卖股票的最佳时机  和最大的升序类似  只是这个是相加的相邻两个数据的的差值
//func maxProfit(_ prices: [Int]) -> Int {
//
//    if prices.isEmpty {
//        return 0
//    }
//
//    var mx = 0
//    var sum = 0
//    for index in 1 ..< prices.count{
//        if sum > 0 {
//            sum += prices[index] - prices[index - 1]
//        }else {
//            sum = prices[index] - prices[index - 1]
//        }
//        mx = max(sum, mx)
//
//    }
//
//    return mx
//}
//
//maxProfit([7,1,5,3,6,4])
//maxProfit([7,6,4,3,1])

//122. 买卖股票的最佳时机 II
//这个题暴力算法 看不懂 我的个神呀 想死了  但是反而贪心算法是最简单也很好理解的
//有利润可图就参加买卖

//func maxProfit(_ prices: [Int]) -> Int {
//    if(prices.isEmpty){
//        return 0
//    }
//    var profit = 0
//    for index in 1..<prices.count {
//
//        if (prices[index] - prices[index - 1]) > 0  {
//            profit += prices[index] - prices[index - 1]
//        }
//    }
//
//    return profit
//}
//
//maxProfit([7,1,5,3,6,4])
//
//maxProfit([1,2,3,4,5])
//
//maxProfit([7,6,4,3,1])

//125. 验证回文串
// 其实就是双指针  前后对比就行了  取后六位比较（str[l] | 32 ) != ( str[r] | 32 ) ) 牛逼的还是人不
// A-Z 0100 0001   ---  0101 1010
// a-z 0110 0001   ---  0111 1010  后五位能忽略大小写
// 0-9 0011 0000   ---  0011 1001  后四位就能比较啦

//这个题先剔除不合规的字符串最好处理

//func isPalindrome(_ s: String) -> Bool {
//
//    if s.isEmpty {
//        return true
//    }
//    func isNumberOrAlpha(char:Character) -> Bool {
//        if let ui = char.asciiValue{
//            let charInt = Int(ui)
//            if (charInt > 47 && charInt < 58) ||
//            (charInt > 64 && charInt < 91) ||
//            (charInt > 96 && charInt < 123) {
//                return true
//            }
//            return false
//        }else {
//            return false
//        }
//    }
//
////    var str = String()
////    for value in s.lowercased() {
////        if isNumberOrAlpha(char: value) {
////            str.append(value)
////        }
////    }
//    let chars = "a"..."z", nums = "0"..."9"
//    let str = [Character](s.lowercased().filter({ chars.contains(String($0)) || nums.contains(String($0)) }))
//
//    if str.isEmpty {
//           return true
//    }
//
//    var strIndex = 0
//    var endIndex = str.count - 1
//    while strIndex < endIndex {
//        let strChar = str[str.index(str.startIndex, offsetBy: strIndex)]
//        let endChar = str[str.index(str.startIndex, offsetBy: endIndex)]
//        if strChar == endChar{
//            strIndex += 1
//            endIndex -= 1
//        }else {
//            return false
//        }
//    }
//
//    return true
//}
//isPalindrome("A man, a plan, a canal: Panama")
//isPalindrome("race a car")
//isPalindrome(".,")

//136. 只出现一次的数字
//hash 表存储 每个数为key 有j就删除  剩余一个
// 还有就是为操作 异或  A^A = 0  A ^ A ^A = A A^0 = A
//func singleNumber(_ nums: [Int]) -> Int {
//    var item = 0
//    for value in nums {
//        item ^= value
//    }
//    return item
//}
//
//singleNumber([4,1,2,1,2])

//141. 环形链表
//方法一 就是使用Set 存储Node 遍历的时候如果node已经在set中那么就说明 是环形列表 但是 Set存储需要遵循
//Hashbale协议 所以没有写
//func hasCycle(head:ListNode) -> Bool{
//
////    var s:Set<ListNode> = Set<ListNode>()
//
//
//    return false
//}

//Java
//public boolean hasCycle(ListNode head) {
//    Set<ListNode> nodesSeen = new HashSet<>();
//    while (head != null) {
//        if (nodesSeen.contains(head)) {
//            return true;
//        } else {
//            nodesSeen.add(head);
//        }
//        head = head.next;
//    }
//    return false;
//}

//作者：LeetCode
//链接：https://leetcode-cn.com/problems/linked-list-cycle/solution/huan-xing-lian-biao-by-leetcode/
//来源：力扣（LeetCode）
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

//解法二 快慢指针
/*
 链表中不存在环：
 快指针将会首先到达尾部，其时间取决于列表的长度，也就是O(n)

 链表中存在环：
 我们将慢指针的移动过程划分为两个阶段：非环部分与环形部分：
 慢指针在走完非环部分阶段后将进入环形部分：此时，快指针已经进入环中
 迭代次数=非环部分长度=N
 两个指针都在环形区域中：考虑两个在环形赛道上的运动员 - 快跑者每次移动两步而慢跑者每次只移动一步。其速度的差值为 1，因此需要经过
 二者之间距离 除以 速度差值
 二者之间距离次循环后，快跑者可以追上慢跑者。这个距离几乎就是 "
 环形部分长度 K
 环形部分长度 K" 且速度差值为 1，我们得出这样的结论
 迭代次数=近似于 "环形部分长度 K".

 因此，在最糟糕的情形下，时间复杂度为O(N+K)，也就是O(n)。

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/linked-list-cycle/solution/huan-xing-lian-biao-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
//ListNode 要实现== 协议 != 协议 等等复杂的操作
//func hasCycle(head:ListNode?) -> Bool{
//
//    if head != nil && head?.next != nil {
//        return false
//    }
//    var slow = head
//    var fast = head!.next
//    while slow != fast {
//        if fast != nil && fast?.next != nil {//结尾处时说明没有环
//            return false
//        }
//        slow = slow?.next
//        fast = fast?.next?.next
//    }
//
//    return true
//}

//155. 最小栈

//第一种是两个栈实现
//class MinStack {
//
//   private var elems:[Int] = [Int]()
//   private var mins:[Int] = [Int]()
//    /** initialize your data structure here. */
//   public init() {}
//
//   public func push(_ x: Int) {
//        self.elems.append(x)//大于的话直接进栈
//        let min = self.mins.last
//        if min == nil || x <= min! {
//            self.mins.append(x)
//        }
//    }
//
//    public func pop() {//出栈的时候当等于最小值的时候 切换最小数组的栈
//        let p = self.elems.removeLast()
//        let min = self.mins.last
//        if p == min! {
//           self.mins.removeLast()
//        }
//    }
//
//   public func top() -> Int {
//     return self.elems.last!
//   }
//
//    public func getMin() -> Int {
//        return self.mins.last!
//    }
//}
//还有一个栈实现的  最小值 记录到同一个栈中 判定条件是
//https://leetcode-cn.com/problems/min-stack/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-38/
//let minStack = MinStack();
//minStack.push(-2)
//minStack.push(0)
//minStack.push(-3)
//minStack.getMin()
//minStack.pop()
//minStack.top()
//minStack.getMin()

//["MinStack","push","push","push","getMin","pop","getMin"]
//[[],[0],[1],[0],[],[],[]]
//minStack.push(0)
//minStack.push(1)
//minStack.push(0)
//minStack.getMin()
//minStack.pop()
//minStack.top()
//minStack.getMin()

//160. 相交链表   1主要是消除长度差 方法是 遍历a b 两个节点 a 到尾部时指向b 的头指针 b 遍历到尾部时指向a 就这样 当a和b 相等是 就说明有交叉点 dang  a = b =  null 时说明没有交叉点
//https://leetcode-cn.com/problems/intersection-of-two-linked-lists/solution/tu-jie-xiang-jiao-lian-biao-by-user7208t/

//func getIntersectionNode(_ a:ListNode? ,_ b:ListNode?) ->ListNode? {
//    if a == nil || b == nil {
//        return nil
//    }
//    var pa = a
//    var pb = b
//    while pa != pb {//注意swift中ListNode要遵循 Equatable 协议 swift  真是恶心啊
//        pa = (pa==nil) ? pb :pa?.next
//        pb = (pb == nil) ? pa : pb?.next
//    }
//
//    return pa
//}

//169. 多数元素  出现次数大于 ⌊ n/2 ⌋ 的元素。
//暴力一个一个数个数  双层
//如果用空间 保存的话 那么就简单点 一层循环
//https://leetcode-cn.com/problems/majority-element/solution/qiu-zhong-shu-by-leetcode-2/ 这个提对多种解法具有代表性
//func majorityElement(_ nums: [Int]) -> Int {
//    var dict = [Int:Int]()
//    for item in nums {
//        if dict[item] != nil {
//            dict[item] = dict[item]! + 1
//        }else {
//           dict[item] = 1
//        }
//        if dict[item]! >= (nums.count + 1) >> 1 {
//            return item
//        }
//    }
//    return -1
//}

//majorityElement([3,2,3])
//majorityElement([2,2,1,1,1,2,2])

//171. Excel表列序号  AAA 703  其实就是26进制的原理

//func titleToNumber(_ s: String) -> Int {
//    if s.isEmpty {
//        return 0
//    }
//    let zero:Character = "A"
//    var sum = 0
//    for index in 0..<s.count {
//        sum += Int(powf(26, Float(s.count - index - 1))) * Int((s[s.index(s.startIndex, offsetBy: index)].asciiValue! - zero.asciiValue!) + 1)
//    }
//    return sum
//}
//方法2

//func titleToNumber(_ s: String) -> Int {
//    if s.isEmpty {
//        return 0
//    }
//    let zero:Character = "A"
//    var sum = 0
//    for index in 0..<s.count {
//        let num = Int((s[s.index(s.startIndex, offsetBy: index)].asciiValue! - zero.asciiValue!) + 1)
//        sum = sum * 26 + num
//    }
//    return sum
//}
//
//
//titleToNumber("A")
//
//titleToNumber("AB")
//
//titleToNumber("ZY")

//172. 阶乘后的零

// 2 *5 等于10  10 的个数 0的个数  但是 一到十  分解item成8 = 2 *2 *2 得出 2的个数比5的个数多 那么5的个数等于0 的个数
//https://leetcode-cn.com/problems/factorial-trailing-zeroes/solution/xiang-xi-tong-su-de-si-lu-fen-xi-by-windliang-3/

//func trailingZeroes(_ n: Int) -> Int {
//    var count = 0
//    var num = n
//    while num > 0 {
//        count += Int(num / 5)
//        num = Int(num / 5)
//    }
//    return count
//}
//trailingZeroes(125)

//189. 旋转数组
//https://blog.csdn.net/qq_28584889/article/details/83655019
//func rotate(_ nums: inout [Int], _ k: Int) {
//    if k <= 0 || nums.isEmpty {
//        return
//    }
//    let kk = k % nums.count
//    var count = 0//有多少个元素移动了 这个是关键点
//    for index in 0..<kk {
//        var curr = index
//        var next = (curr + kk) % nums.count
//        var preValue = nums[curr]
//        var nextValue = nums[next]
//        repeat {
//            if count >= nums.count {
//                break
//            }
//            nums[next] = preValue
//            preValue = nextValue
//            curr = next
//            next = (next + kk) % nums.count
//            nextValue = nums[next]
//            count += 1
//        }while (index != curr )
//    }
//}
//var arr = [-1,-100,3,99]
//var arr2 = [1,2,3,4,5,6,7]
//
//rotate(&arr,2)//[3,99,-1,-100]
//rotate(&arr2,3)//[5,6,7,1,2,3,4]

//190. 颠倒二进制位
//func reverseBits(_ n:UInt) ->UInt {
//    var nn:UInt = n
//    var res:UInt = 0
//    var i = 0
//    while i<32 {
//        res = res << 1 //左移动一位 预留出相加位
//        res =  res | (nn & 1) //取出nn 的最后一位 然后和 res相加
//        nn = nn >> 1  //右移动改变当前数字
//        i += 1 //移动的位数相加
//    }
//
//    return res
//}
//
//reverseBits(43261596) //预期结果： 964176192

//191. 位1的个数 32位的
//func hammingWeight(_ n:UInt) -> Int {
//    var i = 0
//    var count = 0
//    var input_n = n
//    while i < 32 {
//        let isOne = input_n & 1
//        input_n >>= 1
//        if isOne == 1 {
//            count += 1
//        }
//        i += 1
//    }
//    return count
//}
//hammingWeight(0b00000000000000000000000010000000)
//hammingWeight(0b00000000000000000000000000001011)

//198. 打家劫舍
//f(n) = max（f(n-1),f(n-2) + x）
//f(-1) = 0 f(-2) = 0
//这是一道动态规划题目：https://leetcode-cn.com/problems/house-robber/solution/da-jia-jie-she-by-leetcode/
//func rob(_ nums: [Int]) -> Int {
//    var curMax = 0
//    var preMax = 0
//
//    for value in nums {
//        let temp = curMax
//        curMax = max(curMax, preMax + value)
//        preMax = temp
//    }
//    return curMax
//}
//
//rob([1,2,3,1])
//rob([2,7,9,3,1])

//202. 快乐数  快慢指针破 循环
//func isHappy(_ n: Int) -> Bool {
//    func squarenum(_ n:Int) -> Int {
//        var nn = n
//        var sum = 0
//        while nn > 0 {
//            let lastOne = nn % 10
//            sum += lastOne * lastOne
//            nn /= 10
//        }
//        return sum
//    }
//
//    var fast = n
//    var slow = n
//    repeat {
//        fast = squarenum(fast)
//        fast = squarenum(fast)
//        slow = squarenum(slow)
//    }while fast != slow
//
//    return slow == 1
//}
//
//isHappy(19)

////204. 计数质数
//https://leetcode-cn.com/problems/count-primes/solution/ru-he-gao-xiao-pan-ding-shai-xuan-su-shu-by-labula/
//func countPrimes(_ n: Int) -> Int {
//
//    if n < 2 {
//        return 0
//    }
//    var notPrime = Set<Int>()
//    var i = 2
//    while i*i<n {
//
//        var j = i*i
//        while j < n {
//            notPrime.insert(j)
//            j += i
//        }
//        i += 1
//    }
//    return n - 2 - notPrime.count //减去 1 减去n
//}
//
//countPrimes(10)

//206. 反转链表
//递归的实现方法 时间复杂度 O（N） 空间复杂度O(N)
//https://www.cnblogs.com/aspirant/p/9199608.html
//func reverseList(_ head: ListNode?) -> ListNode? {
//
//    if head == nil || head?.next == nil {
//        return head
//    }
//    let p = reverseList(head?.next) //注意递归时 p 是 head的后一个元素
//    head?.next?.next = head
//    head?.next = nil
//    return p
//}

//迭代的实现方法  时间复杂度 O（N） 空间复杂度O(1)
//func reverseList(_ head: ListNode?) -> ListNode? {
//
//    if head == nil || head?.next == nil {
//        return head
//    }
//    var pre:ListNode? = nil
//    var cur = head
//    while cur != nil {
//        let temp = cur?.next
//        cur?.next = pre
//        pre = cur
//        cur = temp
//    }
//    return pre
//}

//var list2 = ListNode(1)
//list2.next = ListNode(3)
//let node4 = ListNode(4)
//list2.next?.next = node4
//node4.next = ListNode(6)
//let head = reverseList(list2)
//print(head!)

//217. 存在重复元素

// set  存储判定就行了
//
//func containsDuplicate(_ nums: [Int]) -> Bool {
//
//    var history = Set<Int>()
//    for value in nums {
//        if history.contains(value) {
//            return true
//        }else{
//            history.insert(value)
//        }
//    }
//    return false
//
//}
//
//containsDuplicate([1,2,3,1])

//234. 回文链表
//快慢指针  当为奇数个指针  慢指针 指向中间  快指针指向最后一个元素
// 当为偶数个指针  慢指针指向后半段的开始位置  快指针指向nil

//找到对比的起始点 翻转前半段或者后半段然后开始比较
//func isPalindrome(_ head: ListNode?) -> Bool {
//
//    if(head == nil || head?.next == nil){
//        return false
//    }
//    //快慢指针
//    var fast = head
//    var slow = head
//    //交换前半部分需要的辅助控件
//    var cur = head
//    var pre:ListNode? = nil
//
//    while fast != nil && fast?.next != nil {
//        //保存下不丢失
//        cur = slow
//        //快慢指针
//        slow = slow?.next
//        fast = fast?.next?.next
//        //改变前半部分的指向
//        cur?.next = pre
//        pre = cur
//    }
//    //当为奇数个指针  慢指针 指向中间  快指针指向最后一个元素
//    //当为偶数个指针  慢指针指向后半段的开始位置  快指针指向nil
//    if fast != nil {
//        slow = slow?.next
//    }
//    while pre != nil && slow != nil {
//        if pre?.val == slow?.val {
//            pre = pre?.next
//            slow = slow?.next
//        }else {
//            return false
//        }
//    }
//
//    if pre == nil && slow == nil {
//        return true
//    }else {
//        return false
//    }
//}
//
//var list2 = ListNode(1)
//list2.next = ListNode(2)
//let node4 = ListNode(2)
//list2.next?.next = node4
//node4.next = ListNode(1)
//isPalindrome(list2)

//237. 删除链表中的节点
//func deleteNode (_ node:inout ListNode?,_ deleVal:Int) -> Bool {
//    if node == nil {
//        return false
//    }
//    //第一个就是deleValue
//    if node?.val == deleVal {
//        node = node?.next
//        return true
//    }
//
//    var loopNode = node
//    var pre = node
//    while loopNode != nil {
//        if loopNode?.val != deleVal {
//            pre = loopNode
//            loopNode = loopNode?.next
//        }else { //找到了
//            pre?.next = loopNode?.next
//            loopNode = nil
//            return true
//        }
//    }
//     return false
//}
//方法二  题目知道 不是最后一个结点 所以 交换值之后删除就可
//public void deleteNode(ListNode node) {
//        node.val = node.next.val;
//        node.next = node.next.next;
//}

//var list2: ListNode? = ListNode(1)
//list2!.next = ListNode(2)
//let node4 = ListNode(3)
//list2!.next?.next = node4
//node4.next = ListNode(4)
//deleteNode(&list2,1)
//print(list2!)


//242. 有效的字母异位词

// 一 排序比较 排序的话 学习下排序吧  二 使用哈希表 一个增加计数一个减小计数  结果都是零  那么是异位字符

//操 测试用例上使用了5万个字符  s[s.index(s.startIndex, offsetBy: index)] 这种方式超时了  然后 sss[index] 这种方式就可以通过
//func isAnagram(_ s: String, _ t: String) -> Bool {
////func isAnagram(_ s: [Character], _ t: [Character]) -> Bool {
//
//
//    if s.count != t.count {
//        return false
//    }
//    var table:[Character:Int] = [Character:Int]()
//    let sss = Array(s)
//    let ttt = Array(t)
//    for index in 0..<s.count {
////        let s_cha = s[s.index(s.startIndex, offsetBy: index)]
////        let t_cha = t[t.index(t.startIndex, offsetBy: index)]
//        let s_cha = sss[index]
//        let t_cha = ttt[index]
//        if table[s_cha] != nil {
//            table[s_cha]! += 1
//        }else {
//            table[s_cha] = 1
//        }
//
//        if table[t_cha] != nil {
//            table[t_cha]! -= 1
//        }else {
//            table[t_cha] = -1
//        }
//    }
//    for (_, value) in table {
//        if value != 0 {
//            return false
//        }
//    }
//    return true
//}

//func isAnagram(_ s: String, _ t: String) -> Bool {
//
//    if s.count != t.count {
//        return false
//    }
//    let sss = s.sorted()
//    let ttt = t.sorted()
//    if sss == ttt {
//        return true
//    }else {
//        return false
//    }
//}

//isAnagram("anagram","nagaram")

//268. 缺失数字 先求总的和 减去 每一个值  异或的方法
//方法很多 很有意思 https://leetcode-cn.com/problems/missing-number/solution/que-shi-shu-zi-by-leetcode/
//func missingNumber(_ nums: [Int]) -> Int {
//    let n = nums.count
//    var sum = n * (n + 1) / 2
//
//    for value in nums {
//        sum -= value
//    }
//    return sum
//}
//
//missingNumber([3,0,1])
//
//missingNumber([9,6,4,2,3,5,7,0,1])

//326. 3的幂

//第一种方法 每次除以三 == 0  减小n = n/3 到最后不等于一 的说明除不尽
//二种  三种 等等 https://leetcode-cn.com/problems/power-of-three/solution/3de-mi-by-leetcode/

//func isPowerOfThree(_ n: Int) -> Bool {
//    let i = log10(Double(n)) / log10(3.0)
//    return i.truncatingRemainder(dividingBy: 1) == 1
//}

//方法二 
//func isPowerOfThree(_ n: Int) -> Bool {
//    return n > 0 && 1162261467 % n == 0;
//}
//
//isPowerOfThree(27)

//344. 反转字符串
//func reverseString(_ s: inout [Character]) {
//    if s.isEmpty {
//        return
//    }
//    var left = 0
//    var right = s.count - 1
//    while left < right {
//          let temp = s[left]
//          s[left] = s[right]
//          s[right] = temp
//         left += 1
//         right -= 1
//    }
//}
//var s:[Character] = ["H","a","n","n","a","h"]
//reverseString(&s)

//递归的写法 思考下哈 java 版本
//class Solution {
//    public void reverseString(char[] s) {
//        swap(0, s.length-1, s);
//    }
//
//    public void swap(int start, int end, char[] s) {
//        if(start >= end){
//            return;
//        }
//
//        char temp = s[start];
//        s[start] = s[end];
//        s[end] = temp;
//        swap(start+1, end-1, s);
//    }
//}

//350. 两个数组的交集 II
//解法一 hash表存储  另一个遍历  在hash中查找 题目中可以存在多个相同的值
//func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    //加入 nums1  长度比较小的话
//    var table = [Int:Int]()
//    for value in nums1 {
//        if table[value] != nil {
//            table[value] = table[value]! + 1
//        }else {
//            table[value] = 1
//        }
//    }
//
//    var res = [Int]()
//    for value in nums2 {
//        if table[value] != nil{
//            res.append(value)
//            table[value] = table[value]! - 1
//        }
//        if table[value] != nil && table[value]! == 0 {
//            table.removeValue(forKey: value)
//        }
//    }
//
//    return res;
//}
//
//intersect([1,2,2,1],[2,2])
//intersect([4,9,5],[9,4,9,8,4])

//二分查找法
//func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//
//    func binarySearch(_ nums:[Int],_ left:Int,_ right:Int,_ searchNum:Int) -> Int{
//        if left > right || nums.isEmpty{
//            return -1
//        }
//
//        let mid = (left + right + 1) >> 1
//
//        if nums[mid] == searchNum{
//            return mid
//        }else if nums[mid] > searchNum{
//           return binarySearch(nums, left, mid - 1, searchNum)
//        }else {
//           return binarySearch(nums, mid + 1, right, searchNum)
//        }
//    }
//
//    var res = [Int]()
//    var arr = nums1.sorted()//二分查找必须在有序的基础上
//
//    for value in nums2 {
//       let index = binarySearch(arr, 0, arr.count - 1, value)
//       print("index = \(index)")
//       if index != -1 {
//           res.append(arr[index])
//           arr.remove(at: index)
//       }
//    }
//    return res
//}
//
//intersect([1,2,2,1],[2,2])
//intersect([4,9,5],[9,4,9,8,4])

//解法三使用归并的思路
//func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
////    使用归并的思路
//    let arr_1 = nums1.sorted()
//    let arr_2 = nums2.sorted()
//    var i = 0
//    var j = 0
//    var res = [Int]()
//    while i < arr_1.count && j < arr_2.count {
//        if arr_1[i] < arr_2[j] {
//            i += 1
//        }else if arr_1[i] > arr_2[j] {
//            j += 1
//        }else {
//            res.append(arr_1[i])
//            i += 1
//            j += 1
//        }
//    }
//    return res
//}
//
//intersect([1,2,2,1],[2,2])
//intersect([4,9,5],[9,4,9,8,4])

//371. 两整数之和  不使用 + - 符号实现 使用位运算符 这个比较特殊
//https://leetcode-cn.com/problems/sum-of-two-integers/solution/wei-yun-suan-xiang-jie-yi-ji-zai-python-zhong-xu-y/
/*
 a = 5 = 0101
 b = 4 = 0100
 //异或
 a ^ b = 0001
 a & b = 0100
 
 (a & b << 1) ^ (a) = 1000 ^ 0001 = 1001 = 9
 最后一步 ^ 的时候也可能有进位呀 所以是个循环
 */
//https://leetcode-cn.com/problems/sum-of-two-integers/solution/371-liang-zheng-shu-zhi-he-by-en-zhao/
//这给提很有意思哈 自己也不会
//func getSum(_ a: Int, _ b: Int) -> Int {
//
//    var aaa = a
//    var bbb = b
//    //进位一直存在的话
//    while bbb != 0 {
//       let carry = (aaa & bbb) << 1
//        aaa = (aaa ^ bbb)
//       //也可能存在进位呀 所以去循环
//        bbb = carry
//    }
//    return aaa
//
//}
//
//getSum(20, 30)
//getSum(2, 3)

//387. 字符串中的第一个唯一字符
//func firstUniqChar(_ s: String) -> Int {
//    if s.isEmpty {
//        return -1
//    }
//    var table:[Character:Int] = [Character:Int]()
//    for value in s {
//        if table[value] !=  nil {
//            table[value] = table[value]! + 1
//        }else {
//            table[value] = 1
//        }
//    }
//    for (index,value) in s.enumerated() {
//        if table[value] !=  nil && table[value] == 1  {
//            return index
//        }
//    }
//
//    return -1
//}
//
//firstUniqChar("leetcode")

//412. Fizz Buzz

/*
 1. 如果 n 是3的倍数，输出“Fizz”；

 2. 如果 n 是5的倍数，输出“Buzz”；

 3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。

 */

func fizzBuzz(_ n: Int) -> [String] {
    
    var table = [Int:String]()
    table[3] = "Fizz"
    table[5] = "Buzz"
    
    var res = [String]()
    for index in 1 ..< (n + 1) {
        var str = ""
        for key in table.keys {
            if index % key == 0 {
                str += table[key]!
            }
        }
        
        if str.isEmpty {
            str += "\(index)"
        }
        
        res.append(str)
    }
    return res
    
}
print(fizzBuzz(100))

