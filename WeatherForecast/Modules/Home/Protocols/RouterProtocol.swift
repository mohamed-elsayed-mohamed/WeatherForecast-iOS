//
//  RouterProtocol.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    
    var entryPoint: UIViewController? { get }
    
    static func start() -> HomeRouter
}
