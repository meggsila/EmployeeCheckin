//
//  ApiViewModel.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import Foundation

class NetworkingViewModel: ObservableObject {
    @Published var initialDateTime = Calendar.current.date(bySettingHour: 6, minute: 30, second: 0, of: Date()) ?? Date()
    private let apiClient: APIClient
    
    init(apiClient: APIClient = MockAPIClient()) {
        self.apiClient = apiClient
    }

    func fetchInitialDateTime(completion: @escaping (Date?) -> Void) {
        apiClient.fetchInitialCheckinTime { initialDateTime in
            completion(initialDateTime)
        }
    }
}

protocol APIClient {
    func fetchInitialCheckinTime(completion: @escaping (Date?) -> Void)
}

struct MockAPIClient: APIClient {
    func fetchInitialCheckinTime(completion: @escaping (Date?) -> Void) {
        guard let url = URL(string: "https://mock/api/check_in_date_time") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let initialDateTime = Calendar.current.date(bySettingHour: 6, minute: 30, second: 0, of: Date())
            completion(initialDateTime)
        }
    }
}
