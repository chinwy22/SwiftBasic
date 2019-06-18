//
//  UserInfo.swift
//  BasicFramwork
//
//  Created by Chin on 2019/6/14.
//  Copyright © 2019 Chin. All rights reserved.
//

import Foundation

class UserInfo : Codable {
    var id: Int = 0
    var name: String!
    var brief: String!
    var sex: String!
    var birthDate: Int = 0
    var phone: String!
    var sesameCode: String!
    var avatar: String!
    var relationship: String!
    var isFriend: Bool = false
    var region: String!
    var rongcloudId: String!
}
