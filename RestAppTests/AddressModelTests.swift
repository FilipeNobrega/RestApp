//
//  AddressModelTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON
import XCTest

class AddressModelTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }


  func testAddressParser() {
    guard let json = TestHelper().json(from: "UserModelDataTest") else {
      XCTFail("File not found")
      return
    }
    let addressModel = AddressModel(json: json["address"])

    XCTAssertNotNil(addressModel)
    XCTAssertNotNil(addressModel?.geo)

    XCTAssertEqual(addressModel?.street, "Kulas Light")
    XCTAssertEqual(addressModel?.suite, "Apt. 556")
    XCTAssertEqual(addressModel?.city, "Gwenborough")
    XCTAssertEqual(addressModel?.zipcode, "92998-3874")
  }
}
