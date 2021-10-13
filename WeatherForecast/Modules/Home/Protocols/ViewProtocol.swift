//
//  ViewProtocol.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

protocol ViewProtocol: AnyRemoteActions {
    var presenter: HomePresenter! { set get }
    
    func updateCurrent(current: CurrentWeatherModel)
}
