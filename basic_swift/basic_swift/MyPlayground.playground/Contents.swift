//: Playground - noun: a place where people can play

import Cocoa

//摩尔算法 大概就是 rangeOfString 的实现
/*
 暴力检索运行效率尚可，但是在检索大量数据的时候，这样的过程并不是很高效。因为结果往往是，你并不需要检索字符串里面的所有字符－－中间大部分字符都可以直接跳过。
 
 这个跳过继续检索的算法叫做摩尔算法
 */


var str = "Hello, Worldq"
// 返回传入下标偏移后的下标（偏移量可正可负可为 0）


extension String {
    func index(of pattern:String) -> Index? {
        //存储 pattern 的长度值
        let patternLength = pattern.characters.count
        
        print(characters)
        //确保是一次有效的检索
        guard patternLength > 0,patternLength <= characters.count else {
            return nil
        }
        
        //创建跳过表格 是个字典
        //当pattern里的某一个字符被检测到，这个表格可以决定我们可以跳过多少长度
        var skipTable = [Character:Int]()
        for (i,c) in pattern.characters.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        
        print(skipTable)
        /*
         str.index(before: str.endIndex) 返回传入下标之前的下标  startIndex 是指字符串的第一个字符的下标，而 endIndex 是指字符串的最后一个字符 之后 的下标。当字符串为空时， startIndex 和 endIndex 相同。
         */
        //这里得到pattern 里最后一个字符
        let p = pattern.index(before: pattern.endIndex) //
        let lastChar = pattern[p]
        
        //核对过程是由pattern 的右向左 所以我们跳过的长度为 pattern的长度
        //这里扣掉1 是因为startIndex 已经指向源字符串的首字符位置
        var i  = index(startIndex, offsetBy: patternLength - 1)
        
        //此函数将源字符串和pattern 从指定位置开始对比匹配 当对应位置的字符串 不一致的时候返回nil 反之返回字符上面经过匹配对比的最前一位的位置
        func backwards() -> Index? {
            var q = p
            var j = i
            print(pattern.startIndex)
            while q > pattern.startIndex {
                j = index(before: j)
                q = index(before: q)
                if self[j] != pattern[q] {
                    return nil
                }
            }
            return j
        }
        
        //主循环 在找到完全匹配时候结束 或者 全部检索完依然没有匹配时候返回nil
        print(endIndex)
        while i < endIndex {
            let c = self[i]
            print("开始----c =  \(c) i = \(i)")
            //检测源字符串中当前位置的字符串与pattern的最后一位字符串是否相同
            if c == lastChar {
                print("最后一位文字 匹配 开始匹配 --- i = \(i)")

                //当发现可能匹配的时候 进行暴力匹配对比
                if let k = backwards() { return k }
                
//                //如果不匹配 直接进前一个位置
//                i = index(after: i)
                
                
//                --------- Boyer-Moore-Horspool 算法
                // 确保至少向前进1个字符的距离，因为我们最早开始检索的时候，第一个可能匹配的字符也出现在跳过表格里面
                
                //而跳过表格提供的跳过距离为0，如果不限制的话检索无法继续
                let jumpOffset = max(skipTable[c] ?? patternLength, 1)
                i = index(i, offsetBy: jumpOffset, limitedBy: endIndex) ?? endIndex
                print("最后一位文字 匹配 后移一位 --- i = \(i)")

            }else{
                //当前字符串状态为不匹配  所以需要向前移动 移动的距离由跳过表格决定
                // 如果当前字符与pattern没有任何匹配，则直接前进一个pattern长度的距离 否则根据跳过表格的距离决定
                i = index(i, offsetBy: skipTable[c] ?? patternLength,limitedBy:endIndex) ?? endIndex
                print("匹配不上 --- i = \(i)")

            }
            
            print("----------------------------------------")
        }
        
        
        return nil
        
    }
}

str.index(of: "World")
