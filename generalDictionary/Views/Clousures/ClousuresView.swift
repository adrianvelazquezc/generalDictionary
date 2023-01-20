//
//  ClousuresView.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation
import UIKit

class ClousuresView: UIViewController {
    var presenter: ClousuresPresenterProtocol?
    private var ui: ClousuresViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = ClousuresViewUI(
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

extension ClousuresView: ClousuresViewProtocol {
    
}

extension ClousuresView: ClousuresViewUIDelegate {
    func notifyGoExampleView() {
        self.presenter?.requestExampleView(delegate: self)
    }
    
    
}
extension ClousuresView: exampleProtocol {
    func choicedComplete(closureChoosed: Int) {
        ui?.showClosureChoosed(closureChoosed: closureChoosed)
    }
    
}
