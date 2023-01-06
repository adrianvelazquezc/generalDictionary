//
//  HomeRouter.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

class HomeRouter{
    var navigation: UINavigationController?
}

extension HomeRouter: HomeRouterProtocol{
    func navigateNextView(view: List) {
        if let navigationController = self.navigation{
            navigationController.pushViewController(view.viewController, animated: true )
        }
    }
    
    
}
