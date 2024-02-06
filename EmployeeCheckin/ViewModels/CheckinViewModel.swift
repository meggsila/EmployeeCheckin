//
//  CheckinViewModel.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import Foundation

class CheckinViewModel: ObservableObject {    
    func fetchCheckinDateTime() -> Date {
        if let checkinDateTime = DataManager.shared.fetchCheckinDateTime() {
            return checkinDateTime.toDate() ?? Date()
        } else {
            return Date()
        }
    }
    
    func isSavedSuccessfully(selectedDate: Date,_ completition: @escaping ((Bool) -> Void)) {
        DataManager.shared.saveCheckinDateTime(checkinDateTime: selectedDate.toString()) { success in
            completition(success)
        }
    }
}
