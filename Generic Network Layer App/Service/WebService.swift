//
//  WebService.swift
//  Generic Network Layer App
//
//  Created by M Kaan Adanur on 8.04.2022.
//

import Foundation

class WebService {
    
    enum NetworkResponse<T> {
        case httpSuccess(T)
        case httpFail(NetworkError)
    }
    
    enum NetworkError {
        case urlError
        case decodeError
    }
    
    func fetchData<T>(model: T.Type, url: String, completion: @escaping (NetworkResponse<T>) -> Void) where T: Decodable {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.httpFail(.urlError))
            } else if let data = data {
                self.handleData(data: data, completion: completion)
            }
            
        }.resume()
    }
    
    func handleData<T>(data: Data?, completion: @escaping (NetworkResponse<T>) -> Void) where T: Decodable {
        guard let data = data else { return completion(.httpFail(.urlError)) }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.httpSuccess(result))
        } catch {
            print(error.localizedDescription)
            completion(.httpFail(.decodeError))
        }
        
    }
    
}
