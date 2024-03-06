//
//  Name.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/19.
//

import Foundation

struct DogResponce: Codable {
    let message: [String: [String]]
}

struct DogImagesResponse: Codable {
    let message: [String]
}

enum DogError: Error {
    case invalidError
    case decodeError
}
