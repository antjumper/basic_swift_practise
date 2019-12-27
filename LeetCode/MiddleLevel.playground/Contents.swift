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


//8. 字符串转换整数 (atoi)
//func myAtoi(_ str: String) -> Int {
//
//    if str.isEmpty {
//        return 0
//    }
//    var sum = 0
//    let s = [Character](str)
//
//    print(s)
//
//    //去除空格
//    var i = 0
//    while i < s.count && s[i] == " "{
//        i += 1
//    }
//    if s.count == i {
//        return 0
//    }
//    //正负问题
//    var flag:Int = 1
//    if s[i] == "-" {
//        flag = -1
//        i += 1
//    }else if(s[i] == "+"){
//        flag = 1
//        i += 1
//    }
//    print(i)
//    let zero = Character("0")
//    while (i < s.count && s[i] >= "0" && s[i] <= "9") {
//
//        print(i)
//
//        let dig = s[i].asciiValue! - zero.asciiValue!
//
//        //越界的问题
//        if (sum > Int32.max / 10){
//            return flag == 1 ? Int(Int32.max) : Int(Int32.min)
//        }
//        if (sum == Int32.max / 10  && dig > 7 && flag == 1) {
//            print("最大越界")
//            return Int(Int32.max)
//        }
//        if (sum == Int32.max / 10 && dig > 8 && flag == -1) {
//            print("最小越界")
//            return Int(Int32.min)
//        }
//        sum = sum * 10 + Int(dig)
//
//        print("dig = \(dig) i = \(i) sum = \(sum)")
//
//        i += 1
//    }
//    return sum * flag
//}

//myAtoi("42")
//myAtoi("   -42")
//myAtoi("4193 with words")
//myAtoi("words and 987") //0
//myAtoi("-91283472332") //-2147483648
//myAtoi("-2147483649")
//myAtoi("2147483648")
//myAtoi(" ")

//11. 盛最多水的容器
//解法一 ：暴力解法
//func maxArea(_ height: [Int]) -> Int {
//
//    var maxArea = 0
//    for i in 0..<height.count {
//        for j in 0..<height.count {
//            let temp = (j - i) * min(height[i], height[j])
//            maxArea = max(temp, maxArea)
//        }
//    }
//    return maxArea
//}

//这种方法背后的思路在于，两线段之间形成的区域总是会受到其中较短那条长度的限制。此外，两线段距离越远，得到的面积就越大。

//双指针法：O(N） O(1)

//我们在由线段长度构成的数组中使用两个指针，一个放在开始，一个置于末尾。 此外，我们会使用变量maxarea 来持续存储到目前为止所获得的最大面积。 在每一步中，我们会找出指针所指向的两条线段形成的区域，更新maxarea，并将指向较短线段的指针向较长线段那端移动一步。
//func maxArea(_ height: [Int]) -> Int {
//    var maxArea = 0
//    var left = 0
//    var right = height.count - 1
//    while left < right {
//        let temp = min(height[left], height[right]) * (right - left)
//        maxArea = max(temp,maxArea)
//        if height[left] < height[right] {
//            left += 1
//        }else {
//            right -= 1
//        }
//    }
//    return maxArea
//}
//
//maxArea([1,8,6,2,5,4,8,3,7])

//15. 三数之和
//解法一 暴力解法 三次循环 但是 会有重复三次 这个怎么解决呢
//func threeSum(_ nums: [Int]) -> [[Int]] {
//
//    if nums.count < 3 {
//        return []
//    }
//    let arr = nums.sorted { $0 > $1}
//    var res = [[Int]]();
//    for i in 0 ..< arr.count{
//        if i > 0 && arr[i] == arr[i-1] {
//            continue
//        }
//
//        for j in i+1 ..< arr.count {
//
//            if j > i+1 && arr[j] == arr[j-1] {
//                continue
//            }
//
//            for k in j+1 ..< arr.count {
//
//                if k > j+1 && arr[k] == arr[k-1] {
//                       continue
//                 }
//
//                if arr[i] + arr[j] + arr[k] == 0 {
//                    res.append([arr[i],arr[j],arr[k]])
//                }
//
//            }
//
//        }
//
//    }
//    return res
//}

