//
//  HomePresenter.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation

// Contain ref to view, interactor, router
class HomePresenter: PresenterProtocol {
    
    private weak var view: HomeView!
    
    private let interactor: HomeInteractor!
    
    private let router: HomeRouter!
    
    var collectionCellsCount: Int = 0
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getTodayData() {
        self.collectionCellsCount = 5
        view?.reloadData()
    }
    
    func getWeekData() {
        self.collectionCellsCount = 10
        view?.reloadData()
    }
}
