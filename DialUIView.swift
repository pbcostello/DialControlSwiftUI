//
//  DialUIView.swift
//  DialControlSwiftUI
//
//  Created by Patrick Costello on 4/12/21.
//

import Foundation
import SwiftUI

@objc protocol DialUIViewProtocol {
    func dialUIViewMoved(_ dialUIView: DialUIView)
}

class DialUIView : UIView {
    var rotation: CGFloat = 0 //(radians)
    var background: UIImageView?
    weak var delegate: DialUIViewProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ frame: CGRect, backgroundName: String?) {
        super.init(frame: frame)
        background = addBackgroundSubview(backgroundName)
    }
    
    func addBackgroundSubview(_ backgroundName: String?) -> UIImageView? {
        guard let backgroundName = backgroundName else {
            return nil
        }
        let background: UIImageView = UIImageView(image: UIImage(named: backgroundName))
        self.addSubview(background)
        maxConstraints(background)
        return background
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        rotation -= frame.size.half.CGPoint.moveAngle(point: touches.first!.location(in: self), previousPoint: touches.first!.previousLocation(in: self))
        background?.transform = CGAffineTransform (rotationAngle: CGFloat(rotation))
        (delegate)?.dialUIViewMoved(self)
    }
}
