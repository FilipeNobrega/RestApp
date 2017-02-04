//
//  GeoModel.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GeoModel {
  
  let latitude: Double
  let longitude: Double

  init?(json: JSON) {
    guard let latitude = json["lat"].string,
      let longitude = json["lng"].string else {
        return nil
    }

    self.latitude = Double(latitude)!
    self.longitude = Double(longitude)!
  }
}
