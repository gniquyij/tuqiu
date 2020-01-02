//
//  SafariExtensionViewController.swift
//  tuqiu Extension
//
//  Created by yuqing.ji on 2020/01/02.
//  Copyright © 2020 vjyq. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
