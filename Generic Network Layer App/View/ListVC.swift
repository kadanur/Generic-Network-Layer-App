//
//  ListVC.swift
//  Generic Network Layer App
//
//  Created by M Kaan Adanur on 8.04.2022.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    
    var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCryptoData()
    }
    
    func fetchCryptoData() {
        WebService().fetchData(model: [CryptoCurrency].self, url: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") { result in
            switch result {
            case .httpFail(.unknown):
                print("error")
            case let .httpSuccess(CryptoCurrency):
                for i in CryptoCurrency {
                    self.viewModel.cryptoList.append(i)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .httpFail(.noData):
                print("error2")
            }

        }
    }
    
    func fetchNewsData() {
        WebService().fetchData(model: NewsModelMain.self, url: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=17b2211c1a9b4c9aac76951ee93636d8") { result in
            switch result {
            case .httpFail(.unknown):
                print("error")
            case let .httpSuccess(NewsModelMain):
                for i in NewsModelMain.articles {
                    let item = NewsModel.init(title: i.title)
                    self.viewModel.newsList.append(item)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .httpFail(.noData):
                print("error2")
            }
        }
    }
    
    func fetchRaMData() {
        WebService().fetchData(model: RaMCharactersMain.self, url: "https://rickandmortyapi.com/api/character/") { result in
            switch result {
            case .httpFail(.unknown):
                print("error")
            case let .httpSuccess(RaMCharactersMain):
                for i in RaMCharactersMain.results {
                    let item = RaMCharactersResult.init(id: i.id , name: i.name)
                    self.viewModel.ramList.append(item)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .httpFail(.noData):
                print("error2")
            }
        }
    }
}

extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.countOfObjects()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = viewModel.cryptoList[indexPath.row].currency
        return cell
    }
}
