//
//  ViewProtocol.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

protocol ViewProtocol {
    var presenter: HomePresenter! { set get }
    func reloadData()
}
