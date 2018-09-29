//
//  Configuratioin..swift
//  Sky
//
//  Created by 刘红波 on 2018/7/29.
//  Copyright © 2018年 flex. All rights reserved.
//

import Foundation

struct API {
    static let key = "your_secret_key_here"
    static let baseUrl = URL(string: "https://api.darksky.net/forecast")!
    static let authenticatedUrl = baseUrl.appendingPathComponent(key)
}
