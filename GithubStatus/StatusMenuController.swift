//
//  StatusMenuController.swift
//  GithubStatus
//
//  Created by 张佳皓 on 2017/6/28.
//  Copyright © 2017年 张佳皓. All rights reserved.
//

import Cocoa
import SwiftHTTP


class StatusMenuController: NSObject {

    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    
    @IBAction func quitClicked(_ sender: AnyObject) {
        NSApplication.shared().terminate(self)
    }

    override func awakeFromNib() {
        statusItem.menu = statusMenu
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = false // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }
    
    
}
