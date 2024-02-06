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
            if UserDefaults.standard.bool(forKey: "isAppAlreadyLaunchedOnce") {
                selectedDate = actionViewModel.fetchCheckinDateTime()
            } else {
                UserDefaults.standard.setValue(true, forKey: "isAppAlreadyLaunchedOnce")
                networkingViewModel.fetchInitialDateTime { fetchedDate in
                    if let fetchedDate = fetchedDate {
                        selectedDate = fetchedDate
                    }
                }
            }
        }
    }
    
    func submitButtonAction() {
        showAlert = true
        actionViewModel.isSavedSuccessfully(selectedDate: selectedDate) { success in
            if success {
                alertTitle = "Success"
                alertMessage = "Your check-in time: \(selectedDate.toString()) has been saved successfully."
            } else {
                alertTitle = "Error"
                alertMessage = "Unfortunately, your check-in time was not saved. An error occurred during the process."
            }
        }
    }
}
