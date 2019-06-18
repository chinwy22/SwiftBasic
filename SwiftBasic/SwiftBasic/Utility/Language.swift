//
//  Language.swift
//  BasicFramwork
//
//  Created by Chin on 2019/6/14.
//  Copyright © 2019 Chin. All rights reserved.
//

import UIKit

class Language: NSObject {
    static let share = Language()
    private let languageKey: String = "AppleLanguages"
    private let def = UserDefaults.standard
    
    var appLanguage: String {
        guard let app = self.def.array(forKey: self.languageKey) else {
            return ""
        }
        return app.first as! String
    }
    
    func setLanguage(_ lag: String) {
        self.def.setValue([lag], forKey: self.languageKey)
        self.def.synchronize()
    }
    
    class func getString(_ key: String) -> String {
        
        guard let path = Bundle.main.path(forResource: Language.share.appLanguage, ofType: "lproj"), let bundle = Bundle(path: path) else {
            // 回傳基本文件資料
            guard let path = Bundle.main.path(forResource: "Base", ofType: "lproj"), let bundle = Bundle(path: path) else {
                return ""
            }
            return bundle.localizedString(forKey: key, value: nil, table: nil)
        }
        
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }
    
    func getDeviceLanguage() -> String{
        let languages : [String] = def.object(forKey: self.languageKey) as! [String]
        let str : String = languages[0]
        if ((str == "zh-Hans-CN")||(str == "zh-Hans")||(str == "zh-Hant-CN")||(str == "zh-Hant")){
            return "zh-Hans"
        }else{
            return "en"
        }
    }
    
    func getCurrentLanguage() -> String{
        if let language = def.value(forKey: "langeuage") as? String{
            
            if  language == "zh-Hans-CN" || language == "zh-Hans" || language == "zh-Hant-CN" || language == "zh-Hant"{
                return Language.getString("Chinese")
            }
            
            return Language.getString("English")
        }else{
            let languages:[String] = def.object(forKey: "AppleLanguages") as! [String]
            let str : String = languages[0]
            if ((str=="zh-Hans-CN")||(str=="zh-Hans")||(str=="zh-Hant-CN")||(str=="zh-Hant")){
                return Language.getString("Chinese")
            }else{
                return Language.getString("English")
            }
        }
        
    }
}
