//
//  ColorModel.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/28/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

struct ColorResponse : Codable {
    let hex: hexWrapper
    let name: nameWrapper
    let rgb: fractionWrapper
    
    static func getColors (from data: Data) throws -> [ColorResponse] {
        do {
            let colorData = try JSONDecoder().decode([ColorResponse].self, from: data)
            return colorData
        } catch {
            throw JSONError.decodingError(error)
        }
    
}
}

struct hexWrapper : Codable {
    let value: String
}


struct nameWrapper : Codable {
    let value: String
}

struct fractionWrapper : Codable {
    let fraction: rgbWrapper
}

struct rgbWrapper : Codable {
    let r: Double
    let g: Double
    let b: Double
}
