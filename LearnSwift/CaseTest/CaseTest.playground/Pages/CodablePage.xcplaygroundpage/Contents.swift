//: [Previous](@previous)

import Foundation

//使用Codable 解析JSON

let response = """
{
"title": "How to parse JSON in Swift 4",
"series": "What's new in Swift 4",
"create_by": "Mars",
"type": "free",
"origin":"bGl1aG9uZ2Jv",
"url":"www.baidu.com"
}
"""

//model
enum StructType:String,Codable {
    case free
    case paid
}

struct StructEntityy:Codable {
    var title:String
    var series:String
    var type:StructType
    var creator:String //服务端对应的字段是create_by时
    //原理--编译器会在遵从了Codable的类型中安插一个enum CodingKeys: String, CodingKey类型，并通过这个类型完成映射。）
    var createdAt:Date?//时间处理
    var origin:Data?  //二进制的情况
    let url:URL
    
    // 和服务端字段不一致处理
    enum CodingKeys:String,CodingKey {
        case title
        case series
        case type
        case creator = "create_by"
        case createdAt
        case origin
        case url
        
    }
}

var data = response.data(using: String.Encoding.utf8)!//转成Data 类型
let decoder = JSONDecoder()
decoder.dataDecodingStrategy = .base64
let entity = try! decoder.decode(StructEntityy.self, from: data);
dump(String(data: entity.origin!, encoding: .utf8) ?? "v-decoder")

print(entity)

let entity_2 = StructEntityy(title: "How to parse JSON in Swift 4", series: "What's new in Swift 4", type: .free,  creator:  "Mars",createdAt: Date(),origin:"liuhongbo".data(using:String.Encoding.utf8)!, url:URL(string: "www.baidu.com")!)
let encoder = JSONEncoder()
//打印的好看一些
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .iso8601
data = try! encoder.encode(entity_2)

//Date转成的样子是这样  "createdAt" : 589883274.77192402
print(String(data: data, encoding: String.Encoding.utf8) ?? "default value")

//为了处理时间的这种情况
//上面代码设置：encoder.dateEncodingStrategy = .iso8601



//嵌套解析

//案例一
/*
 {
 "list": [
 {
 "title": "How to parse JSON in Swift 4 - I",
 "series": "What's new in Swift 4",
 "created_by": "Mars",
 "type": "free",
 "created_at": "2017-08-23T01:42:42Z",
 "duration": "NaN",
 "origin": "Ym94dWVpby5jb20=",
 "url": "boxueio.com"
 },
 {
 "title": "How to parse JSON in Swift 4 - II",
 "series": "What's new in Swift 4",
 "created_by": "Mars",
 "type": "free",
 "created_at": "2017-08-23T01:42:42Z",
 "duration": "NaN",
 "origin": "Ym94dWVpby5jb20=",
 "url": "boxueio.com"
 }
 ]
 }
 
 解析的话
 struct EpisodeList: Codable {
 let list: [Episode]
 }
 
 let list = try! decoder.decode(EpisodeList.self, from: data)
 dump(list)
 */

//案例二

/*
 [
 {
 "title": "How to parse JSON in Swift 4 - I",
 "series": "What's new in Swift 4",
 "created_by": "Mars",
 "type": "free",
 "created_at": "2017-08-23T01:42:42Z",
 "duration": "NaN",
 "origin": "Ym94dWVpby5jb20=",
 "url": "boxueio.com"
 },
 {
 "title": "How to parse JSON in Swift 4 - II",
 "series": "What's new in Swift 4",
 "created_by": "Mars",
 "type": "free",
 "created_at": "2017-08-23T01:42:42Z",
 "duration": "NaN",
 "origin": "Ym94dWVpby5jb20=",
 "url": "boxueio.com"
 }
 ]
 
 let list = try! decoder.decode([Episode].self, from: data)
 
 dump(list)
 
 */

//案例三
/*
 [
 {
 "episode": {
 "title": "How to parse JSON in Swift 4 - I",
 "series": "What's new in Swift 4",
 "created_by": "Mars",
 "type": "free",
 "created_at": "2017-08-23T01:42:42Z",
 "duration": "NaN",
 "origin": "Ym94dWVpby5jb20=",
 "url": "boxueio.com"
 }
 },
 ...
 ]
 
 let list = try! decoder.decode(
 [Dictionary<String, Episode>].self, from: data)
 
 dump(list)
 */

//案例四
/*
 let response = """
 {
 "meta": {
 "total_exp": 1000,
 "level": "beginner",
 "total_duration": 120
 },
 "list": [
 {
 "title": "How to parse JSON in Swift 4 - I",
 "series": "What's new in Swift 4",
 "created_by": "Mars",
 "type": "free",
 "created_at": "2017-08-23T01:42:42Z",
 "duration": "NaN",
 "origin": "Ym94dWVpby5jb20=",
 "url": "boxueio.com"
 },
 {
 "title": "How to parse JSON in Swift 4 - II",
 "series": "What's new in Swift 4",
 "created_by": "Mars",
 "type": "free",
 "created_at": "2017-08-23T01:42:42Z",
 "duration": "NaN",
 "origin": "Ym94dWVpby5jb20=",
 "url": "boxueio.com"
 }
 ]
 }
 """
 
 
 
 struct EpisodePage: Codable {
 let meta: EpisodeMeta
 let list: [Episode]
 
 //内嵌类
 struct EpisodeMeta: Codable {
 let total_exp: Int
 let level: EpisodeLevel
 let total_duration: Int
 
 enum EpisodeLevel: String, Codable {
 case beginner
 case intermediate
 case advanced
 }
 }
 //内嵌类
 struct Episode: Codable {
 let title: String
 let series: String
 let createdBy: String
 let type: EpisodeType
 let createdAt: Date
 let duration: Float
 let origin: Data
 let url: URL
 
 enum CodingKeys: String, CodingKey {
 case title
 case series
 case createdBy = "created_by"
 case type
 case createdAt = "created_at"
 case duration
 case origin
 case url
 }
 
 enum EpisodeType: String, Codable {
 case free
 case paid
 }
 }
 
 }
 
 let page = try! decoder.decode(
 EpisodePage.self, from: data)
 
 dump(page)
 */

