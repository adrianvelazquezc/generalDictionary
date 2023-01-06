//
//  AppDelegateView.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

class AppDelegateView: UIViewController {
    var presenter: AppDelegatePresenterProtocol?
    private var ui: AppDelegateViewUI?
    internal var vcTitle: String?

    
    override func loadView() {
        ui = AppDelegateViewUI(
            navigation: self.navigationController!,
            delegate: self,
            vcTitle: self.vcTitle ?? ""
        )
        view = ui
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = vcTitle
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension AppDelegateView: AppDelegateViewProtocol {
    
}

extension AppDelegateView: AppDelegateViewUIDelegate {
    
}
