//
//  AttributesViewUI.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

protocol AttributesViewUIDelegate {
    
}

class AttributesViewUI: UIView{
    var delegate: AttributesViewUIDelegate?
    var navigationController: UINavigationController?
    
    
    private lazy var infoLabel0: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Se te presentara un label, en este label se te mostrara como ira cambiando a lo largo que se le agregan caracteristicas"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var infoLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Texto de muestra"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var infoLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "label.textColor = .brown"
        label.numberOfLines = 0
        label.textColor = .brown
        return label
    }()
    
    private lazy var infoLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "label.font = .systemFont(ofSize: 20)"
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .brown
        return label
    }()
    
    private lazy var infoLabel4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "label.textAlignment = .center"
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .brown
        return label
    }()
    
    private lazy var infoLabel5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "label.adjustsFontSizeToFitWidth = true //no importa que tanto espacio requiera se ajustara al ancho"
        label.font = .systemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .brown
        return label
    }()
    
    private lazy var infoLabel6: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        let myString1 = "Attributed"
        let myString2 = " Text"
        let myAttribute1 = [ NSAttributedString.Key.foregroundColor: UIColor.blue]
        let myAttribute2 = [ NSAttributedString.Key.foregroundColor: UIColor.red]
        let myAttrString1 = NSAttributedString(string: myString1, attributes: myAttribute1)
        let myAttrString2 = NSAttributedString(string: myString2, attributes: myAttribute2)
        let combination = NSMutableAttributedString()
        combination.append(myAttrString1)
        combination.append(myAttrString2)
        label.attributedText = combination
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var infoLabel7: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "let myString1 = ”Attributed” \nlet myString2 = ” Text” \nlet myAttribute1 = [ NSAttributedString.Key.foregroundColor: UIColor.blue] \nlet myAttribute2 = [ NSAttributedString.Key.foregroundColor: UIColor.red] \nlet myAttrString1 = NSAttributedString(string: myString1, attributes: myAttribute1) \nlet myAttrString2 = NSAttributedString(string: myString2, attributes: myAttribute2) \nlet combination = NSMutableAttributedString() \ncombination.append(myAttrString1) \ncombination.append(myAttrString2) \nlabel.attributedText = combination"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: AttributesViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
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
        self.addSubview(infoLabel0)
        self.addSubview(infoLabel1)
        self.addSubview(infoLabel2)
        self.addSubview(infoLabel3)
        self.addSubview(infoLabel4)
        self.addSubview(infoLabel5)
        self.addSubview(infoLabel6)
        self.addSubview(infoLabel7)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            infoLabel0.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            infoLabel0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel1.topAnchor.constraint(equalTo: infoLabel0.bottomAnchor, constant: 20),
            infoLabel1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel2.topAnchor.constraint(equalTo: infoLabel1.bottomAnchor, constant: 20),
            infoLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel3.topAnchor.constraint(equalTo: infoLabel2.bottomAnchor, constant: 20),
            infoLabel3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel4.topAnchor.constraint(equalTo: infoLabel3.bottomAnchor, constant: 20),
            infoLabel4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel5.topAnchor.constraint(equalTo: infoLabel4.bottomAnchor, constant: 20),
            infoLabel5.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel5.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel6.topAnchor.constraint(equalTo: infoLabel5.bottomAnchor, constant: 20),
            infoLabel6.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel6.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoLabel7.topAnchor.constraint(equalTo: infoLabel6.bottomAnchor, constant: 20),
            infoLabel7.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel7.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
