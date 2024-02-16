//
//  CheckinView.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import SwiftUI

struct CheckinView: View {
    @ObservedObject private var actionViewModel = CheckinViewModel()
    @ObservedObject private var networkingViewModel = NetworkingViewModel()
    
    @State private var selectedDate = Date()
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    private var checkinViewDelegate: CheckinViewDelegate
    
    init(delegate:  CheckinViewDelegate) {
        checkinViewDelegate = delegate
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Text("Employee Check-in")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                Text("Enter your check-in time")
                    .font(.headline)
                
                DatePicker("Enter your check-in time", selection: $selectedDate, in: ...Date(), displayedComponents: [.date, .hourAndMinute])
                    .labelsHidden()
                
                Spacer()
                
                
                Button(action: {
                    submitButtonAction()
                }) {
                    Text("Submit")
                        .font(.headline)
                        .frame(width: geometry.size.width - 70)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }

        .onAppear {
            if let fetchedDate = actionViewModel.fetchCheckinDateTime() {
                selectedDate = fetchedDate
            } else {
                networkingViewModel.fetchInitialDateTime { fetchedDate in
                    if let fetchedDate = fetchedDate {
                        selectedDate = fetchedDate
                    }
                }
            }
        }
    }
    
    func submitButtonAction() {
        actionViewModel.saveCheckinDateTime(selectedDate: selectedDate)
        checkinViewDelegate.dismissViewController()
    }
}
