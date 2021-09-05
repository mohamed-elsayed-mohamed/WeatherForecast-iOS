//
//  HomeView.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import UIKit

// Contains ref to presenter
class HomeView: UIViewController, ViewProtocol {
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(presenter)
    }
    
}
