import UIKit

for i in 1...5 {
    print(i)
}
// 使用通配符的for-in
var changeNum = 0
for _ in 1...5 {
    changeNum += 1
}
print(changeNum)

// for-in 中使用where
for i in 1...10 where i % 3 == 0 {
    print("i= \(i) 能除以3 余数为 0")
}

// while 循环

var i = 1
var sum = 0
while i < 6 {
    sum += 1
}
print(sum)

repeat {
    i+=1
    print("\(i) repeat")
} while i>=1

//控制转移语句

//continue 控制循环语句就地停止 并且从头开始
// break 跳出本次循环
//fallthrough 贯穿switch 分支的语句

