//
//  WSManager.swift
//  BasicFramwork
//
//  Created by Chin on 2019/6/14.
//  Copyright © 2019 Chin. All rights reserved.
//

import Foundation

class WSManager {

    class func getHeader() -> [String : String]{
        var headers : [String : String] = [
            "Content-type" : "application/json",
            "Authorization" : "Token 948f8488abee524fcf2d3bc172590d3a5e7b143d"
        ]
        if let xAuthToken = getPREF(key: UserDefaultKey.token.rawValue){
            headers["Authorization"] = xAuthToken
        }
        
        return headers
    }
}
