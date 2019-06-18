//
//  ViewController.swift
//  SwiftBasic
//
//  Created by Chin on 2019/6/18.
//  Copyright © 2019 Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ALog(Language.getString("Hello"))
        
        
        ExempleDAO.WSGetPersonalPageData(successHandler: { (userInfo) in
            let userInfo : UserInfo = userInfo
            ALog(userInfo.phone)
        }) { (error) in
            ALog(error)
        }
    }



}

