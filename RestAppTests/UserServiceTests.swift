//
//  UserServiceTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import Cuckoo
import XCTest

class UserServiceTests: XCTestCase {
  fileprivate let timeOut : TimeInterval = 10.0

  func testThatWhenResponseIsNotAValidJSONItShouldReturnError() {
    let expectation = self.expectation(description: "Waiting for web response")

    UserService.requestUsers(with: 0) { (models: [UserModel]?, statusCode: Int?, error: Error?) in
      XCTAssertTrue(statusCode == 200)
      XCTAssertNotNil(models)
      expectation.fulfill()
    }
    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }
}
