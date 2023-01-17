//
//  APISRouter.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation
import UIKit

class APISRouter{
    var navigation: UINavigationController?
}

extension APISRouter: APISRouterProtocol{
    func navigateNextView(url: String){
        if let navigationController = self.navigation{
            let vc = SecondApiMain.createModule(navigation: navigationController, url: url)
            navigationController.pushViewController(vc, animated: true )
        }
    }
}
