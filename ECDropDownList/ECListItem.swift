//
//  ECListItem.swift
//  ECDropDownList
//
//  Created by Emre Caliskan on 2015-03-23.
//  Copyright (c) 2015 pictago. All rights reserved.
//

import Foundation
import UIKit

func ==(lhs: ECListItem, rhs: ECListItem) -> Bool {
    return lhs.text == rhs.text
}

class ECListItem : NSObject {
    
    var text:String = ""
    var backgroundColor:UIColor = UIColor.whiteColor()
    var action:(() -> ())?
    var isSelected = false
    
    override init() {
        super.init()
    }
    
    init(text:String, action:(() -> ())) {
        self.text = text
        self.action = action
    }
  
}
