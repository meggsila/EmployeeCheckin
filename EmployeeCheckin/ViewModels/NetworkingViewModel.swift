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
            let initialDateTime = Calendar.current.date(bySettingHour: 6, minute: 30, second: 0, of: Date()) ?? Date()
            completion(initialDateTime)
        }
    }
}

//struct RealAPIClient: APIClient {
//    func fetchInitialCheckinTime(completion: @escaping (Date?) -> Void) {
//        guard let url = URL(string: "https://mock/api/check_in_date_time") else {
//            completion(nil)
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(nil)
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .formatted(DateFormatter.customDateTimeFormat)
//                let dateTimeResponse = try decoder.decode(DateTimeResponse.self, from: data)
//                completion(dateTimeResponse.dateTime)
//            } catch {
//                print("Error \(error)")
//                completion(nil)
//            }
//        }.resume()
//    }
//}
//
//struct DateTimeResponse: Codable {
//    let dateTime: Date
//}
//
//extension DateFormatter {
//    static let customDateTimeFormat: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm"
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.calendar = Calendar(identifier: .iso8601)
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        return formatter
//    }()
//}
