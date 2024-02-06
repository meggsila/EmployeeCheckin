//
//  Extensions.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import Foundation

extension Date {
    func toString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate(format: String = "yyyy-MM-dd HH:mm") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
