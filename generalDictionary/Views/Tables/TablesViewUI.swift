//
//  TablesViewUI.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

protocol TablesViewUIDelegate {
    
}

class TablesViewUI: UIView{
    var delegate: TablesViewUIDelegate?
    var navigationController: UINavigationController?
    
    var elementList: [String] = ["Elemento1", "Elemento2", "Elemento3"]
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(exampleTableViewCell.self, forCellReuseIdentifier: exampleTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Hace referencia a una vista que representa unos datos por medio del uso de filas, las cuales se encuentran ubicadas en una sola columna. \n\nvar elementList: [String] = [”Elemento1”, ”Elemento2”, ”Elemento3”] \n\nSe declara de la siguiente manera: \n\npublic lazy var nombreDeLaTabla: UITableView = { \nlet tableView = UITableView() \ntableView.register(exampleTableViewCell.self, forCellReuseIdentifier: exampleTableViewCell.identifier) \ntableView.translatesAutoresizingMaskIntoConstraints = false \ntableView.delegate = self \ntableView.dataSource = self \ntableView.backgroundColor = .white \nreturn tableView \n}()"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: TablesViewUIDelegate){
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
        self.addSubview(infoLabel)
        self.addSubview(tableView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
                tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
                tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
extension TablesViewUI: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exampleTableViewCell", for: indexPath) as! exampleTableViewCell
        cell.titleLabel.text = elementList[indexPath.row]
        return cell
    }
    
    
}
