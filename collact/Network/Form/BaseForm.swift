//
//  BaseForm.swift
//  collact
//
//  Created by minjae on 26/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import Foundation

class BaseForm : BaseModel {
    var test: String = ""

    init?(test : String){
        self.test = test
    }
}
