//
//  MVVMViewController.swift
//  DesignPatternImpApp
//
//  Created by SMIT iMac27 on 11/03/20.
//  Copyright © 2020 SMIT iMac27. All rights reserved.
//

import UIKit

class MVVMViewController: UIViewController {
    @IBOutlet weak var newstable: UITableView!
   var newsVModel = [NewsViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
   getDataFromServices()
    }
    
    func getDataFromServices(){
        WebServices.shareInstance.getNewsDetails { (news, error) in
                  if error == nil {
                    self.newsVModel = news?.map({return NewsViewModel(news: $0)}) ?? []
                    DispatchQueue.main.async {
                        self.newstable.reloadData()
                    }}
                   }
    }}
extension MVVMViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return newsVModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTBVCell", for: indexPath) as! NewsTBVCell
        let newsDict = newsVModel[indexPath.row]
        cell.configurNewsList(newsJob: newsDict)
        return cell
    }
 }
