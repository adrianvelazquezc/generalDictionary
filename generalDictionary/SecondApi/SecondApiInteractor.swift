//
//  SecondApiInteractor.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation

class SecondApiInteractor{
    var presenter: SecondApiPresenterProtocol?
    internal var url: String?
}

extension SecondApiInteractor: SecondApiInteractorProtocol {
    func getPokemonInfo() {
        if let urlObject = URL(string: self.url ?? ""){
                var urlRequest = URLRequest(url: urlObject)
                urlRequest.httpMethod = "GET"
                
                let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                    if let response = responseData {
                        if let json = try? JSONDecoder().decode(PokemonDetailResponse.self, from: response){
                            self.presenter?.responsePokemonInfo(pokemon: json )
                        }
                    }
                }
                task.resume()
            }
    }
    
    
}
