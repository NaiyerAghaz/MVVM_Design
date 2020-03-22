//
//  NewsViewModel.swift
//  DesignPatternImpApp
//
//  Created by SMIT iMac27 on 11/03/20.
//  Copyright © 2020 SMIT iMac27. All rights reserved.
//

import UIKit

class NewsViewModel: NSObject {
    
    var name: String?
    var descriptions: String?
    init(news:NewsModel) {
        self.name = news.name
        self.descriptions = news.description
    }
}
