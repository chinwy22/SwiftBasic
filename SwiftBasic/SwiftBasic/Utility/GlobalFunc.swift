//
//  GlobalFunc.swift
//  BasicFramwork
//
//  Created by Chin on 2019/6/14.
//  Copyright © 2019 Chin. All rights reserved.
//

import Foundation
import UIKit


//MARK: - UserDefaults.standard
func getPREF(key:String) -> String?{
    return UserDefaults.standard.value(forKey: key) as? String
}

func setPREF(sValue:String, key:String){
    UserDefaults.standard.setValue(sValue, forKey: key)
    UserDefaults.standard.synchronize()
}

func delPREF(key:String){
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
}

func getIntPREF(key:String) -> Int?{
    return UserDefaults.standard.object(forKey: key) as? Int
}

func setIntPREF(sValue:Int, key:String){
    UserDefaults.standard.setValue(sValue, forKey: key)
    UserDefaults.standard.synchronize()
}

func getDoublePREF(key:String) -> Double?{
    return UserDefaults.standard.object(forKey: key) as? Double
}

func setDoublePREF(sValue:Double, key:String){
    UserDefaults.standard.setValue(sValue, forKey: key)
    UserDefaults.standard.synchronize()
}

func getBoolPREF(key:String) -> Bool {
    return UserDefaults.standard.bool(forKey: key)
}

func setBoolPREF(sValue:Bool , key:String){
    UserDefaults.standard.set(sValue, forKey: key)
    UserDefaults.standard.synchronize()
}

func getDataPREF(key:String) -> Data?{
    return UserDefaults.standard.data(forKey: key)
}

func setDataPREF(sValue:Data , key:String){
    UserDefaults.standard.set(sValue, forKey: key)
    UserDefaults.standard.synchronize()
}


func hexStringToUIColor (_ hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//自定义Log
func ALog<T>(_ message:T,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("\(fileName)----row\(lineNum)----\(message)")
    #endif
    
}

func getCurrentController() -> UIViewController? {
    guard let window = UIApplication.shared.windows.first else {
        return nil
    }
    var tempView: UIView?
    for subview in window.subviews.reversed() {
        if subview.classForCoder.description() == "UILayoutContainerView" {
            tempView = subview
            break
        }
    }

    if tempView == nil {
        tempView = window.subviews.last
    }

    var nextResponder = tempView?.next
    var next: Bool {
        return !(nextResponder is UIViewController) || nextResponder is UINavigationController || nextResponder is UITabBarController
    }

    while next{
        tempView = tempView?.subviews.first
        if tempView == nil {
            return nil
        }
        nextResponder = tempView!.next
    }
    return nextResponder as? UIViewController
}
