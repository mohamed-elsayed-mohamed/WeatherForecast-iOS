//
//  HomeInteractor.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

// Contains ref to presenter
class HomeInteractor: InteractorProtocol {
    weak var presenter: HomePresenter!
    
    func getWeather(latitude lat: Double, longitude lon: Double, requestFor request: Request) {
        
        let url = URLBuilder(withBaseURL: Constants.API.BASE_URL)
            .addQueryItem(key: Constants.API.Keys.lat, value: lat)
            .addQueryItem(key: Constants.API.Keys.lon, value: lon)
            .addQueryItem(key: Constants.API.Keys.exclude, values: excludefor(request: request))
            .addQueryItem(key: Constants.API.Keys.appid, value: Constants.API.API_KEY)
            .build()
        
        RemoteManager().getData(withURL: url, responseClass: BaseWeather.self) { [weak self] (result) in
            guard let self = self else { return }
            switch(result){
            case .success(let weather):
                guard let weather = weather else { return }
                self.presenter.weatherFeatchedSuccessfully(weather: weather)
            case .failure(let error):
                self.presenter.weatherFeatchingFailed(withError: error)
            }
        }
    }
    
    private func excludefor(request: Request) -> [String] {
        switch(request){
        case .Currently:
            return [Constants.API.excludeMinutely, Constants.API.excludeHourly, Constants.API.excludeDaily]
        case .Hourly:
            return [Constants.API.excludeCurrent, Constants.API.excludeMinutely, Constants.API.excludeDaily]
        case .Daily:
            return [Constants.API.excludeCurrent, Constants.API.excludeMinutely, Constants.API.excludeHourly]
        }
    }
}
