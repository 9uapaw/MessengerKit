//
//  CustomIncomingTextCell.swift
//  popit-ios
//
//  Created by Balazs Czirjak on 2019. 02. 03..
//  Copyright © 2019. Popit App Ltd. All rights reserved.
//

import Foundation

import SDWebImage

open class PPT2TextCell: MSGMessageCell {
    
    @IBOutlet weak var bubble: PPTBubble!
    
    @IBOutlet weak var bubbleWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var avatarView: UIImageView?
    
    var avatarGestureRecognizer: UITapGestureRecognizer!
    
    override open var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.text(body) = message.body else { return }
            
            bubble.text = body
            bubble.backgroundColor = message.user.isSender ? .white : UIColor(rgb: PPTColors.tabBarColor)
            
            if let user = message.user as? PPTChatUser {
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
        bubbleWidthConstraint.constant = bubbleSize.width
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
