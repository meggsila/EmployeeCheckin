//
//  MainVC.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import UIKit
import SwiftUI

class MainVC: UIViewController {
    private var hostingController: UIHostingController<CheckinView>?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Employee Check-in"
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(titleLabel)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            startButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc
    func startButtonAction() {
        let swiftUIView = CheckinView()
        
        hostingController = UIHostingController(rootView: swiftUIView)
        
        if let hostingController = hostingController {
            present(hostingController, animated: true, completion: nil)
        }
    }
}

