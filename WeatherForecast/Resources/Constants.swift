//
//  Constants.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

struct Constants {
    
    static let appName = "Weather Forecast"
    static let mainStoryboard = "Main"
    static let homeStoryboard = "Home"
    
    struct ViewControllers {
        static let home = "HomeView"
    }
    
    struct Cells {
        static let homeCell = "HomeCell"
    }
    
    struct API {
        static let BASE_URL = "https://api.openweathermap.org/data/2.5/onecall"
        static let API_KEY = "5d81fed7ec24e35f8359e5d0d3919b5a"
        static let excludeCurrent = "current"
        static let excludeMinutely = "minutely"
        static let excludeHourly = "hourly"
        static let excludeDaily = "daily"
        
        struct Keys {
            static let lat = "lat"
            static let lon = "lon"
            static let exclude = "exclude"
            static let appid = "appid"
        }
    }
}
