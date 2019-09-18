//: [Previous](@previous)

import Foundation
import UIKit

print(Int.self)
print(5.self)
protocol ContentCell { }

class IntCell: UIView, ContentCell {
    required init(value: Int) {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StringCell: UIView, ContentCell {
    required init(value: String) {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func createCell(type: ContentCell.Type) -> ContentCell? {
    if let intCell = type as? IntCell.Type {
        return intCell.init(value: 5)
    } else if let stringCell = type as? StringCell.Type {
        return stringCell.init(value: "xx")
    }
    return nil
}

let intCell = createCell(type: IntCell.self)


//也可以使用类型推断，再结合泛型来使用：
func createCell_2<T: ContentCell>() -> T? {
    if let intCell = T.self as? IntCell.Type {
        return intCell.init(value: 5) as? T
    } else if let stringCell = T.self as? StringCell.Type {
        return stringCell.init(value: "xx") as? T
    }
    return nil
}

// 现在就根据返回类型推断需要使用的元类型
let stringCell: StringCell? = createCell_2()
