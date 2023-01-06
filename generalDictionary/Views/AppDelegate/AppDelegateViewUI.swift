//
//  AppDelegateViewUI.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

protocol AppDelegateViewUIDelegate {
    
}

class AppDelegateViewUI: UIView{
    var delegate: AppDelegateViewUIDelegate?
    var navigationController: UINavigationController?
    var vcTitle: String?
    
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Es un fichero, podemos encontrar las propiedades iniciales de la app y unas funciones que vienen establecidas por defecto. \n \nLas funciones que encontramos allí están relacionadas con varios aspectos. La primera es una función para poder iniciar la app, es decir, está destinada a ejecutarse cuando se entra a la app; lo que quiere decir que es un espacio para añadir las configuraciones que se realicen al abrirla.  \n \nLas otras funciones que se encuentran en AppDelegate son especiales para conectarse con el fichero de SceneDelegate, que, en pocas palabras, se puede definir como el espacio donde se controla la primera pantalla que se ve en la aplicación y cuando esta pasa de primer a segundo plano y viceversa. "
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "var window: UIWindow? \n \nlet navigation = UINavigationController()\n \nwindow = UIWindow(frame: UIScreen.main.bounds)\n window?.rootViewController = navigation\n window?.makeKeyAndVisible() //para hacerla la principal y visible\n //instancia la vista a la que se va a llamar\n let vc = HomeMain.createModule(navigation: navigation)\n //se le hace push (se visualiza la vista)\n navigation.pushViewController(vc, animated: true)\nreturn true"
        label.numberOfLines = 0
        return label
    }()
    
    
    public convenience init(
        navigation: UINavigationController,
        delegate: AppDelegateViewUIDelegate,
        vcTitle: String){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            self.vcTitle = vcTitle
            
            
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
        self.backgroundColor = .link
        self.addSubview(infoLabel)
        self.addSubview(exampleLabel)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.exampleLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            self.exampleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.exampleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.exampleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
    }
}
