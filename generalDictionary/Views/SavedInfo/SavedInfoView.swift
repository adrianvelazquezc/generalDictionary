//
//  SavedInfoView.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation
import UIKit

class SavedInfoView: UIViewController {
    var presenter: SavedInfoPresenterProtocol?
    private var ui: SavedInfoViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = SavedInfoViewUI(
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

extension SavedInfoView: SavedInfoViewProtocol {
    
}

extension SavedInfoView: SavedInfoViewUIDelegate {
    
}
