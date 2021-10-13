//
//  RemoteManager.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 07/09/2021.
//

import Foundation
import Alamofire

class RemoteManager {
    func getData<T: Decodable>(withURL url: URL, responseClass: T.Type, completion: @escaping (Result<T?, NSError>) -> ()) {
        
        if (!RemoteManager.isConnectedWithInterner()) {
            completion(.failure(generateError(description: "No Internet Connection", code: 404)))
        }
        
        AF.request(url, method: .get).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else {
                completion(.failure(self.generateError(description: "Failed to load data", code: -1)))
                return
            }
            
            if statusCode == 200 {
                guard let jsonObject = try? response.result.get() else { return }
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject) else { return }
//                guard let result = try? JSONDecoder().decode(T.self, from: jsonData) else { return }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                    completion(.success(result))
                } catch  {
                    print(error)
                }
                
                
            } else {
                completion(.failure(self.generateError(description: "Failed to load data", code: -1)))
            }
        }
    }
    
    private func generateError(description: String, code: Int) -> NSError {
        return NSError(domain: "\(RemoteManager.self) Error", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    class func isConnectedWithInterner() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
