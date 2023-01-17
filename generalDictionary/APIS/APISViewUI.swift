//
//  APISViewUI.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation
import UIKit

protocol APISViewUIDelegate {
    func notifyNextView(url: String)
}

class APISViewUI: UIView{
    var delegate: APISViewUIDelegate?
    var navigationController: UINavigationController?
    var pokedexInfo : [PokemonResult] = [PokemonResult]()
    
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
        delegate: APISViewUIDelegate){
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
extension APISViewUI: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedexInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MainListTableViewCell", for: indexPath) as? MainListTableViewCell{
            cell.titleLabel.text = pokedexInfo[indexPath.row].name
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.notifyNextView(url: pokedexInfo[indexPath.row].url ?? "")
    }
}
