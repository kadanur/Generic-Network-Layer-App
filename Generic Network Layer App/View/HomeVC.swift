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
        title = "Home"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forRickAndMorty" {
            ListViewController.listType = ListTypes.RickAndMorty.rawValue
        }
        
        if segue.identifier == "forNews" {
            ListViewController.listType = ListTypes.News.rawValue
        }
        
        if segue.identifier == "forCrypto" {
            ListViewController.listType = ListTypes.Crypto.rawValue
        }
    }
}
