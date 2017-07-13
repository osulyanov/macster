//
//  ViewController.swift
//  Macster
//
//  Created by Oleg Sulyanov on 05/07/2017.
//  Copyright © 2017 Oleg Sulyanov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class ViewController: UITableViewController {
    
    var articles: Results<ArticleData>?
    let manager:ManagerData = ManagerData()
    
    func loadData(sender: AnyObject) {
        manager.loadArticles(refreshlist: {
            self.refreshData()
        })
    }
    
    func refreshData() {
        let realm = try! Realm()
        articles = realm.objects(ArticleData.self).sorted(by: ["publishAt"])
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Realm File: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        
        // Add Pull to refresh
        self.refreshControl?.addTarget(self, action: #selector(self.loadData), for: UIControlEvents.valueChanged)
        
        // Load data from server
        self.loadData(sender: self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles != nil ? articles!.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let article = articles![indexPath.row]
        cell.textLabel?.text = article.title
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! ArticleViewController
                let article = articles![indexPath.row]
                destinationVC.articleID = article.id
            }
        }
    }
}
