//
//  ChatUser.swift
//  popit-ios
//
//  Created by Quapaw on 2019. 01. 21..
//  Copyright © 2019. Popit App Ltd. All rights reserved.
//

import Foundation
import MessengerKit

struct ChatUser: MSGUser {
    
    var displayName: String
    
    var avatar: UIImage?
    
    var isSender: Bool
    
    var avatarUrl: URL?
    
}
