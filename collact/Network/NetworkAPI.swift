//
//  File.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import Foundation

class NetworkAPI {
    public static let BASE_TOKEN = ""
    public static let ERROR_MSG = "오류가 발생하였습니다. 잠시 후 다시 시도해주세요."
    public static let URL="http://dev-service.lab-manager.com/"
//    public static let URL="http://192.168.0.14:3000/"
    
    public static func getHeader() -> [String:String] {
        if let token = UserDefaults.standard.object(forKey: CodePreference.TOKEN) {
            return [
                "Authorization": UserDefaults.standard.string(forKey: token as! String)!,
                "X-platform": "mobile-ios"
            ]
        } else {
            print("token is nil value")
            return [
                "Authorization": UserDefaults.standard.string(forKey: BASE_TOKEN)!,
                "X-platform": "mobile-ios"
            ]
        }
    }
}
