//
//  RickAndMortyModel.swift
//  Generic Network Layer App
//
//  Created by M Kaan Adanur on 8.04.2022.
//

import Foundation

struct RaMCharactersMain: Codable {
    var results: [RaMCharactersResult]
}

struct RaMCharactersResult: Codable {
    var id: Int
    var name: String
}


