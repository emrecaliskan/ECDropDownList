//
//  ECListItemView.swift
//  ECDropDownList
//
//  Created by Emre Caliskan on 2015-03-23.
//  Copyright (c) 2015 pictago. All rights reserved.
//

import UIKit

func ==(lhs: ECListItemView, rhs: ECListItemView) -> Bool {
    return lhs.listItem == rhs.listItem
}


protocol ECListItemDelegate {
    func didTapItem(listItemView:ECListItemView)
}

class ECListItemView: UIView {
    
    var listItem:ECListItem
    var titleLabel:UILabel = UILabel()
    var listItemFrameHeight = CGFloat(40.0)
    var listItemTextAlignment = NSTextAlignment.Center
    var overlayButton = UIButton()
    
    var delegate:ECListItemDelegate?
    
    override init(frame: CGRect) {
        self.listItem = ECListItem()
        super.init(frame: frame)
    }
    
    init(listItem:ECListItem) {
        self.listItem = listItem
        super.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, listItemFrameHeight))
        self.backgroundColor = UIColor.lightGrayColor()
        
        
        //Add titleLabel for Item
        titleLabel.frame = self.frame
        titleLabel.text = self.listItem.text
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = listItemTextAlignment
        self.addSubview(titleLabel)
        
        //Configure Overlay Button that handles tap actions
        overlayButton.frame = self.frame
        overlayButton.backgroundColor = UIColor.clearColor()
        overlayButton.addTarget(self, action: "didPressButton", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(overlayButton)
    }

    required init(coder aDecoder: NSCoder) {
        self.listItem = ECListItem()
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    /// Executes listItem action, if the listItemView is not the topView in the menu.THEN, executes delegate didTap delegate. Order is important.
    func didPressButton(){
        if !listItem.isSelected{
            listItem.action?()
        }
        delegate?.didTapItem(self)
    }
    
    override func copy() -> AnyObject {
        let copy = ECListItemView(listItem: self.listItem)
        copy.titleLabel = self.titleLabel
        copy.listItemFrameHeight = self.listItemFrameHeight
        copy.listItemTextAlignment = self.listItemTextAlignment
        copy.overlayButton = self.overlayButton

        return copy
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
}