//解法二：排序+ 双指针

//func threeSum(_ nums: [Int]) -> [[Int]] {
//    if nums.count < 3 {
//        return []
//    }
//    let arr = nums.sorted()
//    var left = 1
//    var right = arr.count - 1
//    var res = [[Int]]()
//    for index in 0 ..< arr.count {
//
//        //最小的都大于0
//        if arr[index] > 0 {
//            return res
//        }
//        //相同的值 就剔除
//        if(index > 0 && arr[index] == arr[index - 1]){ // 去重
//            continue
//        }
//        left = index + 1
//        right = arr.count - 1
//        //头尾指针查找遍历
//        while left < right {//每个元素每次结束条件
//            if arr[index] + arr[left] + arr[right] == 0 { //计算成功
//                res.append([arr[index],arr[left],arr[right]])
//                while left < right && arr[left] == arr[left + 1] {// 去重
//                    left += 1
//                }
//                while left < right && arr[right] == arr[right - 1] {// 去重
//                    right -= 1
//                }
//                left += 1
//                right -= 1
//            }else if arr[left] + arr[right] + arr[index] > 0 { //计算不成功的话 > 0
//                right -= 1
//            }else {
//                left += 1
//            }
//        }
//    }
//
//    return res
//}
//
//threeSum([-1, 0, 1, 2, -1, -4])


//17. 电话号码的字母组合
//一 暴力解法  两次遍历
// 二 说是回溯  名字叫的很牛逼思密达
//func letterCombinations(_ digits: String) -> [String] {
//
//    if digits.isEmpty {
//        return []
//    }
//    var table = [String:String]()
//    table["2"] = "abc"
//    table["3"] = "def"
//    table["4"] = "ghi"
//    table["5"] = "jkl"
//    table["6"] = "mno"
//    table["7"] = "pqrs"
//    table["8"] = "tuv"
//    table["9"] = "wxyz"
//
//    var res = [String]()
//    func backtrack(_ str:String,_ nextDigit:String?){
//
//        if nextDigit == nil || nextDigit!.isEmpty { //下个数字是空的话 说明到底了
//            res.append(str)
//        }else {
//            let num = String(nextDigit!.prefix(1)) //取出来一个数字
//            let letters = table[num]! //这个数字对应的字符串
//            for value in letters { //字符串和下个数字组合
//                var remain = ""
//                if nextDigit!.count > 1 {
//                    remain = String(nextDigit!.suffix(nextDigit!.count - 1))
//                }
//                backtrack("\(str)\(value)", remain) //当前生成的字符串和 剩下的数字字符去组合
//            }
//        }
//    }
//
//    backtrack("", digits)
//    return res
//}
//
//letterCombinations("23")

//19. 删除链表的倒数第N个节点
//暴力解法 会建立一个空头指针  方便删除第一个节点时候的操作
// 解法二 差集指针 一次遍历就可以解决这个问题 也是建立了空头指针  第一个指针走k  步骤之后第二个指针开始出发当第一个指针到达尾部的时候第二个指针就到了 倒数k 的前一个了
//func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//    //新建一个l空头结点
//    let new = ListNode(0)
//    new.next = head
//    //双指针去寻找要删除的前一个结点
//    var p_one:ListNode? = new
//    var p_two:ListNode? = new
//    for _ in 0 ..< n + 1 {
//        p_one = p_one?.next
//    }
//    while p_one != nil {
//        p_one = p_one?.next
//        p_two = p_two?.next
//    }
//    //删除第n个结点
//    p_two?.next = p_two?.next?.next
//
//    return new.next
//}
//let list1 = ListNode(1)
//list1.next = ListNode(2)
//list1.next?.next = ListNode(3)
//list1.next?.next?.next = ListNode(4)
//let node  = removeNthFromEnd(list1,4)

