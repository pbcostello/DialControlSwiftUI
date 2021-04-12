//
//  CGFloat+ext.swift
//  DialControlSwift
//
//  Created by Patrick Costello on 10/14/16.
//  Copyright © 2016 Patrick Costello. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    var degreesString: String {
        return String(format: "%.2f°", self.degrees)
    }
    
    var degrees: CGFloat {
        return self * (180.0 / .pi)
    }
}
