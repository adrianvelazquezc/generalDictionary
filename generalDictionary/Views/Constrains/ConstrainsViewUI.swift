//
//  ConstrainsViewUI.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

protocol ConstrainsViewUIDelegate {
    
}

class ConstrainsViewUI: UIView{
    var delegate: ConstrainsViewUIDelegate?
    var navigationController: UINavigationController?
    
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
        label.text = "Las constraints lo que hacen es colocar y adaptar nuestros componentes de UI según distintos tamaños de pantalla. Por lo tanto si quieres meter cualquier vista, ésta debe tener unas reglas que marcaran su aspecto. \n \nExisten 9 tipos de referencias a los constrains, las cuales son: \n\nLeadingAnchor (referencia a la izquierda) \n\nTrailingAnchor (referencia a la derecha) \n\nTopAnchor (referencia a arriba) \n\nBottomAnchor (referencia a abajo) \n\nWidthAnchor (referencia a el ancho) \n\nHeightAnchor (referencia a la altura)\n \nCenterXAnchor (referencia al centro vertical) \n\nCenterYAnchor (referencia al centro horizontal) \n\nGuías en layout que son 3, layoutMarginsGuide: Guía que se usa con un pequeño margen en el top, bottom, leading y trailing de 8 puntos. \nreadableContentGuide: Guía que ajusta el width a un tamaño que facilite la lectura del usuario.\nsafeAreaLayoutGuide: Guía que representa la parte de la vista que no está tapada por barras u otros elementos."
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Para que sean aceptados sin dar problemas, se requieren saber en que punto del eje X y Y estaran, asi que por lo menos se requieren 3 posiciones, pueden ser 2 del eje X definiendo desde su punto hasta que referencia sera ubicado hacia arriba, asimismo otro punto definiendolo hacia abajo, y un tercer o punto que lo referencie en el eje Y. \n\nUn ejemplo basico es el siguiente:\nnombreDelComponente.topAnchor.constraint(equalTo: topAnchor), \n\nnombreDelComponente.leadingAnchor.constraint(equalTo: leadingAnchor),\n\nnombreDelComponente.trailingAnchor.constraint(equalTo: trailingAnchor),\n\n\nUbicarlo que quede centrado el componente con respecto al centro del dispositivo: \nnombreDelComponente.centerXAnchor.constraint(equalTo: centerXAnchor), \ny se le asigna un ancho: \nnombreDelComponente.widthAnchor.constraint(equalToConstant: 100),"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: ConstrainsViewUIDelegate){
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
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            self.infoLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.exampleLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            self.exampleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.exampleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.exampleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
        ])
    }
}
