//
//  String+Ext.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 21/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-DD'T'HH:mm:ssZ"
        dateFormatter.locale        = Locale(identifier: "fr_FR")
        dateFormatter.timeZone      = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        
        return date.convertToMonthYearFormat()
    }
}
