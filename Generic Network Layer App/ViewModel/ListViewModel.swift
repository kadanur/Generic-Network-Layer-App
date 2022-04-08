//
//  ListViewModel.swift
//  Generic Network Layer App
//
//  Created by M Kaan Adanur on 8.04.2022.
//

import Foundation

enum ListTypes: String {
    case RickAndMorty = "rickAndMorty"
    case Crypto = "crypto"
    case News = "news"
}

struct ListViewModel {
    var ramList = [RaMCharactersResult]()
    var newsList = [NewsModel]()
    var cryptoList = [CryptoCurrency]()
    
    func countOfObjects() -> Int {
        var count: Int = 0
        if ListViewController.listType == ListTypes.Crypto.rawValue {
            count = self.cryptoList.count
        } else if ListViewController.listType == ListTypes.News.rawValue {
            count = self.newsList.count
        } else if ListViewController.listType == ListTypes.RickAndMorty.rawValue {
            count = self.ramList.count
        }
        return count
    }
}


