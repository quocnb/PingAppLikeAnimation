//
//  CGPointExtension.swift
//  PingLikelyAnimation
//
//  Created by Quoc Nguyen on 12/20/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

extension CGPoint {
    static func += (left: inout CGPoint, right: CGPoint) {
        left.x += right.x
        left.y += right.y
    }

    func vectorLength() -> CGFloat {
        return CGFloat(sqrt(Double(self.x * self.x + self.y * self.y)))
    }
}

