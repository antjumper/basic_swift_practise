
import Foundation

struct NewsModel:Codable {
    var title:String
    var subTitle:String?
    var createTime:Date
    var slices:[Float]
    var duration:Int
    
    init(title:String,
         subTitle:String?,
        createTime:Date,
        slices:[Float],
        duration:Int){
        self.title = title
        self.subTitle = subTitle
        self.createTime = createTime
        self.slices = slices
        self.duration = duration
    }
    
    init(from decoder:Decoder) throws {
        //借用容器的概念,从Decoder中得到对应的Value
        let container = try decoder.container(keyedBy: CodingKeys.self);
        let title = try container.decode(String.self, forKey: .title)
        let createTime = try container.decode(Date.self, forKey:.createTime)
        let duration = try container.decode(Int.self, forKey: .duration)
        //对于option
        let subTitle = try container.decodeIfPresent(String.self, forKey: .subTitle)
        //对于数组
        var unkeyedContainer = try container.nestedUnkeyedContainer(forKey: .slices)
        var percentages :[Float] = []
        while (!unkeyedContainer.isAtEnd) {
            let sliceDuration = try unkeyedContainer.decode(Float.self)
            percentages.append(sliceDuration/Float(duration))
        }

        self.init(title: title, subTitle: subTitle, createTime:createTime, slices: percentages, duration: duration)
        
    }
    
}


//对于上面的例子 如果解析的是服务器数据是下面的情况
let response = """
{
"title": "How to parse a json",
"subTitle": "null",
"createTime": "2017-08-24 00:00:00 +0800",
"duration": 500,
"slices": [125, 250, 375]
}
"""

let data = response.data(using: String.Encoding.utf8)!
let decoder = JSONDecoder()
//由String  转成date存储到Model中
decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
    let data = try decoder.singleValueContainer().decode(String.self)
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    return formatter.date(from: data)!
})

let newsModel = try! decoder.decode(NewsModel.self, from: data)
dump(newsModel)


// 再看扁平化处理JSON的编码和解码的例子
let demoData = """
{
    "name": "钢铁是怎么炼成的",
    "comment": "钢铁是快转那里不行哪里搬",
    "created_at": "2017-08-24 00:00:00 +0800",
    "meta": {
        "duration": 500,
        "slices": [125, 250, 375]
    }
}
"""

struct Book:Codable {
    var name:String
    var comment:String?
    var createAt:Date
    var duration:Int
    var slices:[Float]
    
    init(name:String,
         comment:String?,
         createAt:Date,
         duration:Int,
         slices:[Float]) {
        self.name = name
        self.comment = comment
        self.createAt = createAt
        self.duration = duration
        self.slices = slices
    }
    enum MetaCodingKeys :String,CodingKey{
        case duration
        case slices
    }
    enum CodingKeys:String,CodingKey {
        case name
        case comment
        case createAt = "crate_at"
        case meta
    }
    //编码过程的重新实现
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: Book.CodingKeys.name)
        try container.encode(comment, forKey: Book.CodingKeys.comment)
        try container.encode(createAt, forKey: Book.CodingKeys.createAt)

        var meta = container.nestedContainer(keyedBy: MetaCodingKeys.self, forKey: .meta)
        try meta.encode(duration, forKey: Book.MetaCodingKeys.duration)
        var unkeyedContainer = meta.nestedUnkeyedContainer(forKey: .slices)
        try slices.forEach {
            try unkeyedContainer.encode(Float(duration) * $0)
        }
    }
    
    //解压过程的重写
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let comment = try container.decodeIfPresent(String.self, forKey: .comment)
        let createAt = try container.decode(Date.self, forKey: .createAt)
        let metaContainer = try container.nestedContainer(keyedBy: MetaCodingKeys.self, forKey: Book.CodingKeys.meta)
        let duration = try metaContainer.decode(Int.self, forKey: Book.MetaCodingKeys.duration)
        //对于数组
        var unkeyedContainer = try metaContainer.nestedUnkeyedContainer(forKey: Book.MetaCodingKeys.slices)
        var percentages :[Float] = []
        while (!unkeyedContainer.isAtEnd) {
            let sliceDuration = try unkeyedContainer.decode(Float.self)
            percentages.append(sliceDuration/Float(duration))
        }
        self.init(name: name, comment: comment, createAt: createAt, duration: duration, slices: percentages)
    }
}

//解码
var demoData_data = demoData.data(using: .utf8)!

let demo_decoder = JSONDecoder()
demo_decoder.dateDecodingStrategy = .custom({
    (decoder) -> Date in
    let data = try decoder
        .singleValueContainer()
        .decode(String.self)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    
    return formatter.date(from: data)!
})

let demoModel =
    try! demo_decoder.decode(NewsModel.self, from: demoData_data)
dump(demoModel)

//解码方式
let demo_encoder = JSONEncoder()
demo_encoder.outputFormatting = .prettyPrinted
demo_encoder.dateEncodingStrategy = JSONEncoder.DateEncodingStrategy.custom({ (date, encoder) in
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
    let stringDate = formatter.string(from:date)
    var container = encoder.singleValueContainer();
    try container.encode(stringDate)
})
let demo_encodedData = try demo_encoder.encode(demoModel)

print(String(data: demo_encodedData, encoding: .utf8)!)
