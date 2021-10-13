//
//  HomePresenter.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

// Contain ref to view, interactor, router
class HomePresenter: PresenterProtocol {

    private weak var view: HomeView!
    
    private let interactor: HomeInteractor!
    
    private let router: HomeRouter!
    
    private var rowsCount: Int = 0
    
    private var hourlyWeather = [CurrentHourly]()
    
    private var dailyWeather = [Daily]()
    
    var numOfWeatherCount: Int {
        return rowsCount
    }
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        /// Get data from user defaults (Cached Weather)
        // Get cached weather
        self.getCurrentWeather()
        self.getHourlyWeather()
    }
    
    private func getCurrentWeather() {
        interactor.getWeather(latitude: 31.1467777, longitude: 30.9073034, requestFor: .Currently)
    }
    
    func getHourlyWeather() {
        /// Check
        interactor.getWeather(latitude: 31.1467777, longitude: 30.9073034, requestFor: .Hourly)
    }
    
    func getDailyWeather() {
        interactor.getWeather(latitude: 31.1467777, longitude: 30.9073034, requestFor: .Daily)
    }
    
    func weatherFeatchedSuccessfully(weather: BaseWeather) {
        if weather.hourly == nil && weather.daily == nil {
            view.updateCurrent(current: CurrentWeatherModel(weather: weather))
            return
        }
        
        if let hourly = weather.hourly {
            self.hourlyWeather = hourly
            self.rowsCount = hourly.count
        } else if let dailyWeather = weather.daily {
            self.dailyWeather = dailyWeather
            self.rowsCount = dailyWeather.count
        }
        
        view.onSuccess()
    }
    
    func weatherFeatchingFailed(withError: Error) {
//        print(withError)
    }
    
    func configure(cell: HomeCell, index: Int) {
        if(rowsCount == hourlyWeather.count){
            let hour = hourlyWeather[index]
            cell.configure(weatherCellModel: WeatherCellModel(withHour: hour))
        } else if (rowsCount == dailyWeather.count){
            let day = dailyWeather[index]
            cell.configure(weatherCellModel: WeatherCellModel(withDay: day))
        }
    }
}
