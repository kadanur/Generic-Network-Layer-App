//
//  NewsModel.swift
//  Generic Network Layer App
//
//  Created by M Kaan Adanur on 8.04.2022.
//

import Foundation

struct NewsModelMain: Codable {
    let articles: [NewsModel]
}

struct NewsModel: Codable {
    let title: String?
}
