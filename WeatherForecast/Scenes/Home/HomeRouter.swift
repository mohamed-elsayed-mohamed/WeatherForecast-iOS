//
//  HomeRouter.swift
//  WeatherForecast
//
//  Created by Mohamed Elsayed on 05/09/2021.
//

import Foundation
import UIKit

// Contains ref to entery point view
class HomeRouter: RouterProtocol {
    
    var entryPoint: UIViewController?
    
}

extension HomeRouter {
    static func start() -> HomeRouter {
        /// Init Router
        let router = HomeRouter()
        
        /// Init VIP
        let view = UIStoryboard.init(name: Constants.mainStoryboard, bundle: Bundle.main).instantiateViewController(identifier: Constants.ViewControllers.home) as! HomeView
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        router.entryPoint = view
        
        return router
    }

}
