//
//  InteractiveControlsView.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

class InteractiveControlsView: UIViewController {
    var presenter: InteractiveControlsPresenterProtocol?
    private var ui: InteractiveControlsViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = InteractiveControlsViewUI(
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

extension InteractiveControlsView: InteractiveControlsViewProtocol {
    
}

extension InteractiveControlsView: InteractiveControlsViewUIDelegate {
    
}
