//
//  WeatherCellModel.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 08/09/2021.
//

import Foundation

struct WeatherCellModel {
    var imageURL: URL!
    var date: String!
    var status: String!
    var temp: String!
    var tempUnit: String!
    
    
    init(withHour hourly: CurrentHourly) {
        
        if let icon = hourly.weather?[0].icon {
            imageURL = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
        }
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        
        date = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(hourly.dt)))
        
        status = hourly.weather?[0].description
        if let temp = hourly.temp {
            self.temp = String(format: "%.0f", temp)
        } else {
            self.temp = "N/A"
        }
        
        tempUnit = "oK"
    }
    
    init(withDay day: Daily) {
        let icon = day.weather[0].icon
        imageURL = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        
        date = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(day.dt)))
        
        status = day.weather[0].description
        self.temp = String(format: "%.0f", day.temp.day)
    }
}
