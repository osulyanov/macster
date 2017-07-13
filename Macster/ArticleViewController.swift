//
//  ArticleCollectionViewController.swift
//  Macster
//
//  Created by Oleg Sulyanov on 10/07/2017.
//  Copyright © 2017 Oleg Sulyanov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ArticleViewController: UIViewController {
    
    var articleID = 0
    let manager:ManagerData = ManagerData()

    @IBOutlet weak var articleTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the 
        let article = manager.getArticle(articleID: articleID)
        articleTitle.text = article.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}
