//
//  UIView+ext.swift
//  FlipSwitchUI
//
//  Created by Patrick Costello on 4/11/21.
//

import Foundation
import UIKit

extension UIView {
    func maxConstraints(_ subView: UIView?) {
        //use: maxConstraints(subView)
        //use to snap new view constraints to self view
        guard let subView = subView else {
            return
        }
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        subView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        subView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        subView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
