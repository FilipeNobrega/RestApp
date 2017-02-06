//
//  UserModel.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON

struct UserModel {
  
  let id: UInt64
  let name: String
  let username: String
  let email: String
  let phone: String
  let website: String
  let address: AddressModel
  let company: CompanyModel

  init?(json: JSON) {
    guard let id = json["id"].uInt64,
      let name = json["name"].string,
      let username = json["username"].string,
      let email = json["email"].string,
      let phone = json["phone"].string,
      let website = json["website"].string,
      let address = AddressModel(json: json["address"]),
      let company = CompanyModel(json: json["company"]) else {
        return nil
    }

    self.id = id
    self.name = name
    self.username = username
    self.email = email
    self.phone = phone
    self.website = website
    self.address = address
    self.company = company
  }
}
