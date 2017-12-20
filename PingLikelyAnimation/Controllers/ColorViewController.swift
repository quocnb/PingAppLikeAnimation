//
//  ColorViewController.swift
//  PingLikelyAnimation
//
//  Created by Quoc Nguyen on 12/20/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

@objc enum Color: Int {
    case white
    case black
    var blackgroundColor: UIColor {
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        }
    }
    var buttonColor: UIColor {
        switch self {
        case .white:
            return .black
        case .black:
            return .white
        }
    }
    var preferStatus: UIStatusBarStyle {
        switch self {
        case .white:
            return .default
        case .black:
            return .lightContent
        }
    }
}

class ColorViewController: UIViewController, CircleTransitionable {

    var color: Color! {
        didSet {
            reloadView()
        }
    }
    let triggerButton = UIButton()
    let contentLabel = UILabel()
    var mainView: UIView {
        return self.view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentLabel.backgroundColor = .clear
        self.contentLabel.numberOfLines = 0
        setupButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let buttonWidthHeight: CGFloat = 25.0
        let padding: CGFloat = 16.0
        let statusBarPadding: CGFloat = 20.0

        let constrainedSize = CGSize(width: view.bounds.width - 32.0 - buttonWidthHeight, height: view.bounds.height)
        let titleSize = contentLabel.sizeThatFits(constrainedSize)

        contentLabel.bounds = CGRect(x: 0, y: 0, width: titleSize.width, height: titleSize.height)
        contentLabel.center = CGPoint(x: 16 + contentLabel.bounds.width/2.0, y: 60 + contentLabel.bounds.height/2.0)

        triggerButton.layer.cornerRadius = buttonWidthHeight/2.0
        triggerButton.frame = CGRect(x: view.bounds.width - buttonWidthHeight - padding, y: padding + statusBarPadding, width: buttonWidthHeight, height: buttonWidthHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Setup
    func setupButton() {
        self.view.addSubview(self.contentLabel)
        self.view.addSubview(self.triggerButton)
        self.triggerButton.addTarget(self, action: #selector(didSelectColorButton), for: .touchUpInside)
    }

    func reloadView() {
        self.view.backgroundColor = self.color.blackgroundColor
        self.triggerButton.backgroundColor = self.color.buttonColor
        configureLabel()
    }

    func configureLabel() {
    }

    @IBAction func didSelectColorButton() {
    }
}
