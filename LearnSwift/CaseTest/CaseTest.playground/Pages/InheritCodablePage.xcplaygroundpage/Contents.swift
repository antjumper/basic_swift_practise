import Foundation
class Point2D:Codable {
    var x = 0.0
    var y = 0.0
    
    private enum CodingKeys:String,CodingKey { //private 避免它被派生类继承
        case x
        case y
    }
    
    func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(x, forKey: Point2D.CodingKeys.x)
        try container.encode(y, forKey: Point2D.CodingKeys.y)
    }
}

class Point3D:Point2D {
    var z = 0.0
    
//    private enum CodingKeys: String,CodingKey {
//        case z
//    }
    //基类和派生类的属性共享了同一个container
//    {
//        "x" : 1,
//        "y" : 1,
//        "z" : 1
//    }
//    override func encode(to encoder: Encoder) throws {
//        try super.encode(to: encoder)
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(z, forKey: Point3D.CodingKeys.z)
//    }
    
    
    //共用同一个容器的话不太容易区分那一部分属于基类和那一部分属于派生类
    //我们使用了container.superEncoder()获得了派生类中，专门用于编码基类的容器，并把它传递给了基类的编码方法
//    {
//        "super" : {
//            "x" : 1,
//            "y" : 1
//        },
//        "z" : 1
//    }
//    override func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try super.encode(to: container.superEncoder())
//        try container.encode(z, forKey: Point3D.CodingKeys.z)
//    }
    
    
    
    //如果想给super 字段改名字的话 怎么办呢
    private enum CodingKeys: String,CodingKey {
        case z
        case point_2d
    }
    /*
     {
         "z" : 3,
         "point_2d" : {
             "x" : 1,
             "y" : 2
         }
     }

    */
    override func encode(to encoder: Encoder) throws {
        var container =
            encoder.container(keyedBy: CodingKeys.self)
        try super.encode(to:
            container.superEncoder(forKey: .point_2d))
        try container.encode(z, forKey: .z)
    }
    
}
//封装encode函数
func encode<T>(of model:T) throws where T:Codable {
    let encoder = JSONEncoder()
    encoder.outputFormatting = JSONEncoder.OutputFormatting.prettyPrinted
    let data = try encoder.encode(model)
    print(String(data:data,encoding:String.Encoding.utf8)!)
}

var p1 = Point3D()
p1.x = 1;
p1.y = 2;
p1.z = 3;
try encode(of: p1);
