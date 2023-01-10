//
//  HomeViewUI.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

protocol HomeViewUIDelegate {
    func gotoView(view: List)
}

class List {
    var title: String
    var viewController: UIViewController
    
    init(title: String, viewController: UIViewController) {
        self.title = title
        self.viewController = viewController
    }
}
class HomeViewUI: UIView{
    var delegate: HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    var elementList: [List] = []
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainListTableViewCell.self, forCellReuseIdentifier: MainListTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: HomeViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            addElements()
            setUI()
            setConstraints()
        }
    private func addElements(){
        //lista de los elementos
        elementList.append(List(title: "¿Como configurar el appDelegate?", viewController: AppDelegateMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "Definir appDelegate")))
        elementList.append(List(title: "¿Que es un control? y ¿Como definirlos?", viewController: ControllersMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "Controles")))
        elementList.append(List(title: "¿Como posicionar los elementos en la vista?", viewController: ConstrainsMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "Constrains")))
        elementList.append(List(title: "¿Como hacer que la pantalla cresca si no cabe en la pantalla?", viewController: ScrollMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "ScrollView")))
        elementList.append(List(title: "Controles interactivos", viewController: InteractiveControlsMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "Controles interactivos")))
        elementList.append(List(title: "¿Que son los protocolos y delegados? y ¿Para que sirven?", viewController: ProtocolsMain.createModule(navigation: (self.navigationController ?? UINavigationController()),vcTitle: "Protocolos y delegados" )))
        elementList.append(List(title: "¿Como cambiar el tamaño, color y estilo de un texto?", viewController: AttributesMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "Atributos")))
        elementList.append(List(title: "¿Como enlistar tablas?", viewController: TablesMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "Tablas")))
        elementList.append(List(title: "¿Que otras tablas hay?", viewController: CollectionsMain.createModule(navigation: (self.navigationController ?? UINavigationController()), vcTitle: "CollectionViews")))
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.backgroundColor = .white
        self.addSubview(tableView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
extension HomeViewUI: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainListTableViewCell", for: indexPath) as! MainListTableViewCell
        cell.titleLabel.text = "\(elementList[indexPath.row].title)"
        return cell
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // deslizar izquierda a derecha para abrir las opciones de swipe
        let openSlide = UIContextualAction(style: .normal,
                                           title: "Abrir") { [weak self] (action, view, completionHandler) in
            self?.openViewController(index: indexPath.row)
            completionHandler(true)
        }
        openSlide.backgroundColor = .systemGreen
        
        // Cerrar action
        let closeSlide = UIContextualAction(style: .destructive,
                                            title: "Cerrar") { [weak self] (action, view, completionHandler) in
            self?.closeSlide()
            completionHandler(true)
        }
        closeSlide.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [closeSlide, openSlide])
        return configuration
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // deslizar derecha a izquierda para abrir las opciones de swipe
        let openSlide = UIContextualAction(style: .normal,
                                           title: "Abrir") { [weak self] (action, view, completionHandler) in
            self?.openViewController(index: indexPath.row)
            completionHandler(true)
        }
        openSlide.backgroundColor = .systemGreen
        
        // Trash action
        let closeSlide = UIContextualAction(style: .destructive,
                                            title: "Cerrar") { [weak self] (action, view, completionHandler) in
            self?.closeSlide()
            completionHandler(true)
        }
        closeSlide.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [closeSlide, openSlide])
        return configuration
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate?.gotoView(view: self.elementList[indexPath.row])
    }
    
    //tanleview delegate
    private func openViewController(index: Int) {
        print(index)
        self.delegate?.gotoView(view: self.elementList[index])
    }
    
    private func closeSlide() {
        print("cerrado")
    }
    
}

