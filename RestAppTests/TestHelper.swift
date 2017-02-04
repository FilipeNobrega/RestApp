//
//  TestHelper.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON

class TestHelper {
  func json(from file: String) -> JSON? {
    do {
      let testBundle = Bundle(for: type(of: self))

      guard let path = testBundle.url(forResource: file, withExtension: "json") else {
        return nil
      }

      let jsonData = try Data(contentsOf: path)

      return JSON(data: jsonData)

    } catch {
      return nil
    }
  }
}
