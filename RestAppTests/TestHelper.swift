//
//  TestHelper.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import OHHTTPStubs
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

  func prepareStub(with host: String, file: String, type: String = "json") {
    let configuration = URLSession.shared.configuration

    OHHTTPStubs.setEnabled(true, for: configuration)

    let responseText = "{\"data\":\"val\"}"

    stub(condition: isHost(host)) { request -> OHHTTPStubsResponse in
      do {
        let testBundle = Bundle(for: type(of: self))

        guard let path = testBundle.url(forResource: file, withExtension: type) else {
          return OHHTTPStubsResponse(data:responseText.data(using: .utf8)!, statusCode:200, headers:nil)
        }

        let jsonData = try Data(contentsOf: path)

        return OHHTTPStubsResponse(data:jsonData, statusCode:200, headers:nil)

      } catch {
        return OHHTTPStubsResponse(data:responseText.data(using: .utf8)!, statusCode:200, headers:nil)
      }
    }

  }
}
