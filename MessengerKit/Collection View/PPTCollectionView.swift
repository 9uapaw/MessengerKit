//
//  CustomCollectionView.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

open class PPTCollectionView: MSGCollectionView {

    override open func registerCells() {
        super.registerCells()
        
        collectionViewLayout = MSGImessageCollectionViewFlowLayout()
        
        register(UINib(nibName: "PPTOutgoingTextCell", bundle: nil), forCellWithReuseIdentifier: "outgoingText")
        register(UINib(nibName: "PPTIncomingTextCell", bundle: nil), forCellWithReuseIdentifier: "incomingText")
    }

}
