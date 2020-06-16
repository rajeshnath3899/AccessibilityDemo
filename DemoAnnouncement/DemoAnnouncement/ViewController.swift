//
//  ViewController.swift
//  DemoAnnouncement
//
//  Created by rajeshnath on 6/15/20.
//  Copyright © 2020 rajeshnath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
       
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WebPage URL:"
        label.contentMode = .center
        label.numberOfLines = 0
        return label
    }()
    
    let webUrlTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "https://www.apple.com"
        textField.contentMode = .center
        return textField
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    
    let downloadButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Download", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(download), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(webUrlTextField)
        stackView.addArrangedSubview(activityIndicatorView)
        stackView.addArrangedSubview(downloadButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
    }
    
    @IBAction func download(_ sender: UIButton) {
        guard let url = URL(string: webUrlTextField.text ?? "") else {
            return
        }
        downloadWebPage(url)
    }

    private func downloadWebPage(_ url: URL) {
        activityIndicatorView.startAnimating()
        
        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
            if let localURL = localURL {
                let announcementText = NSLocalizedString("Web page downloaded", comment: "")

                if let string = try? String(contentsOf: localURL) {
                    print(string)
                    DispatchQueue.main.async {                    self.activityIndicatorView.stopAnimating()
                    }
                    UIAccessibility.post(notification: UIAccessibility.Notification.announcement, argument:  announcementText)
                }
            }
        }

        task.resume()
    }

}

