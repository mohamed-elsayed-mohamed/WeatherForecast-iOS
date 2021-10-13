//
//  InteractorProtocol.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

protocol InteractorProtocol {
    var presenter: HomePresenter! { set get }
    
    func getWeather(latitude lat: Double, longitude lon: Double, requestFor request: Request)
}
