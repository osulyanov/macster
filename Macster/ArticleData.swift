//
//  ArticleData.swift
//  Macster
//
//  Created by Oleg Sulyanov on 05/07/2017.
//  Copyright © 2017 Oleg Sulyanov. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ArticleData: Object {
    dynamic var id = 0
    dynamic var keyword = ""
    dynamic var title = ""
    dynamic var pubType = ""
    dynamic var likesCount = 0
    dynamic var commentsCount = 0
    dynamic var publishAt = NSDate(timeIntervalSince1970: 1)
    dynamic var icon: String? = nil
    dynamic var announcementInside: String? = nil
    dynamic var image: String? = nil
    dynamic var text: String? = nil
    
    dynamic var productName: String? = nil
    dynamic var productValue: String? = nil
    dynamic var productLimitations: String? = nil
    dynamic var productAppstore: String? = nil
    dynamic var productFree: String? = nil
    dynamic var productPrice: String? = nil
    dynamic var productPrice_text: String? = nil
    dynamic var productCurrency_name: String? = nil
    dynamic var productDeveloper: String? = nil
    dynamic var productSite: String? = nil
    dynamic var productCompability: String? = nil
    
    dynamic var sponsorLink: String? = nil
    dynamic var sponsorLogo: String? = nil
    dynamic var sponsorText: String? = nil
    
    let similar = List<ArticleData>()
    let authors = List<AuthorData>()
    let tags = List<TagData>()
    let people = List<PersonalityData>()
    let sources = List<SourceData>()
    
    func assignFromJSON(data: JSON) -> Void {
        id = data["id"].intValue
        keyword = data["keyword"].stringValue
        title = data["title"].stringValue
        pubType = data["pub_type"].stringValue
        publishAt = data["publish_at"].dateValue!
        likesCount = data["likes_count"].intValue
        commentsCount = data["comments_count"].intValue
    }
}
