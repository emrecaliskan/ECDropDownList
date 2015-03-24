//
//  ECListMenu.swift
//  ECDropDownList
//
//  Created by Emre Caliskan on 2015-03-23.
//  Copyright (c) 2015 pictago. All rights reserved.
//

import Foundation

class ECListMenu : NSObject {
    
    var items:[ECListItem]
    
    override init(){
        self.items = [ECListItem]()
        super.init()
    }
    
    init(items:[ECListItem]){
        self.items = items
        super.init()
    }
}