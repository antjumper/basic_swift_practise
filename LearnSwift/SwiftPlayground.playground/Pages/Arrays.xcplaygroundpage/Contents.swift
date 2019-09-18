import UIKit

//数组值类型  字符串值类型

//数组的创建
//第一种
var bucketList_2:Array<String>
//第二种
var bucketList_1:[String]

//数组的初始化

var bucketList_3:[String] = ["红楼梦"]
var bucketList_4:[String] = []
var bucketList_5:[String] = Array<String>()

//使用类型推断的初始化
var bucketList = ["红楼梦"]





//访问数组 修改数组

//添加
bucketList.append("西游记")
bucketList.append("李白")
bucketList.append("杜甫")
bucketList.append("狄仁杰")

//删除
print(bucketList)
bucketList.remove(at: 0)
print(bucketList)
//数组元素的个数
bucketList.count
//获取s子串
let subArray = bucketList[0...1]
print(subArray)
//获取元素
bucketList[0]
//修改
bucketList[0] = "改版后的西游记"
bucketList[0].append("在改版")
print(bucketList)


//遍历
for item in bucketList {
    print(item,terminator:" ")
}
// + 法运算符
let newItems = ["newItem_1","newItem_2"]
bucketList.count
bucketList += newItems
bucketList.count

//插入
bucketList.insert("insert", at: bucketList.count)
bucketList.count

var array_1 = ["arr","arr1"]

var array_2 = ["arr","arr1"]

if array_1 == array_2 {
    print("数组可以使用 == 判定是否相等")
}

//不可变数组  let  声明的数组变量


