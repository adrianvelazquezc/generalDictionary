//
//  SavedInfoMain.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation
import UIKit

open class SavedInfoMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: SavedInfoView? = SavedInfoView()
        if let view = viewController {
            let presenter = SavedInfoPresenter()
            let router = SavedInfoRouter()
            let interactor = SavedInfoInteractor()
            
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
