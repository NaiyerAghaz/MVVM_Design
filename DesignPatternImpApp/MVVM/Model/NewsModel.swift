//
//  NewsModel.swift
//  DesignPatternImpApp
//
//  Created by SMIT iMac27 on 11/03/20.
//  Copyright © 2020 SMIT iMac27. All rights reserved.
//

import UIKit

class NewsModel: Codable {
    var name: String?
    var description: String?
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}
class SourceModel: Decodable{
    var sources = [NewsModel]()
    init(sources:[NewsModel]) {
        self.sources = sources
    }
}
