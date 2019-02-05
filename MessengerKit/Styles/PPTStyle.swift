//
//  CustomStyle.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

struct PPTStyle: MSGMessengerStyle {
    
    var collectionView: MSGCollectionView.Type = PPTCollectionView.self
    
    var inputView: MSGInputView.Type = MSGImessageInputView.self //CustomMessageInputView.self
    
    var headerHeight: CGFloat = 12.0
    
    var footerHeight: CGFloat = 12.0
    
//    var style = MessengerKit.Styles.iMessage
//    style.headerHeight = 0
//    style.inputPlaceholder = "Message"
//    style.alwaysDisplayTails = false
    var outgoingBubbleColor = UIColor(white: 1, alpha: 1)
    var outgoingTextColor = UIColor(white: 0, alpha: 1)
    var incomingBubbleColor = UIColor(rgb: PPTColors.activeCategoryColor)
    var incomingTextColor = UIColor(white: 1, alpha: 1)
    var backgroundColor = UIColor(rgb: PPTColors.lightBackgroundColor)
    var inputViewBackgroundColor = UIColor(rgb: PPTColors.lightBackgroundColor)
    
    var alwaysDisplayTails = false
    
    var font: UIFont = .preferredFont(forTextStyle: .body)
    
    var inputFont: UIFont = .systemFont(ofSize: 14)
    
    var inputPlaceholder: String = "Message"
    
    var inputTextColor: UIColor = .darkText
    
    var inputPlaceholderTextColor: UIColor = .lightGray
    
    var outgoingLinkColor: UIColor = .blue
    
    var incomingLinkColor: UIColor = .blue
    
    func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
        var size: CGSize!
        
        switch message.body {
        case .text(let body):
            
            let bubble = PPTBubble()
            bubble.text = body
            bubble.font = font
            let bubbleSize = bubble.calculatedSize(in: CGSize(width: collectionView.bounds.width, height: .infinity))
            size = CGSize(width: collectionView.bounds.width, height: bubbleSize.height)
            
            break
            
            
        case .emoji:
            
            size = CGSize(width: collectionView.bounds.width, height: 60)
            
            break
            
        default:
            
            size = CGSize(width: collectionView.bounds.width, height: 175)
            
            break
        }
        
        return size
    }
    
    // MARK - Custom Properties
    
    var incomingBorderColor: UIColor = .white
    
    var outgoingBorderColor: UIColor = UIColor(hue:0.91, saturation:0.70, brightness:0.85, alpha:1.00)
    
}