//22. 括号生成
// 时间复杂度 O(2的2n次方 * n) 其中用于验证的序列的复杂度是O(n)
// 空间复杂度是 O(2的2n次方 * n)  简单地，每个序列都视作是有效的
//暴力解法 拼凑出所有的可能然后检测是否是符合条件的
//func generateParenthesis(_ n: Int) -> [String] {
//
//    //保存结果
//    var res = [String]()
//
//    func valid(_ cur:String) -> Bool{
//        var  balance:Int = 0
//        for ele in cur {
//            //左边的数量永远要大于等于 右括号的数量
//            if ele == "(" {
//                balance += 1
//            }else {
//                balance -= 1
//            }
//
//            if balance < 0 {
//                return false
//            }
//        }
//        return (balance == 0)
//    }
//
//    /// 生成所有字符串的函数
//    /// - Parameters:
//    ///   - str: 当前的字符串
//    ///   - pos: 当前添加的位置
//    ///   - length: 需要形成的总的长度
//    ///   - res: 保存结构的数组
//    func generateAll(_ str:String,_ length:Int,_ res:inout [String]){
//
//        if str.count == length {
//            if valid(str) {
//                res.append(str)
//            }
//        }else {
//            generateAll(str + "(", length, &res)
//            generateAll(str + ")", length, &res)
//        }
//    }
//
//    generateAll("", 2*n, &res)
//    return res
//}

//https://leetcode-cn.com/problems/generate-parentheses/solution/hui-su-suan-fa-by-liweiwei1419/
//方法二 回溯法 加枝剪减  这个和 执行深度优先遍历，查找可能的结果原理是一样的
//func generateParenthesis(_ n: Int) -> [String] {
//    var res = [String]()
//
//    /// 回溯法
//    /// - Parameters:
//    ///   - cur: 当前字符串
//    ///   - close: “)”的数量
//    ///   - open: “(”的数量
//    ///   - len: 字符串应该的长度
//    func backtrack(_ cur:String,_ close:Int,_ open:Int,count:Int){
//
//        if cur.count == count * 2 {
//            res.append(cur)
//        }else {
//            //符合条件的字符串的情况
//            if open < count{
//                backtrack(cur + "(", close, open + 1, count: count)
//            }
//
//            if open > close {
//                backtrack(cur + ")", close + 1, open, count: count)
//            }
//        }
//
//    }
//    backtrack("", 0, 0, count: n)
//    return res
//
//}


//方法三 层次遍历

//新建node
//public class Node:CustomStringConvertible{
//    //当前得到的字符串
//    public var res:String
//    //剩余左括号的数量
//    public var left:Int
//    //剩余右括号的数量
//    public var right:Int
//
//    public init (_ res:String,_ left:Int,_ right:Int){
//        self.res = res
//        self.left = left
//        self.right = right
//    }
//
//    public var description: String {
//        return "Node{res=\(res),left=\(left),right=\(right)}"
//    }
//}
//
//func generateParenthesis(_ n: Int) -> [String] {
//    var res = [String]()
//    var queue = Queue<Node>()
//    queue.enqueue(Node("",n,n))
//    var count = 2 * n
//    while count > 0 {
//        let size = queue.count
//        for _ in 0 ..< size {
//            let curNode = queue.dequeue()!
//            if curNode.left > 0 {
//                queue.enqueue(Node(curNode.res + "(",(curNode.left - 1),curNode.right))
//            }
//
//            if curNode.right > 0 && curNode.left < curNode.right {
//                queue.enqueue(Node(curNode.res + ")",curNode.left,curNode.right - 1))
//            }
//
//        }
//        count -= 1
//    }
//
//    while !queue.isEmpty {
//        res.append(queue.dequeue()!.res)
//    }
//
//    return res
//}
//
//let res = generateParenthesis(3)
//print(res)

