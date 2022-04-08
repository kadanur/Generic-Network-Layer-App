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
        fetchRaMData()
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
        cell.textLabel?.text = viewModel.ramList[indexPath.row].name
        return cell
    }
}
