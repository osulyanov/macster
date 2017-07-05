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

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Realm File: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        let realm = try! Realm()
        
        let url = "http://macster.ru/api/v1/articles.json"
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let articles = JSON(value)
                
                for (_, rawArticle) in articles {
                    let article = ArticleData()
                    article.assignFromJSON(data: rawArticle)

                    try! realm.write {
                        realm.add(article)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
