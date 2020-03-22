//
//  WebServices.swift
//  DesignPatternImpApp
//
//  Created by SMIT iMac27 on 11/03/20.
//  Copyright © 2020 SMIT iMac27. All rights reserved.
//

import Foundation
class WebServices: NSObject{
    static let shareInstance = WebServices()
    func getNewsDetails(completion:@escaping([NewsModel]?, Error?) -> ()){
        let urlString = "https://newsapi.org/v2/sources?apiKey=0cf790498275413a9247f8b94b3843fd"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            }
            guard let data = data else {return}
            do {
                var newsDetails = [NewsModel]()
                let services = try JSONDecoder().decode(SourceModel.self, from: data)
               
                for news in services.sources {
                    newsDetails.append(news)
                }
                
                completion(newsDetails, nil)
            }
               
            catch let error {
                print(error.localizedDescription)
            }
        }
    .resume()
        
    }
}
