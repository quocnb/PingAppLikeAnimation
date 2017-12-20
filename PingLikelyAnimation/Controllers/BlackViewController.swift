//
//  BlackViewController.swift
//  PingLikelyAnimation
//
//  Created by Quoc Nguyen on 12/20/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

class BlackViewController: ColorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.color = .black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func configureLabel() {
        let titleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                               NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)]
        let string = """
                        Apps worth downloading\n\n
                        Best of Hacker News\n\n
                        Curiosities\n\n
                        Daily Fortune Cookies\n\n
                        Fitspiration\n\n
                        Is it Friday yet?\n\n
                        Movies worth mocking\n\n
                    """
        let mutableAttrString = NSMutableAttributedString(string: string, attributes:titleAttributes)

        contentLabel.attributedText = mutableAttrString
    }

    override func didSelectColorButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
