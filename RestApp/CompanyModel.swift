//
//  CompanyModel.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CompanyModel {

  let name: String
  let catchPhrase: String
  let bs: String

  init?(json: JSON) {
    guard let name = json["name"].string,
      let catchPhrase = json["catchPhrase"].string,
      let bs = json["bs"].string else {
        return nil
    }
    self.name = name
    self.catchPhrase = catchPhrase
    self.bs = bs
  }
}
