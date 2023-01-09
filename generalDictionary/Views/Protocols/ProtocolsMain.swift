//
//  ProtocolsMain.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

open class ProtocolsMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: ProtocolsView? = ProtocolsView()
        if let view = viewController {
            let presenter = ProtocolsPresenter()
            let router = ProtocolsRouter()
            let interactor = ProtocolsInteractor()
            
            view.presenter = presenter
            view.vcTitle = vcTitle
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}
