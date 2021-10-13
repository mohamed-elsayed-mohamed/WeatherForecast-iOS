//
//  AnyRemoteActions.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 08/09/2021.
//

import Foundation

protocol AnyRemoteActions {
    func onLoading()
    func onSuccess()
    func onError(error: Error)
}
