import Foundation

// key 个数不确定
let jsonString = """
{
    "1" : {
        "name" : "ZhangSan"
    },
    "2" : {
        "name" : "LiSi"
    },
    "3" : {
        "name" : "WangWu"
    }
}
"""

struct Student:Codable {
    let id :Int
    let name:String
}

struct StudentList:Codable {
    var students:[Student] = []
    init(students:Student ...) {
        self.students = students
    }
    
    struct StudentInfo:CodingKey {
        var intValue:Int?{return nil}
        init?(intValue:Int){return nil}
        
        var stringValue:String //json中的key
        //根据key来创建Codingkey
        init?(stringValue:String){
            self.stringValue = stringValue
        }
        
        static let name = StudentInfo(stringValue:"name")!
        
        //stringValue和intValue属性，以及接受String和Int为参数的init方法是protocol强制要求的，我们必须定义它们。由于我们可以从JSON的key中读到id，因此在StudentInfo里，我们只要在最后，定义name在model中的映射规则就好了。
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy:StudentInfo.self)
        var v = [Student]()
        for key in container.allKeys {
            let innerContainer = try container.nestedContainer(keyedBy:StudentInfo.self,forKey:key)
            let name = try innerContainer.decode(String.self, forKey: .name)
            let stud = Student(id: Int(key.stringValue)!, name: name)
            v.append(stud)
        }
        self.students = v
    }
    
    func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: StudentInfo.self)
        for stu in students {
            let sid = StudentInfo(stringValue: String(stu.id))!
            var nested = container.nestedContainer(keyedBy: StudentInfo.self, forKey:sid)
            try nested.encode(stu.name, forKey: .name)
        }
    }
}


func decode<T>(response:String,of:T.Type) throws ->T? where T:Codable{
    let data = response.data(using: String.Encoding.utf8)!
    let decoder = JSONDecoder()
    
    do {
        let model = try decoder.decode(T.self, from: data)
        dump(model)
        return model
    }
    catch DecodingError.typeMismatch(let type, let context){
        dump(type)
        /*
         Swift.DecodingError.Context
         - codingPath: 0 elements
         - debugDescription: "The given data was not valid JSON."
         ▿ underlyingError: Optional(Error Domain=NSCocoaErrorDomain Code=3840 "Unexpected end of file while parsing object."
         */
        dump(context)
        return nil
    }
    catch DecodingError.keyNotFound(let codingPath, let context) {//处理不存在的key
        dump(codingPath)
        dump(context)
        return nil
    }
    
}

let model = try decode(response: jsonString, of: StudentList.self)


//封装encode函数
func encode<T>(of model:T) throws where T:Codable {
    let encoder = JSONEncoder()
    encoder.outputFormatting = JSONEncoder.OutputFormatting.prettyPrinted
    let data = try encoder.encode(model)
    print(String(data:data,encoding:String.Encoding.utf8)!)
}
//编码不确定的key
let stu1 = Student(id: 1, name: "ZhangSan")
let stu2 = Student(id: 2, name: "LiSi")
let stu3 = Student(id: 3, name: "WangWu")
let stuList1 = StudentList(students: stu1, stu2, stu3)
try! encode(of: stuList1)
