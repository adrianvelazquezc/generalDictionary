//
//  ProtocolsViewUI.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

protocol ProtocolsViewUIDelegate {
    
}

class ProtocolsViewUI: UIView{
    var delegate: ProtocolsViewUIDelegate?
    var navigationController: UINavigationController?
    let myString1 = "protocol"
    let myString2 = " MyProtocol"
    let myString3 = " { \n// protocol definition goes here \n}\n"
    let myAttribute1 = [ NSAttributedString.Key.foregroundColor: UIColor.black ]
    let myAttribute2 = [ NSAttributedString.Key.foregroundColor: UIColor.green ]
    let myAttribute3 = [ NSAttributedString.Key.foregroundColor: UIColor.lightGray ]
    
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Un protocolo define una interfaz de métodos, propiedades y otros requerimientos que se adapten a una tarea o función particular. Un protocolo puede ser adoptado por una clase, estructura o enum para proveer de una implementación a aquellos requerimientos mencionados. \n Podemos definir protocolos igual que las clases, structs y enums: \n"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        let myAttrString1 = NSAttributedString(string: myString1, attributes: myAttribute1)
        let myAttrString2 = NSAttributedString(string: myString2, attributes: myAttribute2)
        let myAttrString3 = NSAttributedString(string: myString3, attributes: myAttribute3)
        
        let combination = NSMutableAttributedString()
        combination.append(myAttrString1)
        combination.append(myAttrString2)
        combination.append(myAttrString3)
        label.attributedText = combination
        return label}()
    
    private lazy var infoLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Para conformar un protocolo lo ponemos al lado del nombre del tipo separado por dos puntos. Podemos poner tantos protocolos como queramos, eso sí, los debemos separar por comas. \n"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var exampleLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        let myString4 = "\n struc"
        let myString5 = " SomeStructure: MyProtocol, AnotherProtocol"
        let myString6 = " { \n// structure definition goes here \n} \n"
        
        let myAttribute4 = [ NSAttributedString.Key.foregroundColor: UIColor.systemBlue ]
        
        let myAttrString1 = NSAttributedString(string: myString1, attributes: myAttribute1)
        let myAttrString2 = NSAttributedString(string: myString2, attributes: myAttribute2)
        let myAttrString3 = NSAttributedString(string: myString3, attributes: myAttribute3)
        
        let myAttrString4 = NSAttributedString(string: myString4, attributes: myAttribute4)
        let myAttrString5 = NSAttributedString(string: myString2, attributes: myAttribute2)
        let myAttrString6 = NSAttributedString(string: myString3, attributes: myAttribute3)
        
        let combination = NSMutableAttributedString()
        combination.append(myAttrString1)
        combination.append(myAttrString2)
        combination.append(myAttrString3)
        combination.append(myAttrString4)
        combination.append(myAttrString5)
        combination.append(myAttrString6)
        label.attributedText = combination
        return label
    }()
    
    private lazy var delegatesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Delegados \n\nLa delegación es un patrón de diseño en el que una clase o struct delega un trabajo a otra. Los pasos serían así:\n \nLa clase A delega su trabajo a la clase B. \nLa clase B acaba y notifica a la clase A. \nLa clase A continua haciendo su trabajo. \n\nEste patrón es muy usado en la arquitectura MVP (Model-View-Presenter):\n La vista recibe una acción. Un botón ha sido pulsado \nLa vista delega la acción al presenter. \nEl presenter realiza algún trabajo. Por ejemplo, una llamada a backend.\nEl presenter una vez obtiene el resultado llama al que le ha delegado (a la vista) para refrescar la información de pantalla con los nuevos datos."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return label
    }()
    
    private lazy var explanationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "En resumen... Los protocolos indican lo que se realizara, los delegados indican quien lo va a realizar."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return label
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: ProtocolsViewUIDelegate){
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
        self.addSubview(scrollView)
        scrollView.addSubview(infoLabel)
        scrollView.addSubview(exampleLabel)
        scrollView.addSubview(infoLabel2)
        scrollView.addSubview(exampleLabel2)
        scrollView.addSubview(delegatesLabel)
        scrollView.addSubview(explanationLabel)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            self.infoLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.infoLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            self.exampleLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),
            self.exampleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.exampleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.exampleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            self.infoLabel2.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor),
            self.infoLabel2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.infoLabel2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.infoLabel2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            self.exampleLabel2.topAnchor.constraint(equalTo: infoLabel2.bottomAnchor),
            self.exampleLabel2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.exampleLabel2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.exampleLabel2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            self.delegatesLabel.topAnchor.constraint(equalTo: exampleLabel2.bottomAnchor),
            self.delegatesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.delegatesLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.delegatesLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            self.explanationLabel.topAnchor.constraint(equalTo: delegatesLabel.bottomAnchor, constant: 10),
            self.explanationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.explanationLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.explanationLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.explanationLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
        ])
    }
}
