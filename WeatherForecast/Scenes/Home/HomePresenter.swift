//
//  HomePresenter.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

// Contain ref to view, interactor, router
class HomePresenter: PresenterProtocol {
    
    private weak var view: HomeView?
    
    private let interactor: HomeInteractor?
    
    private let router: HomeRouter?
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
