//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 21/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import Foundation

extension Date {
    // take a Date object and give back the string at the format we want
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
