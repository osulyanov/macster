//
//  JSON.swift
//  Macster
//
//  Created by Oleg Sulyanov on 05/07/2017.
//  Copyright © 2017 Oleg Sulyanov. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    public var dateValue: NSDate? {
        get {
            if let str = self.string {
                return JSON.jsonDateFormatter.date(from: str) as NSDate?
            }
            return nil
        }
    }
    
    private static let jsonDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZZ"
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        return dateFormatter
    }()
}
