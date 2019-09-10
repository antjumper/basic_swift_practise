import UIKit

//字典也是值类型
var dict1 :Dictionary<String,Double> = [:]
var dict2 = Dictionary<String,Double>()
var dict3:[String:Double] = [:]
var dict4 = [String:Double]()

//创建字典
var ages = ["name_1":20,"name_2":21]

//count
ages.count

//读取值
let age = ages["name_1"]// option + 点击变量  let age: Int?
//类型是Int?
// 为什么 因为字典需要告诉你这个值存在还是不存在
// 为什么数组不需要 ？ 因为越界崩溃...所以不需要这样处理

//修改值
ages["name_1"] = 100
//返回旧的值
let oldValue = ages.updateValue(5, forKey: "name_1")
//增加zhi
ages["name_3"] = 3
let removeValue = ages.removeValue(forKey: "name_3")
//删除值
ages["name_3"] = nil
ages.count

//字典的遍历

for (key,value) in ages {
    print("\(key)"+":\(value)")
}

print(ages.keys,terminator:" ")


//不可变字典

//let 声明的字典

//把字典转换成数组
let names = Array(ages.keys)

names
