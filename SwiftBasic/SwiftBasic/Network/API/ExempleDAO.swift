//
//  ExempleDAO.swift
//  BasicFramwork
//
//  Created by Chin on 2019/6/14.
//  Copyright © 2019 Chin. All rights reserved.
//

import UIKit
import Alamofire

class ExempleDAO: NSObject {
    
    typealias successCallback = ((UserInfo) -> Void)
    typealias errorCallback = ((String) -> Void)

    static func WSGetPersonalPageData(successHandler:  @escaping successCallback,  errorHandler: @escaping errorCallback) {
        
        request(URLRoute.personalPage,
                method: .get,
                parameters: nil,
                encoding: JSONEncoding.default,
                headers: WSManager.getHeader()).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let responsDict = response.result.value as? [String: Any] {
                    if response.response?.statusCode == 200 {
//                        ALog("responsDict - \(responsDict)")
                        let decoder = JSONDecoder()
                        if let dataSource = try? JSONSerialization.data(withJSONObject: responsDict, options: []), let dict = try? decoder.decode(UserInfo.self, from: dataSource){
                            
                            successHandler(dict)
                            
                        }
                    }
                }
                break
            case .failure(let error):
                errorHandler(error.localizedDescription)
                break
            }
        }
    }
    
}
