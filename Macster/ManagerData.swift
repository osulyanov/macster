//
//  ManagerData.swift
//  Macster
//
//  Created by Oleg Sulyanov on 10/07/2017.
//  Copyright © 2017 Oleg Sulyanov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class ManagerData {
    func loadArticles(refreshlist: @escaping () -> Void) {
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
                        realm.add(article, update: true)
                    }
                }
            case .failure(let error):
                print(error)
            }
         
            refreshlist()
//            ViewController.refreshListFromDB()
        }
    }
    
    func getArticle(articleID: Int) -> ArticleData {
        let realm = try! Realm()
        let article = realm.objects(ArticleData.self).filter("id == %@", articleID).first
//        let article = realm.object(ofType: ArticleData.self, forPrimaryKey: Int(articleID))
        return article!
    }
}

