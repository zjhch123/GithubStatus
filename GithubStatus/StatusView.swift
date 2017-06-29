//
//  StatusView.swift
//  GithubStatus
//
//  Created by 张佳皓 on 2017/6/29.
//  Copyright © 2017年 张佳皓. All rights reserved.
//

import Cocoa

class StatusView: NSView {

    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var countTextField: NSTextField!
    
    func update(username: String, count: String) {
        DispatchQueue.main.async {
            self.usernameTextField.stringValue = username
            self.countTextField.stringValue = "今日提交次数: \(count)次"
        }
    }
    
    
}
