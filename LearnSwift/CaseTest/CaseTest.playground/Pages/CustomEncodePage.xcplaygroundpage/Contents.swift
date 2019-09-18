//: [Previous](@previous)

import Foundation

struct StructEpisode: Codable {
    let title: String
    let createdAt: Date
    let comment: String?
    let duration: Int = 100
    let slices: [Float] = [0.25, 0.5, 0.75]

    
    enum CodingKeys: String, CodingKey {
        case title
        case createdAt = "created_at"
        case comment
        case duration
        case slices

    }
}

//对于时间格式的处理可以走自定义编码过程来实现
extension StructEpisode {
    
    func encode(to encoder: Encoder) throws {
        // Todo: Add the custom encoding here
        //默认的实现是这样 内部使用了 Keyed Container
        var container = encoder.container(keyedBy: CodingKeys.self)
        //要编码的内容同时包含了key和value，我们仍旧通过CodingKeys.self告诉容器model中的属性和JSON中的key的对应规则
        try container.encode(title, forKey: .title)
        try container.encode(createdAt, forKey: .createdAt)
    //在默认的实现里，对于Optional类型，默认是用encodeIfPresent进行编码的，只有Optional不为nil，值才会编码到结果里 现在强制编码进来
        try container.encode(comment, forKey: .comment)

        //JSON中包含的是切片实际的时长
    //由于slices是JSON的一部分，因此，我们使用了nestedUnkeyedContainer方法，创建了一个Nested Unkeyed Container。然后，只要遍历数组中的每个成员，根据duration计算对应的时间，并把时间编码进Unkeyed Container就好了
        var unkeyedContainer =
            container.nestedUnkeyedContainer(forKey:.slices)
        try slices.forEach {
            try unkeyedContainer.encode(Float(duration) * $0)
        }
        
    }
}

let structEpisode = StructEpisode(
    title: "How to parse a JSON",
    createdAt: Date(),
    comment: nil)
let encoder = JSONEncoder()//为nil的对象并不在 json里面 怎么办呢
//自定义时间格式 要使用Single Value Container  由date转成String 存储到 json中
encoder.dateEncodingStrategy = JSONEncoder.DateEncodingStrategy.custom({ (date, encoder) in
    print("\(type(of: date)),data = \(date)")
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
    let stringDate = formatter.string(from:date)
    var container = encoder.singleValueContainer();
    try container.encode(stringDate)
    }
)

let data = try! encoder.encode(structEpisode)
dump(String(data: data, encoding: .utf8)!)


