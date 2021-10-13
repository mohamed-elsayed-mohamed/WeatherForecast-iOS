//
//  PresenterProtocol.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

protocol PresenterProtocol {
    var numOfWeatherCount: Int { get }
    func viewDidLoad()
    func getHourlyWeather()
    func getDailyWeather()
    func weatherFeatchedSuccessfully(weather: BaseWeather)
    func weatherFeatchingFailed(withError: Error)
    func configure(cell: HomeCell, index: Int)
}
