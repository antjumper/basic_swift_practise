
import Foundation

//兼容新旧版本数据的方法 例如新旧版本里面的时间格式是不一样的


struct APICodingOptions {
    enum Version {
        case v1
        case v2
    }
    
    let apiVersion:Version
    var dateFormatter:DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM-dd-yyyy HH:mm:ss zzz"

        switch apiVersion {
        case .v1:
            formatter.dateFormat = "MMM-dd-yyyy HH:mm:ss zzz"
        case .v2:
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        }
        
        return formatter
    }
    
    static let infoKey = CodingUserInfoKey(rawValue:"liuhongbo.api_coding_options")!
}

func encode<T>(of model:T,APIOptional:APICodingOptions? = nil) throws where T:Codable {
    let encoder = JSONEncoder()
    encoder.outputFormatting = JSONEncoder.OutputFormatting.prettyPrinted
    if let optionalAPI = APIOptional {
        //通过userInfo 存储版本信息
        encoder.userInfo[APICodingOptions.infoKey] = optionalAPI
    }
    let encodeData = try encoder.encode(model)
    print(String(data: encodeData, encoding: String.Encoding.utf8)!)
}

struct api:Codable{
    var createdAt:Date
    
    enum CodingKeys:String,CodingKey {
        case createdAt = "created_at"
    }
    
    func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //通过userInfo 读取版本控制信息
        if let versionC = encoder.userInfo[APICodingOptions.infoKey] as? APICodingOptions {
            let dateString = versionC.dateFormatter.string(from: createdAt)
            try container.encode(dateString, forKey: .createdAt)
        }else{
           fatalError()
        }
    }
}

let someApi = api(createdAt: Date())
let version = APICodingOptions(apiVersion: APICodingOptions.Version.v2)
try! encode(of: someApi, APIOptional: version)
/*
 v1
{
    "created_at" : "Sep-12-2019 18:06:11 GMT+8"
}
 */

/*
 v2
 {
 "created_at" : "2019-09-12 18:07:01 +0800"
 }
 */


