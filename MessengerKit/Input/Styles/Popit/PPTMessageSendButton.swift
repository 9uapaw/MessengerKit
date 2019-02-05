//
//  CustomMessageSendButton.swift
//  MessengerKit
//
//  Created by Stephen Radford on 12/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class PPTMessageSendButton: UIButton {

    let overlay = CALayer()
    
    override open var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.alpha = self.isEnabled ? 1 : 0.3
            }
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            overlay.isHidden = !isHighlighted
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        overlay.frame = layer.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = bounds.width / 2
        layer.masksToBounds = true
        
        overlay.backgroundColor = UIColor.black.cgColor
        overlay.opacity = 0.3
        overlay.isHidden = true
        overlay.frame = layer.bounds
        
        layer.addSublayer(overlay)
    }

}
