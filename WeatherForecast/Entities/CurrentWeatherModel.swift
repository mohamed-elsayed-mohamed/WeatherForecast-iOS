//
//  CurrentWeatherModel.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 08/09/2021.
//

import Foundation

struct CurrentWeatherModel {
    var date: String!
    var temp: String!
    var tempUnit: String!
    var imgStatusURL: URL!
    var location: String!
    var cloud: String!
    var wind: String!
    var humidity: String!
    var pressure: String!

    
    init(weather: BaseWeather) {
        guard let current = weather.current else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, d MMM"
        
        date = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(current.dt)))
        
        if let temp = current.temp {
            self.temp = String(format: "%.0f", temp)
        } else {
            self.temp = "N/A"
        }
        
        tempUnit = "oK" + "\u{2074}"

        
        if let icon = current.weather?[0].icon {
            imgStatusURL = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
        }
        
        location = "Alexandria, Egypt"
        cloud = String(current.clouds ?? 0) + " %"
        wind = String(format: "%.0f", current.windSpeed ?? 0) + " M/S"
        humidity = String(current.humidity ?? 0) + " %"
        pressure = String(current.pressure ?? 0) + " hpa"
    }
}
