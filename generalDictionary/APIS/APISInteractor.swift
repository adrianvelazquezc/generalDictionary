//
//  APISInteractor.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation

class APISInteractor{
    var presenter: APISPresenterProtocol?
}

extension APISInteractor: APISInteractorProtocol {
    func getListPokemon() {
        let urlString = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=150"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                if let response = responseData {
                    if let json = try? JSONDecoder().decode(PokemonListResponse.self, from: response){
//                        completionHandler(json,200,"")
                        self.presenter?.responseListPokemon(pokemon: json.results ?? [PokemonResult]())
                    }
                }
            }
            task.resume()
        }
    }
}
