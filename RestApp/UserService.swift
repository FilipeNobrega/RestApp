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

typealias UserResponse = ((_ response: [UserModel]?, _ error: Error?) -> ())

class UserService {
  class func requestUsers(forPageIndex pageIndex: Int = 1, callback: @escaping UserResponse) {
    guard pageIndex >= 0 else {
      callback(nil, nil)
      return
    }

    RestService.request(withEndPoint: "\(Bundle.main.apiEntrypoint)?_page=\(pageIndex)&_sort=name") {
      (response: JSON?, error: Error?) in
      guard let response = response else {
        callback(nil, error)
        return
      }
      
      var userModels = [UserModel]()

      guard let jsonObjects = response.array else {
        callback(userModels, error)
        return
      }

      for json: JSON in jsonObjects {
        if let userModel = UserModel(json: json) {
          userModels.append(userModel)
        }
      }

      callback(userModels, nil)
    }
  }
}
