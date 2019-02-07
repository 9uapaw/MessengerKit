//
//  ChatUser.swift
//  popit-ios
//
//  Created by Quapaw on 2019. 01. 21..
//  Copyright © 2019. Popit App Ltd. All rights reserved.
//

import Foundation


public struct PPTChatUser: MSGUser {
    
    public var displayName: String
    
    public var avatar: UIImage?
    
    public var isSender: Bool
    
    var avatarUrl: URL?
    
    public init(displayName: String, avatar: UIImage? = nil, isSender: Bool, avatarUrl: URL?) {
        self.displayName = displayName
        self.avatar = avatar
        self.isSender = isSender
        self.avatarUrl = avatarUrl
    }
    
}
