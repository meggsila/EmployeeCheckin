//
//  CheckinViewModel.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import Combine

@objc class CheckinViewModel: NSObject, ObservableObject {
    @objc static let shared = CheckinViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    @objc func fetchCheckinDateTime() -> Date? {
        if let checkinDateTime = DataManager.shared.fetchCheckinDateTime() {
            return checkinDateTime.toDate()
        }
        return nil
    }
    
    func saveCheckinDateTime(selectedDate: Date) {
        DataManager.shared.saveCheckinDateTime(checkinDateTime: selectedDate.toString())
    }
}
