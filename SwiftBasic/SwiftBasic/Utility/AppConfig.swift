//
//  AppConfig.swift
//  BasicFramwork
//
//  Created by Chin on 2019/6/14.
//  Copyright © 2019 Chin. All rights reserved.
//

import UIKit

//App level common constants
struct AppConstants {
    static let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
    static let PORTRAIT_SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let PORTRAIT_SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    #if DEBUG
    static let IS_PRODUCTION = false
    #else
    static let IS_PRODUCTION = true
    #endif
}


#if DEBUG

#else

#endif
