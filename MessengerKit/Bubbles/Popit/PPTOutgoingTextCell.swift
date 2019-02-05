//
//  CustomOutgoingTextCell.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

import SDWebImage

open class PPTTextCell: MSGMessageCell {

    @IBOutlet weak var bubble: PPTBubble!
    
    @IBOutlet weak var bubbleWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var avatarView: UIImageView?
    
    var avatarGestureRecognizer: UITapGestureRecognizer!
    
    override open var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.text(body) = message.body else { return }
            
            bubble.text = body
            bubble.backgroundColor = message.user.isSender ? UIColor(rgb: PPTColors.outgoingBubbleBGColor) : UIColor(rgb: PPTColors.tabBarColor)
            bubble.textAlignment = .left
            
            if let user = message.user as? ChatUser {
                avatarView?.sd_setImage(with: user.avatarUrl, completed: nil)
            }
        }
    }
    
    override open var style: MSGMessengerStyle? {
        didSet {
            guard let style = style as? PPTStyle, let message = message else { return }
//            bubble.layer.borderColor = message.user.isSender ? style.outgoingBorderColor.cgColor : style.incomingBorderColor.cgColor
            bubble.linkTextAttributes[NSAttributedStringKey.underlineColor.rawValue] = style.outgoingLinkColor
            bubble.linkTextAttributes[NSAttributedStringKey.foregroundColor.rawValue] = style.outgoingLinkColor
            bubble.font = style.font
            bubble.textColor = message.user.isSender ? style.outgoingTextColor : style.incomingTextColor
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        let bubbleSize = bubble.calculatedSize(in: bounds.size)
        bubbleWidthConstraint.constant = bubbleSize.width < 150 ? 150 : bubbleSize.width
    }
    
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        avatarView?.layer.cornerRadius = 24
        avatarView?.layer.masksToBounds = true
        
        avatarGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatarView?.addGestureRecognizer(avatarGestureRecognizer)
        avatarView?.isUserInteractionEnabled = true
    }
    
    @objc func avatarTapped(_ sender: UITapGestureRecognizer) {
        guard let user = message?.user else { return }
        delegate?.cellAvatarTapped(for: user)
    }
 
}