//29. 两数相除
//https://leetcode-cn.com/problems/divide-two-integers/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-2-4/
//知识点很多
// 把正数转成负数去加减
//func divide(_ dividend: Int, _ divisor: Int) -> Int {
//    //求补码
//    func opposite(_ x:Int) -> Int{
//        return (~x + 1)
//    }
//
//    var ans = -1
//    var sign = 1 //标志位
//
//    var v_dividend = dividend //被除数
//    var v_divisor = divisor //除数
//
//    //全部转为负数 因为正数的范围没有负数大
//    if v_dividend > 0 {
//        sign = opposite(sign)
//        v_dividend = opposite(v_dividend)
//    }
//
//    if v_divisor > 0 {
//        sign = opposite(sign)
//        v_divisor = opposite(v_divisor)
//    }
//
//
//    let loop_dividend = v_dividend
//    let loop_divisor = v_divisor
//    //除不尽呀
//    if v_dividend > v_divisor {
//        return 0
//    }
//    //减一次 对应初始化 ans = -1
//    v_dividend -= v_divisor
//
//    while v_divisor >= v_dividend {
//
//        ans = ans + ans //指数级增长的
//        v_divisor += v_divisor
//        v_dividend -= v_divisor
//
//    }
//    print("v_divisor = \(v_divisor),v_dividend = \(v_dividend)")
//
//    //以为是指数级增长的 1 2 4 所以除以单倍 最后
//    let a = ans + opposite(divide(loop_dividend - v_divisor,loop_divisor))
//
//    if a == Int32.min  {
//        return (sign > 0) ? Int(Int32.max):Int(Int32.min)
//    }else {
//        return (sign > 0) ? opposite(a): a
//    }
//}
//
//divide(7, -3)
//
//divide(10, 3)
//

//33. 搜索旋转排序数组
// 主要是找到偏移量 举例 [4,5,6,7,0,1,2]  [0,1,2,3,4,5,6]
//func search(_ nums: [Int], _ target: Int) -> Int {
//    //查找最小值下标
//    var start = 0
//    var end = nums.count - 1
//    while start < end {
//        let mid = (start + end)/2
//        if nums[mid] > nums[end] {
//            start = mid + 1 //为什么加一 [9,8] 死循环了
//        }else {
//            end = mid
//        }
//    }
//    //计算出偏移量
//    let base = start //偏移量
//
//    //开始二分查找
//    start = 0
//    end = nums.count - 1
//    while start <= end { //注意这个是 小于等于
//        let mid = (start + end)/2
//        let realIndex = (mid + base)%nums.count
//        if target == nums[realIndex] {
//            return realIndex
//        }else if nums[realIndex] > target {
//            end = mid - 1
//        }else {
//            start = mid + 1
//        }
//    }
//    return -1
//}
//
//search([4,5,6,7,0,1,2],0)


//34. 在排序数组中查找元素的第一个和最后一个位置
// 对二分查找最好的注解：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/solution/er-fen-cha-zhao-suan-fa-xi-jie-xiang-jie-by-labula/
//func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//
//    //寻找边界点
//    func leftBound(_ arr:[Int],_ target:Int) -> Int{
//        //注意 设置的是闭区间
//        var low = 0
//        var high = nums.count - 1
//
//        while low <= high { //注意结束条件是  low  high
//            let mid = (low + high)/2
//            if arr[mid] == target {
//                high = mid - 1
//            }else if arr[mid] > target {
//                high = mid - 1
//            }else {
//                low = mid + 1
//            }
//        }
//        //结束的时候是 low =  high + 1
//        // 如果能找到low总是指向找到的最小下标
//        //不能找到 并且 target  大于所有值的时候会移动到arr.count 造成越界
//        if low <= arr.count - 1 && arr[low] == target {
//            return low
//        }else {
//            return -1 //没找到
//        }
//    }
//
//    func rightBound(_ arr:[Int],_ target:Int) -> Int{
//        //注意 设置的是闭区间
//        var low = 0
//        var high = nums.count - 1
//
//        while low <= high { //注意结束条件是  low =  high + 1
//            let mid = (low + high)/2
//            if arr[mid] == target {
//                low = mid + 1
//            }else if arr[mid] > target {
//                high = mid - 1
//            }else {
//                low = mid + 1
//            }
//        }
//        //结束的时候是 low == high
//        // right 的取值范围是 mid - 1 而mid 是【0，len-1】所以right = 【-1,len - 2】
//        // 如果找到index1之后再找那么 再次查找无论找到找不到毕定 毕竟靠近找到之后的index1
//        if high >= 0 && arr[high] == target {
//            return high
//        }else {
//            return -1 //没找到
//        }
//    }
//
//    if nums.isEmpty {
//        return [-1,-1]
//    }
//
//    return [leftBound(nums, target),rightBound(nums, target)]
//
//}
//
////nums = [5,7,7,8,8,10], target = 8 [3,4]
//
//searchRange([5,7,7,8,8,10], 8)

