//
//  ControllersView.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

class ControllersView: UIViewController {
    var presenter: ControllersPresenterProtocol?
    private var ui: ControllersViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = ControllersViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.title = vcTitle
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension ControllersView: ControllersViewProtocol {
    
}

extension ControllersView: ControllersViewUIDelegate {
    
}
