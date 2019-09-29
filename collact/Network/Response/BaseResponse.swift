//
//  BaseResponse.swift
//  collact
//
//  Created by minjae on 26/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse : Mappable{
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        code <- map["code"]
        msg <- map["msg"]
    }

    var code : Int = 0
    var msg : String = "오류가 발생하였습니다. 잠시 후 다시 시도해주세요."

}
