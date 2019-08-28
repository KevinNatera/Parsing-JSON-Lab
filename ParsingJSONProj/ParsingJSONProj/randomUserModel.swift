//
//  randomUserModel.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/27/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

struct Response : Codable {

    let results: [User]
    
    
    static func getRandomUsers(from data: Data) throws -> [User] {
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.results
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
    
}


struct User : Codable {
    let gender: String
    let name: NameWrapper
    let location: LocationWrapper
    let email: String
    let dob: DobWrapper
    let phone: String
}

struct NameWrapper : Codable {
    let title: String
    let first: String
    let last: String
}

struct LocationWrapper : Codable {
    let street: String
    let city: String
    let state: String

}

struct DobWrapper : Codable {
    let date: String
    let age: Int
}
