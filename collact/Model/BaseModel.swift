//
//  BaseModel.swift
//  collact
//
//  Created by minjae on 26/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import Foundation

class BaseModel{

    func map() -> [String:Any] {
        var dict = [String:Any]()
        let otherSelf = Mirror(reflecting: self)
        for child in otherSelf.children {
            if let key = child.label  {
                dict[key] = child.value
            }
        }
        return dict
    }
}
