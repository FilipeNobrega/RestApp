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

typealias restResponse = ((_ response: JSON?,_ responseCode: Int?, _ error: Error?) -> ())

class RestService {
  class func request(with endPoint: String, callback: @escaping restResponse) {
    Alamofire.request(endPoint).responseJSON { (response: DataResponse<Any>) in
      guard let resultValue = response.value else {
        callback(nil, response.response?.statusCode, response.error)
        return
      }
      let json = JSON(resultValue)

      callback(json, response.response?.statusCode, response.error)
    }
  }
}
