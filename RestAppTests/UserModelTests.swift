//
//  UserModelTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON
import XCTest

@testable import RestApp

class UserModelTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testUserParser() {
    guard let json = TestHelper().json(from: "UserModelDataTest") else {
      XCTFail("File not found")
      return
    }
    let userModel = UserModel(json: json)

    XCTAssertNotNil(userModel)
    XCTAssertNotNil(userModel?.company)
    XCTAssertNotNil(userModel?.address)

    XCTAssertEqual(userModel?.id, 1)
    XCTAssertEqual(userModel?.name, "Leanne Graham")
    XCTAssertEqual(userModel?.username, "Bret")
    XCTAssertEqual(userModel?.email, "Sincere@april.biz")
    XCTAssertEqual(userModel?.phone, "1-770-736-8031 x56442")
    XCTAssertEqual(userModel?.website, "hildegard.org")
  }
}
