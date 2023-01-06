//
//  HomeMain.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

open class HomeMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: HomeView? = HomeView()
        if let view = viewController {
            let presenter = HomePresenter()
            let router = HomeRouter()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.router = router
            
            router.navigation = navigation
            
            return view
        }
        return UIViewController()
    }
}
