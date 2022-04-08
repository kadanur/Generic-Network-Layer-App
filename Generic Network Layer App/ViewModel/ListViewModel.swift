//
//  ListViewModel.swift
//  Generic Network Layer App
//
//  Created by M Kaan Adanur on 8.04.2022.
//

import Foundation

struct ListViewModel {
    var ramList = [RaMCharactersResult]()
    var newsList: [NewsModel]?
    var cryptoList: [CryptoCurrency]?
    
    func countOfObjects() -> Int {
        return self.ramList.count
    }
}


