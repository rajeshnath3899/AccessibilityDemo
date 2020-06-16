//
//  ViewController.swift
//  DynamicFontDemo
//
//  Created by rajeshnath on 6/14/20.
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
           return stack
       }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A large title with standard font"
        label.contentMode = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A Sub headline with custom font"
        label.contentMode = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyCustomFont(for: subtitleLabel)
    }
    
    private func setup() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        ])
    }
    
    private func applyCustomFont(for label: UILabel) {
        guard let customFont = UIFont(name: "Avenir-Light", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "Avenir-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
    }

}

