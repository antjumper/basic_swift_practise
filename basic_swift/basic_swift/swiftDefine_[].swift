//
//  swiftDefine_[].swift
//  basic_swift
//
//  Created by 刘红波 on 2017/5/25.
//  Copyright © 2017年 刘红波. All rights reserved.
//

//定义下标脚本之后，可以使用“[]”来存取数据类型的值。


//知识点 Swift3中利用Range截取字符串 Range在Swift中变化有点大 http://www.jianshu.com/p/022f632e89bd



//扩展的使用 教程 涉及到 http://blog.csdn.net/anan890624/article/details/52645176 
//类中的方法因为本身就可以改变类所以adjust方法不需要mutating关键字修饰













//类和结构体的 区别 

/*
    类和结构体有许多相同之处，也有许多不同之处。

    二者区别如下：
    1，类可以继承，结构体不可以
    2，可以让一个类的实例来反初始化，释放存储空间，结构体做不到
    3，类的对象是引用类型，而结构体是值类型。所以类的赋值是传递引用，结构体则是传值。

    相同点：
    1，类和结构体都可以扩展  遵守协议
    2，定义属性用于储存值
    3，定义方法用于提供功能
    4，定义下标用于通过下标语法访问值
    5，定义初始化器用于生成初始化值
 
 */

import Foundation


class SubString {
    var str:String = ""
    
    init(str:String) {
        self.str = str
    }
    
    //获取 设置部分字符串--------字符串
    subscript (start:Int,length:Int) -> String{
        get{
            //移动到 某一个下标
            let index1 = str.index(str.startIndex,offsetBy:start)
            
            //从一个下标 开始取 length长度
            let index2 = str.index(index1,offsetBy:length)
            
            let range = Range(uncheckedBounds:(lower:index1,upper:index2))
            
            return str.substring(with:range);
            
        }
        
        set{
            let tmp = str
            str = ""
            var s = ""

            var e = ""
            
            for(idx,item) in tmp.characters.enumerated() {
                
                // 不是需替换的字符的时候 就直接保留相应的字符
                if(idx < start){
                    s += "\(item)"
                }
                // 不是需替换的字符的时候 就直接保留相应的字符
                if(idx >= start + length){
                    e += "\(item)"
                }
                
            }
            str = s + newValue + e
            
            
        }
        

    }
    
    
    //下标脚本  获取 设置字符----字符
    subscript(index:Int) -> String{
        get{
            return String( str[str.index(str.startIndex, offsetBy: index)] )
        }
        
        set {
            let  tmp = str
            
            str = ""
            
            for(idx,item) in tmp.characters.enumerated() {
                
                //保留以前字符  替换现在的字符
                if idx == index {
                    str += "\(newValue)"
                }else{
                    str += "\(item)"
                }
                
            }
            
            
            
        }
    }
    
    
    //        let str = SubString(str:"hongbo.com")
    //        print(str[7,3])  //获取字符串：com
    //        print(str[7])  //获取字符：c
    //
    //        str[7,3] = "COM"  //设置部分字符串
    //        str[0] = "h" //设置部分字符
    //        print(str[0,10]) //Hongbo.COM
    
}

//通过类扩展，也可以直接给String类添加索引功能

extension String{
    subscript(start:Int,length:Int) ->String{
        
        get{
            let index1 = self.index(self.startIndex, offsetBy: start)
            
            let index2 = self.index(index1, offsetBy: length);
            
            let range = Range(uncheckedBounds: (lower:index1,upper:index2))
            
            return self.substring(with: range)
        }
        
        set{
            
            let tmp = self
            var s = ""
            var e = ""
            for (idx, item) in tmp.characters.enumerated() {
                if(idx < start)
                {
                    s += "\(item)"
                }
                if(idx >= start + length)
                {
                    e += "\(item)"
                }
            }
            self = s + newValue + e
        }
       
        
    }
    
    
    subscript (index:Int) -> String{
        get{
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        
        set{
            let tmp = self;
            self = ""
            for (idx, item) in tmp.characters.enumerated() {
                if idx == index {
                    self += "\(newValue)"
                }else{
                    self += "\(item)"
                }
            }
        }
    }
}



//使用一维数组结合下标方法一定程度上模拟实现了二维数组

class Maxtrix {
    
    let rows:Int,columns:Int
    var grid:[Double]
    
    init(rows:Int,columns:Int) {
        
        self.rows = rows
        self.columns = columns
        grid = Array(repeating:0.0,count:rows * columns)
        
    }
    
    func indexIsValidForRow(row:Int,column:Int) -> Bool{
        return row  >= 0 && row < rows  && columns >= 0 && columns < columns
    }
    
    subscript (row:Int,column:Int) -> Double {
        
        get{
            assert(indexIsValidForRow(row: row, column: column),"Index out of range")
            return grid[(row * columns) + column]
        }
        
        set {
            assert(indexIsValidForRow(row: row, column: column),"Index out of range")
            
            grid[(row * columns) + column] = newValue
        }
        
    }
    
//    let value = Matrix(rows: 20,columns: 20)
//    value[10,10] = 20
//    print(value[10,10])
    
}


