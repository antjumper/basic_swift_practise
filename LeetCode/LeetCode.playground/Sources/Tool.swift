import Foundation

public struct Tool {
    public init() {}

    public static func example(_ of:String,_ execution:()->()){
        print("\(of):")
        execution()
    }
}
