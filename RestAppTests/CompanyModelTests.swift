//
//  CompanyModelTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import SwiftyJSON
import XCTest

@testable import RestApp

class CompanyModelTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }


  func testCompanyParser() {
    guard let json = TestHelper().json(from: "UserModelDataTest") else {
      XCTFail("File not found")
      return
    }
    let companyModel = CompanyModel(json: json["company"])

    XCTAssertNotNil(companyModel)

    XCTAssertEqual(companyModel?.name, "Romaguera-Crona")
    XCTAssertEqual(companyModel?.catchPhrase, "Multi-layered client-server neural-net")
    XCTAssertEqual(companyModel?.bs, "harness real-time e-markets")
  }
}
