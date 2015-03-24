//
//  ViewController.swift
//  ECDropDownList
//
//  Created by Emre Caliskan on 2015-03-23.
//  Copyright (c) 2015 pictago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var items = [ECListItem]()
        for var index = 0; index<10; index++ {
            let item = ECListItem(text: "Item \(index)") { () -> () in
                NSLog("Did Tap Item \(index)")
            }
            items.append(item)
        }
        
        let item1 = ECListItem(text: "Item 1") { () -> () in
            NSLog("Did Tap Item 1")
        }

        let item2 = ECListItem(text: "Item 2") { () -> () in
            NSLog("Did Tap Item 2")
        }
        
        let item3 = ECListItem(text: "Item 3") { () -> () in
            NSLog("Did Tap Item 3")
        }
        
        let item4 = ECListItem(text: "Item 4") { () -> () in
            NSLog("Did Tap Item 4")
        }
        
        let item5 = ECListItem(text: "Item 5") { () -> () in
            NSLog("Did Tap Item 5")
        }
      
     
        let menu = ECListMenu(items: [item1, item2, item3, item4, item5])
        let menuView = ECListMenuView(frame: CGRectMake(0, 40, self.view.bounds.width, self.view.bounds.height), listMenu: menu)
        self.view.addSubview(menuView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

