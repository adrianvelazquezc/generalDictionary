//
//  ClousuresProtocols.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation

protocol ClousuresViewProtocol: AnyObject {
    
}

protocol ClousuresInteractorProtocol: AnyObject {
    
}

protocol ClousuresPresenterProtocol: AnyObject {
    func requestExampleView(delegate: exampleProtocol)
}

protocol ClousuresRouterProtocol: AnyObject {
    func navigateExampleView(delegate: exampleProtocol)
}
