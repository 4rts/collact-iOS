//
//  BaseController.swift
//  collact
//
//  Created by minjae on 26/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import Toast_Swift

class BaseController{
    // URL List
    public static let TEST_URL = "v1/test_list"

    // API List
    public static func TestList(view:UIView!, callback : @escaping(BaseResponse) -> Void) {
        Alamofire.request(NetworkAPI.URL+TEST_URL,method:.get, parameters : ["offset":0,"limit":30],headers: NetworkAPI.getHeader())
            .responseJSON{ response in
                let result = Mapper<BaseResponse>().map(JSONObject : response.result.value)
                if result != nil {
                    callback(result!)
                }else {
                    view.makeToast(NetworkAPI.ERROR_MSG)
                }
        }
    }
}