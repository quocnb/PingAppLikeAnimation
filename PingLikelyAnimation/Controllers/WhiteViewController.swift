//
//  WhiteViewController.swift
//  PingLikelyAnimation
//
//  Created by Quoc Nguyen on 12/20/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

class WhiteViewController: ColorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.color = Color.white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillLayoutSubviews() {
        let buttonWidthHeight: CGFloat = 25.0
        let constrainedSize = CGSize(width: view.bounds.width - 32.0 - buttonWidthHeight, height: view.bounds.height)
        let titleSize = contentLabel.sizeThatFits(constrainedSize)

        contentLabel.bounds = CGRect(x: 0, y: 0, width: titleSize.width, height: titleSize.height)

        contentLabel.center = CGPoint(x: 16 + contentLabel.bounds.width/2.0, y: 60 + contentLabel.bounds.height/2.0)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func configureLabel() {
        let titleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black,
                               NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18.0)]
        let storyAttributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray,
                               NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0)]

        let mutableAttrString = NSMutableAttributedString(string: "Beep boop, you've unlocked a new\n something or other that I call \"Tech Talk\"\n\n", attributes:titleAttributes)
        mutableAttrString.append(NSAttributedString(string: "Hi, I'm Pong. Tap the black dot,\n choose stuff you care about and close\n me when you're done. You're going to\n like me.\n\nTouch me.", attributes:storyAttributes))

        contentLabel.attributedText = mutableAttrString
    }

    override func didSelectColorButton() {
        let blackVC = BlackViewController()
        self.navigationController?.pushViewController(blackVC, animated: true)
    }

}