//36. 有效的数独 空间换时间

//func isValidSudoku(_ board: [[Character]]) -> Bool {
//
//    var rows = [[Character:Int]](repeating: [Character:Int](), count: 9)
//    var colunms = [[Character:Int]](repeating: [Character:Int](), count: 9)
//    var boxs = [[Character:Int]](repeating: [Character : Int](), count: 9)
//
//    for i in 0 ..< 9 {
//        for j in 0 ..< 9 {
//
//            let value = board[i][j]
//            if value != "." {
//                //row 的处理
//                if rows[i][value] != nil {
//                    rows[i][value] =  rows[i][value]! + 1
//                }else {
//                    rows[i][value] = 1
//                }
//
//                //colunms
//                if colunms[j][value] != nil {
//                    colunms[j][value] = colunms[j][value]! + 1
//                }else {
//                    colunms[j][value] = 1
//                }
//
//                let boxIndex = (i / 3) * 3 + j / 3
//                //box
//                if boxs[boxIndex][value] != nil {
//                    boxs[boxIndex][value] = boxs[boxIndex][value]! + 1
//                }else {
//                    boxs[boxIndex][value] = 1
//                }
//
//
//                if rows[i][value]! > 1 || colunms[j][value]! > 1 || boxs[boxIndex][value]! > 1 {
//                    return false
//                }
//            }
//
//        }
//    }
//
//    return true
//}

//46. 全排列  每次选出来一个剩下的去排列
//回溯方式的实现
//回溯算法的详解：https://leetcode-cn.com/problems/permutations/solution/hui-su-suan-fa-python-dai-ma-java-dai-ma-by-liweiw/
//func permute(_ nums: [Int]) -> [[Int]] {
//
//    if nums.isEmpty {
//        return [[Int]]()
//    }
//
//    //回溯函数
//    func generatePermution(_ path:inout [Int],_ curLen:Int,_ len:Int,_ res:inout [[Int]],_ status:inout [Bool]){
//
//        //结束条件
//        if curLen == len {
//            res.append(path)
//              return
//        }
//        //继续深度回溯
//        for i in 0 ..< len {
//            if status[i] == false {
//                path.append(nums[i]) //选出来一个数
//                status[i] = true
//                //后面的数去回溯
//                generatePermution(&path, curLen + 1, len, &res, &status)
//
//                //深度遍历之后回来继续选数
//                path.removeLast()
//                status[i] = false
//
//            }
//        }
//    }
//    var sta = [Bool](repeating: false, count:nums.count)
//    var path = [Int]()
//    var res = [[Int]]()
//    generatePermution(&path, 0, nums.count,&res, &sta)
//    return res
//}

// 解法二 递归的思路 首先是 f(n) = 0 + f(n - 1 )
//func permute(_ nums: [Int]) -> [[Int]] {
//
//    var res = [[Int]]()
//
//    if nums.isEmpty {
//        return res
//    }
//
//    func recursion(_ begin:Int,_ arr:inout [Int]){
//        //结束条件
//        if begin == arr.count - 1 {
//            var pth = [Int]()
//            for i in 0 ..< arr.count {
//                pth.append(arr[i])
//            }
//            res.append(pth)
//            return
//        }
//
//        //下面的开始递归
//        recursion(begin + 1, &arr)
//        //从 begin 的下一位开始一直要交换到最后一位
//        for j in begin + 1 ..< arr.count {
//            arr.swapAt(begin, j)
//            // 注意：递归完成以后要交换回来
//            recursion(begin + 1, &arr)
//            arr.swapAt(begin, j)
//        }
//    }
//
//    var arr = nums
//    recursion(0, &arr)
//    return res
//}
//
//let res = permute([1,2,3])
//print(res)


