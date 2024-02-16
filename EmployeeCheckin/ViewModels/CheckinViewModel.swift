//
//  CheckinViewModel.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import Foundation

class CheckinViewModel: ObservableObject {
    func fetchCheckinDateTime() -> Date? {
        if let checkinDateTime = DataManager.shared.fetchCheckinDateTime() {
            return checkinDateTime.toDate()
        }
        return nil
    }
    
    func saveCheckinDateTime(selectedDate: Date) {
        DataManager.shared.saveCheckinDateTime(checkinDateTime: selectedDate.toString())
    }
}
