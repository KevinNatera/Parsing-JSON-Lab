//
//  WeatherModel.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/27/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

enum JSONError : Error {
    case decodingError(Error)
}

struct WeatherResponse : Codable {
    
    let name: String
    let main: Temperature
    let weather: [WeatherWrapper]
    
    static func getWeatherData(from data: Data) throws -> [WeatherResponse] {
        do {
            let weatherData = try JSONDecoder().decode([WeatherResponse].self, from: data)
            return weatherData
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}



struct Temperature : Codable {
    let temp: Double
}


struct WeatherWrapper : Codable {
    let description: String
}
