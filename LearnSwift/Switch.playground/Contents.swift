import UIKit

//使用switch
var statusCode :Int = 404
var errorString :String

switch statusCode {
case 400:
    errorString = "Bad request"
case 401:
    errorString = "Unauthorized"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not found"
default:
    errorString = "None"
}

//分支支持多个值
//如果分支末尾有fallthrough 语句 就会贯穿分支到到一个分支
//switch 可以使用区间
//switch 使用值绑定
switch statusCode {
case 300...307:
    errorString = "switch 中使用区间"
 fallthrough
    
case 400,401,403,404:
    errorString = "分支中使用多个值"

case let unkownCode:
    errorString = "\(unkownCode) 使用值绑定"
}

print(errorString)

//switch 使用where 创建筛选条件
switch statusCode {
    
case 300...307:
    errorString = "switch 中使用区间"
    fallthrough
    
case 400,401,403,404:
    errorString = "分支中使用多个值"
    
case let unkownCode where (unkownCode >= 200 && unkownCode < 300) || unkownCode > 505:
    errorString = "\(unkownCode) 使用where语句"
    
default:
    errorString = "默认分支"
}

//元组和 模式匹配

errorString = "元组"

//元组
let error = (statusCode,errorString)
error.0
error.1

//元组的元素起名
let namedTuple = (code:statusCode,error:errorString)
namedTuple.code
namedTuple.error

//元组做模式匹配
// _ 是能匹配任何值的通配符
let firstErrorCode = 404
let secondErrorCode = 200
let errorCode = (firstErrorCode,secondErrorCode)
switch errorCode {
case (_,404):
    print("第二个值是 404 第一个值是啥都行")
default:
    print("默认分支")
}

//单个分支的switch
let age = 29
switch age {
case 18...100:
    print("长大了")
default:
    print("还没长大呢")
}

//使用 if case 替代单分支的switch
if case 18...100 = age {
    print("你已经长大了")
}
//带多个条件的 if-case
if case 18...100 = age,age == 29{
    print("你已经是29岁了")
}
