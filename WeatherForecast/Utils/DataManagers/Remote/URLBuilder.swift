//
//  URLBuilder.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 07/09/2021.
//

import Foundation


class URLBuilder {
    
    private var urlComponents: URLComponents!
    private var parameters: [URLQueryItem] = []
    
    init(withBaseURL url: String) {
        self.urlComponents = URLComponents(string: url)
    }
    
    func addQueryItem(key: String, value: String) -> URLBuilder {
        parameters.append(URLQueryItem(name: key, value: value))
        return self
    }
    
    func addQueryItem(key: String, value: Double) -> URLBuilder {
        parameters.append(URLQueryItem(name: key, value: String(value)))
        return self
    }
    
    func addQueryItem(key: String, values: [String]) -> URLBuilder {
        parameters.append(URLQueryItem(name: key, value: values.joined(separator: ",")))
        return self
    }
    
    func build() -> URL {
        if !parameters.isEmpty {
            urlComponents.queryItems = parameters
        }
        
        return urlComponents.url!
    }
}
