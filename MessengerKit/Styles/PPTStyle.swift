//
//  CustomStyle.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

public struct PPTStyle: MSGMessengerStyle {
    
    public init() {}
    
    public var collectionView: MSGCollectionView.Type = MSGImessageCollectionView.self //PPTCollectionView.self
    
    public var inputView: MSGInputView.Type = MSGImessageInputView.self // PPTMessageInputView.self
    
    public var headerHeight: CGFloat = 12.0
    
    public var footerHeight: CGFloat = 12.0
    
//    var style = MessengerKit.Styles.iMessage
//    style.headerHeight = 0
//    style.inputPlaceholder = "Message"
//    style.alwaysDisplayTails = false
    public var outgoingBubbleColor = UIColor(white: 1, alpha: 1)
    public var outgoingTextColor = UIColor(white: 0, alpha: 1)
    public var incomingBubbleColor = UIColor(rgb: PPTColors.activeCategoryColor)
    public var incomingTextColor = UIColor(white: 1, alpha: 1)
    public var backgroundColor = UIColor(rgb: PPTColors.lightBackgroundColor)
    public var inputViewBackgroundColor = UIColor(rgb: PPTColors.lightBackgroundColor)
    
    var alwaysDisplayTails = false
    
    public var font: UIFont = .preferredFont(forTextStyle: .body)
    
    public var inputFont: UIFont = .systemFont(ofSize: 14)
    
    public var inputPlaceholder: String = "Message"
    
    public var inputTextColor: UIColor = .darkText
    
    public var inputPlaceholderTextColor: UIColor = .lightGray
    
    public var outgoingLinkColor: UIColor = .blue
    
    public var incomingLinkColor: UIColor = .blue
    
    public func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
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
    
    public var incomingBorderColor: UIColor = .white
    
    public var outgoingBorderColor: UIColor = UIColor(hue:0.91, saturation:0.70, brightness:0.85, alpha:1.00)
    
}
