//
//  UserService.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias userResponse = ((_ response: [UserModel]? ,_ responseCode: Int?, _ error: Error?) -> ())

class UserService {
  class func requestUsers(with pageIndex: Int, callback: @escaping userResponse) {
    guard pageIndex >= 0 else {
      callback(nil, nil, nil)
      return
    }

    RestService.request(with: "http://jsonplaceholder.typicode.com/users?_page\(pageIndex)") {
      (response: JSON?, statusCode: Int?, error: Error?) in
      guard let response = response else {
        callback(nil, statusCode, error)
        return
      }
      
      guard let jsonObjects = response.array else {
        callback(nil, statusCode, error)
        return
      }

      var userModels = [UserModel]()
      for json: JSON in jsonObjects {
        if let userModel = UserModel(json: json) {
          userModels.append(userModel)
        }
      }

      callback(userModels, statusCode, nil)
    }
  }
}
