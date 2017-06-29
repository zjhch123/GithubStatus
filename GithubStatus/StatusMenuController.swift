//
//  StatusMenuController.swift
//  GithubStatus
//
//  Created by 张佳皓 on 2017/6/28.
//  Copyright © 2017年 张佳皓. All rights reserved.
//

import Cocoa


class StatusMenuController: NSObject, GithubRequestDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    var githubRequest: GithubRequest!
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var statusView: StatusView!
    var statusMenuItem: NSMenuItem!

    func githubRequestDidUpdate(username: String, count: String?) {
        if let _count = count {
            statusView.update(username: username, count: _count)
        }
    }
    
    override func awakeFromNib() {
        githubRequest = GithubRequest(delegate: self)
        statusItem.menu = statusMenu
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = false // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        statusMenuItem = statusMenu.item(withTitle: "Status")
        statusMenuItem.view = statusView
    }
    
    @IBAction func quitClicked(_ sender: AnyObject) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func updateClicked(_ sender: AnyObject) {
        githubRequest.request(username: "zjhch123");
    }
    
}
