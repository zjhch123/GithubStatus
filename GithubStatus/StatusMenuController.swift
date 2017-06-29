//
//  StatusMenuController.swift
//  GithubStatus
//
//  Created by 张佳皓 on 2017/6/28.
//  Copyright © 2017年 张佳皓. All rights reserved.
//

import Cocoa


class StatusMenuController: NSObject, GithubRequestDelegate, PreferencesWindowDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    let DEFAULT_USER = "octocat"
    
    var githubRequest: GithubRequest!
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var statusView: StatusView!
    var statusMenuItem: NSMenuItem!

    var preferencesWindow: PreferencesWindow!
    
    func getDefaultUser() -> String {
        let defaults = UserDefaults.standard
        let user = defaults.string(forKey: "username") ?? DEFAULT_USER
        return user
    }
    
    func updateCount() {
        let user = getDefaultUser()
        githubRequest.request(username: user)
    }
    
    func githubRequestDidUpdate(username: String, count: String?) {
        if let _count = count {
            statusView.update(username: username, count: _count)
        }
    }
    
    func preferencesDisUpdate() {
        updateCount()
    }
    
    override func awakeFromNib() {
        preferencesWindow = PreferencesWindow()
        preferencesWindow.delegate = self
        githubRequest = GithubRequest(delegate: self)
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = false // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        statusMenuItem = statusMenu.item(withTitle: "Status")
        statusMenuItem.view = statusView
        statusView.usernameTextField.stringValue = getDefaultUser()
        updateCount()
    }
    
    
    @IBAction func quitClicked(_ sender: AnyObject) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func updateClicked(_ sender: AnyObject) {
        updateCount()
        
    }

    @IBAction func preferencesClicked(_ sender: AnyObject) {
        preferencesWindow.showWindow(nil)
    }
}
