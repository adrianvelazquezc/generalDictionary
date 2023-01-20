//
//  ClousuresRouter.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation
import UIKit

class ClousuresRouter{
    var navigation: UINavigationController?
}

extension ClousuresRouter: ClousuresRouterProtocol{
    func navigateExampleView(delegate: exampleProtocol) {
        if let nav = navigation {
            let vc = ExampleClosureMain.createModule(navigation: nav, vcTitle: "Ejemplo de Closures", delegate: delegate)
            navigation?.pushViewController(vc, animated: true)
        }
    }
    
    
}
