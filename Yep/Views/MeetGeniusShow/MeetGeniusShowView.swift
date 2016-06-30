//
//  MeetGeniusShowView.swift
//  Yep
//
//  Created by NIX on 16/6/29.
//  Copyright © 2016年 Catch Inc. All rights reserved.
//

import UIKit

class MeetGeniusShowView: UIView {

    var tapAction: (() -> Void)?

    lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.blueColor()
        view.userInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(MeetGeniusShowView.didTap(_:)))
        view.addGestureRecognizer(tap)

        return view
    }()

    lazy var showButton: UIButton = {
        let button = UIButton()
        button.setTitle("SHOW", forState: .Normal)
        button.backgroundColor = UIColor.blueColor()
        return button
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeUI() {

        do {
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(backgroundImageView)

            let views = [
                "backgroundImageView": backgroundImageView,
            ]

            let constraintsH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[backgroundImageView]|", options: [], metrics: nil, views: views)
            let constraintsV = NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImageView]|", options: [], metrics: nil, views: views)
            NSLayoutConstraint.activateConstraints(constraintsH)
            NSLayoutConstraint.activateConstraints(constraintsV)
        }

        /*
        do {
            showButton.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            let stackView = UIStackView()
            stackView.axis = .Vertical
            stackView.spacing = 12

            stackView.addArrangedSubview(showButton)
            stackView.addArrangedSubview(titleLabel)

            stackView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(stackView)

            let centerX = stackView.centerXAnchor.constraintEqualToAnchor(centerXAnchor)
            let centerY = stackView.centerYAnchor.constraintEqualToAnchor(centerYAnchor)
            NSLayoutConstraint.activateConstraints([centerX, centerY])
        }
         */
    }

    @objc private func didTap(sender: UITapGestureRecognizer) {
        println("tap MeetGeniusShowView")

        tapAction?()
    }
}
