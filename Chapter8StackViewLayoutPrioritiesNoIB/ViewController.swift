//
//  ViewController.swift
//  Chapter8StackViewLayoutPrioritiesNoIB
//
//  Created by Herve Desrosiers on 2020-03-10.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum ProfileMetrics {
        static let margin: CGFloat = 20
        static let nameFontSize: CGFloat = 18
        static let bioFontSize: CGFloat = 17
    }
    
    var profile: Profile? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureView()
    }
    
    private func setupView() {
        view.addSubview(profileStackView)
        let margin = view.layoutMarginsGuide
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: ProfileMetrics.margin, leading: ProfileMetrics.margin, bottom: ProfileMetrics.margin, trailing: ProfileMetrics.margin)
        NSLayoutConstraint.activate([
            profileStackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            profileStackView.topAnchor.constraint(equalTo: margin.topAnchor),
            profileStackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        ])
    }
    
    private func configureView() {
        if let image = profile?.avatar {
            profileImageView.image = image
        } else {
            profileImageView.image = UIImage(named: "placeholder")
        }

        title = profile?.name
        nameLabel.text = profile?.name
        bioLabel.text = profile?.bio
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .top
        // increase horizontal content hugging priority (default is 250)
        // both labels will spread horizontally before the image
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
//        imageView.backgroundColor = .orange
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: ProfileMetrics.nameFontSize, weight: .bold)
        label.numberOfLines = 0
        // increase vertical content hugging priority (default is 250)
        // the bio label will spread vertically
        label.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
//        label.backgroundColor = .purple
        return label
    }()
    
    private let bioLabel: UILabel = { // using default content hugging priority (250)
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ProfileMetrics.bioFontSize)
        label.numberOfLines = 0
//        label.backgroundColor = .blue
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        return stackView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, labelStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = UIStackView.spacingUseSystem
        return stackView
    }()

}

