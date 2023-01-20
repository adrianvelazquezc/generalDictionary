//
//  ExampleClosureMain.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation
import UIKit

open class ExampleClosureMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String, delegate: exampleProtocol) -> UIViewController {
        let viewController: ExampleClosureView? = ExampleClosureView()
        if let view = viewController {
            let presenter = ExampleClosurePresenter()
            let router = ExampleClosureRouter()
            let interactor = ExampleClosureInteractor()
            
            view.presenter = presenter
            view.vcTitle = vcTitle
            view.delegate = delegate
            
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
