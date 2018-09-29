//
//  WeatherDataManager.swift
//  Sky
//
//  Created by 刘红波 on 2018/7/29.
//  Copyright © 2018年 flex. All rights reserved.
//

import Foundation
import Configuratioin

final class WeatherDataManager {
    
    private let baseURL: URL
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    static let shared = WeatherDataManager(API.authenticatedUrl)
    
    typealias CompletionHandler =
        (WeatherData?, DataManagerError?) -> Void
    
    enum DataManagerError: Error {
        case failedRequest
        case invalidResponse
        case unknown
    }

    func weatherDataAt(
        latitude: Double,
        longitude: Double,
        completion: @escaping CompletionHandler) {
        
        let url = baseURL.appendingPathComponent("\(latitude), \(longitude)")
        var request = URLRequest(url: url)
        
        // 2. Set HTTP header
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 3. Launch the request
        URLSession.shared.dataTask(
            with: request, completionHandler: {
                (data, response, error) in
                // 4. Get the response here
                DispatchQueue.main.async {
                    self.didFinishGettingWeatherData(
                        data: data,
                        response: response,
                        error: error,
                        completion: completion)
                }
        }).resume()
        
    }
    
    
    func didFinishGettingWeatherData(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: CompletionHandler){
        
        if let _ = error {
            completion(nil, .failedRequest)
        }
        else if let data = data,
            let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                do {
                    let weatherData =
                        try JSONDecoder().decode(WeatherData.self, from: data)
                    completion(weatherData, nil)
                }
                catch {
                    completion(nil, .invalidResponse)
                }
            }
            else {
                completion(nil, .failedRequest)
            }
        }
        else {
            completion(nil, .unknown)
        }
        
    }
    
   
}
