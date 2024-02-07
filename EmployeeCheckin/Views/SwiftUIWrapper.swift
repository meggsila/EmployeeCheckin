//
//  SwiftUIWrapper.swift
//  EmployeeCheckin
//
//  Created by Megi on 7.2.24.
//

import SwiftUI
import UIKit

class SwiftUIWrapper: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftUIView = CheckinView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingController.didMove(toParent: self)
    }
}

