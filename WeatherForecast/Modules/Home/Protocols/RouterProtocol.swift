//
//  RouterProtocol.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    
    var entryPoint: UITabBarController? { get }
    var view: HomeView! { get }
    
    static func start() -> HomeRouter
}
