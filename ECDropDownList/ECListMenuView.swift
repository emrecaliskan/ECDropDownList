//
//  ECListMenuView.swift
//  ECDropDownList
//
//  Created by Emre Caliskan on 2015-03-23.
//  Copyright (c) 2015 pictago. All rights reserved.
//

import UIKit


class ECListMenuView: UIView, ECListItemDelegate {
    
    
    var listMenu:ECListMenu
    var listItemViews = [ECListItemView]()
    var collapsedHeight = CGFloat(40.0)
    var topView:ECListItemView!
    var state:String = "collapsed"
    var firstLoad = true
    
    var currentlySelectedItemView:ECListItemView?
    
    init(frame:CGRect, listMenu:ECListMenu) {
        self.listMenu = listMenu
        super.init(frame: frame)
        
        
        //Add Views to listItemViews Array
        for item in listMenu.items {
            let itemView = ECListItemView(listItem: item)
            itemView.delegate = self
            listItemViews.append(itemView)
        }
        
        //Add Views in reverse order
        for itemView in reverse(listItemViews){
            self.addSubview(itemView)
        }
        
        //Create ItemView for the top view of the menu, with no action on press
        updateTopView(listItemViews.first!)
        updateSelectedListItemView(listItemViews.first!)
        
        firstLoad = false
    }
    
    required init(coder aDecoder: NSCoder) {
        self.listMenu = ECListMenu()
        super.init(coder: aDecoder)
    }
    
    func didTapItem(listItemView:ECListItemView) {
        if state == "collapsed" {
            expandList()
            state = "expanded"
        } else {
            dispatch_async(dispatch_get_main_queue()) {
                self.updateSelectedListItemView(listItemView)
            }
            
            collapseList()
            state = "collapsed"
            self.updateTopView(listItemView)
        }
    }
    
    func expandList(){
        topView.removeFromSuperview()
        self.frame = getExpandedFrame()
        for var index = 0; index < listMenu.items.count; ++index {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                let listItemView = self.listItemViews[index]
                listItemView.frame.origin.y = CGFloat(index) * listItemView.listItemFrameHeight
                listItemView.alpha = 1
            })
        }
    }
    
    func collapseList(){
        for var index = 0; index < listMenu.items.count; ++index {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                let listItemView = self.listItemViews[index]
                listItemView.frame.origin.y = 0
                listItemView.alpha = 1
            })
        }
        self.frame = getCollapsedFrame()
    }
    
    func updateTopView(newListItemView:ECListItemView){
        self.topView = newListItemView.copy() as ECListItemView
        self.topView.backgroundColor = UIColor.yellowColor()
        self.topView.listItem.isSelected = true
        self.topView.delegate = self
        self.topView.alpha = firstLoad ? 1 : 0
        self.addSubview(self.topView)
        
        //If not first load, delay, to show selection of item 0 (which is not visible without a little delay)
        if(!firstLoad){
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.topView.alpha = 1
            })
        }
        
    }
    
    func updateSelectedListItemView(selectedListItemView:ECListItemView){
        if currentlySelectedItemView != selectedListItemView {
            
            currentlySelectedItemView?.listItem.isSelected = false
            selectedListItemView.listItem.isSelected = true
            
            currentlySelectedItemView?.backgroundColor = UIColor.lightGrayColor()
            selectedListItemView.backgroundColor = UIColor.greenColor()
            currentlySelectedItemView = selectedListItemView
        }
    }
    
    func getExpandedFrame() -> CGRect {
        return CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width, collapsedHeight * CGFloat(listMenu.items.count))
    }
    
    func getCollapsedFrame() -> CGRect {
        return CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width, collapsedHeight)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}


