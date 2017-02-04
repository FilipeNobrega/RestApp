//
//  String+UtilsTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import XCTest

class StringTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testPhoneParser() {
    let phone = "5(775) 976-6794"

    print(phone.phone())
    print(phone)
    //XCTAssertEqual("+1 (770) 736-8031 x56442", phone.phone())
  }
}
