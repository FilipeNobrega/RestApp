//
//  String+UtilsTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import XCTest

@testable import RestApp

class StringTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testPhoneParser() {
    let phone = "5(775) 976-6794"
    let phone2 = "(775) 976-6794"
    let phone3 = "57759766794"
    let phone4 = "5775976-6794"
    let phone5 = "5.775.976.6794"
    let phone6 = "775.976.6794"
    let phone7 = "775.976.6794 x231"
    let phone8 = "5775.976.6794 x231"

    XCTAssertEqual("+5 (775) 976-6794", phone.phone())
    XCTAssertEqual("(775) 976-6794", phone2.phone())
    XCTAssertEqual("+5 (775) 976-6794", phone3.phone())
    XCTAssertEqual("+5 (775) 976-6794", phone4.phone())
    XCTAssertEqual("+5 (775) 976-6794", phone5.phone())
    XCTAssertEqual("(775) 976-6794", phone6.phone())
    XCTAssertEqual("(775) 976-6794 x231", phone7.phone())
    XCTAssertEqual("+5 (775) 976-6794 x231", phone8.phone())
  }
}
