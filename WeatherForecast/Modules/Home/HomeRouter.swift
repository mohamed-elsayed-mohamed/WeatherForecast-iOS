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
    
    var entryPoint: UITabBarController?
    
    weak var view: HomeView!
}

extension HomeRouter {
    
    static func start() -> HomeRouter {
        /// Init Router
        let router = HomeRouter()
        
        let rootView = UIStoryboard.init(name: Constants.mainStoryboard, bundle: Bundle.main).instantiateInitialViewController() as! UITabBarController
        let nav = rootView.viewControllers![0] as! UINavigationController
        
        /// Init VIP
        let view = nav.viewControllers[0] as! HomeView
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        router.entryPoint = rootView
        router.view = view
        
        return router
    }

}
