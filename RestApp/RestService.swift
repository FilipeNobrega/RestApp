//
//  RestService.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias RestResponse = ((_ response: JSON?, _ error: Error?) -> ())

class RestService {
  class func request(withEndPoint endPoint: String, callback: @escaping RestResponse) {
    Alamofire.request(endPoint).responseJSON { (response: DataResponse<Any>) in
      guard let resultValue = response.value else {
        callback(nil, response.error)
        return
      }
      let json = JSON(resultValue)

      callback(json, response.error)
    }
  }
}
