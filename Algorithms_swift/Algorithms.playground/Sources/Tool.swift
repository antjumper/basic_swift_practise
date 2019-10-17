import Foundation

import UIKit


public struct Tool {
  public init() {}
  public static func example(_ of:String,_ execution: ()->()){
        print("\(of):")
        execution()
    }
}

extension UIColor{
    public static func random()->UIColor{
        return UIColor(red: CGFloat.random0To1, green: CGFloat.random0To1, blue: CGFloat.random0To1, alpha: 1.0)
    }
}
extension CGFloat{
    public static var random0To1:CGFloat{
        get{
            let random = CGFloat(arc4random() % 255)/255.0;
            return random
        }
    }
}



