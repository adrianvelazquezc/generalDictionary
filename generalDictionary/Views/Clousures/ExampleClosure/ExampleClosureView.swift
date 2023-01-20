//
//  ExampleClosureView.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation
import UIKit

public protocol exampleProtocol {  //el tipo del protocolo es tipo exampleProtocol
    func choicedComplete(closureChoosed: Int)
}
class ExampleClosureView: UIViewController {
    var presenter: ExampleClosurePresenterProtocol?
    private var ui: ExampleClosureViewUI?
    internal var delegate: exampleProtocol?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = ExampleClosureViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.title = vcTitle
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension ExampleClosureView: ExampleClosureViewProtocol {
    
}

extension ExampleClosureView: ExampleClosureViewUIDelegate {
    func selectedClosure(closureChoosed: Int) {
        self.delegate?.choicedComplete(closureChoosed: closureChoosed)
    }
    
    
}
