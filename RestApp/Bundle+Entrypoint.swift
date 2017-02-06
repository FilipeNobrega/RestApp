//
//  Bundle+Entrypoint.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/5/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation

extension Bundle {

  var apiEntrypoint: String {
    return self.object(forInfoDictionaryKey: "ApiEntrypoint") as! String
  }

}
