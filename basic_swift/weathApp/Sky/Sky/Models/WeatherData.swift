//
//  WeatherData.swift
//  Sky
//
//  Created by 刘红波 on 2018/7/29.
//  Copyright © 2018年 flex. All rights reserved.
//

import Foundation

struct WeatherData:Codable {
    let latitude : Double
    let longitude:Double
    let currently:CurrentWeather
    
    struct CurrentWeather:Codable {
        let time: Date
        let summary: String
        let icon: String
        let temperature: Double
        let humidity: Double
    }
    
}
