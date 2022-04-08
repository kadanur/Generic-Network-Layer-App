//
//  HomeVC.swift
//  Generic Network Layer App
//
//  Created by M Kaan Adanur on 8.04.2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeVC loaded.")
        fetchCryptos()
    }
    
    func fetchRaM() {
        WebService().fetchData(model: RaMCharactersMain.self, url: "https://rickandmortyapi.com/api/character/") { result in
            switch result {
            case .httpFail(.unknown):
                print("error")
            case let .httpSuccess(RaMCharactersMain):
                print("success")
                print(RaMCharactersMain)
            case .httpFail(.noData):
                print("error2")
            }
        }
    }
    
    func fetchNews() {
        WebService().fetchData(model: NewsModelMain.self, url: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=17b2211c1a9b4c9aac76951ee93636d8") { result in
            switch result {
                case .httpFail(.unknown):
                    print("error")
                case let .httpSuccess(NewsModelMain):
                    print("success")
                    print(NewsModelMain)
                case .httpFail(.noData):
                    print("error2")
            }
        }
    }
    
    func fetchCryptos() {
        WebService().fetchData(model: [CryptoCurrency].self, url: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") { result in
            switch result {
            case .httpFail(.unknown):
                print("error")
            case let .httpSuccess(CryptoCurrency):
                print("success")
                print(CryptoCurrency)
            case .httpFail(.noData):
                print("error2")
            }
        }
    }
    
}
