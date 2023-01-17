//
//  SavedInfoViewUI.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation
import UIKit

protocol SavedInfoViewUIDelegate {
    
}

class SavedInfoViewUI: UIView{
    var delegate: SavedInfoViewUIDelegate?
    var navigationController: UINavigationController?
    let userDefaults = UserDefaults.standard
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "La persistencia de datos en iOS se produce gracias a una pequeña memoria flash que tiene nuestro dispositivo, el cual es equivalente a un disco duro de tamaño limitado. Los datos que ahí se almacenen se conservarán aunque el dispositivo se apague"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var startTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.layer.borderWidth = 1
        textField.delegate = self
        return textField
    }()
    
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    public convenience init(
        navigation: UINavigationController,
        delegate: SavedInfoViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            self.addGestureRecognizer(gestoTap)
            
            //revisar
            if let name = userDefaults.string(forKey: "example") {
                startTextField.text = "\(name)" // Some String Value
            }
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.backgroundColor = .white
        self.addSubview(infoLabel)
        self.addSubview(startTextField)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.startTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 30),
            self.startTextField.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            self.startTextField.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
        ])
    }
}
extension SavedInfoViewUI: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        userDefaults.set(textField.text, forKey: "example")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        userDefaults.set(textField.text, forKey: "example")
    }
}
