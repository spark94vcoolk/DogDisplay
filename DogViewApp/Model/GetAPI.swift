//
//  GetAPI.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/19.
//

import Foundation

class Dog {
    
    func setDogList() async -> Result<DogResponce, DogError> {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            return .failure(.invalidError)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(DogResponce.self, from: data)
            return .success(response)
        } catch {
            return .failure(.decodeError)
        }
    }
}
