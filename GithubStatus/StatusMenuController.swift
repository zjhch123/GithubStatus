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
    
    
    @IBAction func quitClicked(_ sender: AnyObject) {
        NSApplication.shared().terminate(self)
    }

    @IBAction func updateClicked(_ sender: AnyObject) {
        renderCountFrom(username: "zjhch123")
    }
    
    func githubRequestDidUpdate(count: String?) {
        if let status = self.statusMenu.item(withTitle: "Status") , let _count = count{
            status.title = _count
        }
    }
    
    func renderCountFrom(username: String) {
        githubRequest.request(username: username);
    }
    
    override func awakeFromNib() {
        githubRequest = GithubRequest(delegate: self)
        statusItem.menu = statusMenu
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = false // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }
    
    
    
}
