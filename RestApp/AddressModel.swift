//
//  AddressModel.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AddressModel {
  
  let street: String
  let suite: String
  let city: String
  let zipcode: String
  let geo: GeoModel

  init?(json: JSON) {
    guard let street = json["street"].string,
      let suite = json["suite"].string,
      let city = json["city"].string,
      let zipcode = json["zipcode"].string,
      let geo = GeoModel(json: json["geo"]) else {
        return nil
    }
    self.street = street
    self.suite = suite
    self.city = city
    self.zipcode = zipcode
    self.geo = geo
  }
}
