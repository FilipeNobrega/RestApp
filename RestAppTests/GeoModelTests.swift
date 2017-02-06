//
//  GeoModelTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON
import XCTest

@testable import RestApp

class GeoModelTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }


  func testGeoParser() {
    guard let json = TestHelper().json(from: "UserModelDataTest") else {
      XCTFail("File not found")
      return
    }
    let geoModel = GeoModel(json: json["address"]["geo"])

    XCTAssertNotNil(geoModel)

    XCTAssertEqual(geoModel?.latitude, -37.3159)
    XCTAssertEqual(geoModel?.longitude, 81.1496)
  }
}
