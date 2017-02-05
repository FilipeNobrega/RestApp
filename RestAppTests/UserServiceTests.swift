//
//  UserServiceTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import Alamofire
import OHHTTPStubs
import XCTest

class UserServiceTests: XCTestCase {
  fileprivate let timeOut : TimeInterval = 10.0

  func testThatWhenResponseIsAnEmptyJsonItShouldReturnEmptyArray() {
    TestHelper().prepareStub(with: "jsonplaceholder.typicode.com", file: "empty")

    let expectation = self.expectation(description: "Waiting for web response")

    UserService.requestUsers(with: 0) { (models: [UserModel]?, statusCode: Int?, error: Error?) in
      XCTAssertTrue(statusCode == 200)
      XCTAssertNotNil(models)
      if let models = models {
        XCTAssertTrue(models.isEmpty)
      }
      expectation.fulfill()
    }
    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }

  func testThatWhenResponseIsAnNormalJsonItShouldReturnAnArray() {
    TestHelper().prepareStub(with: "jsonplaceholder.typicode.com", file: "UsersRequest")
    
    let expectation = self.expectation(description: "Waiting for web response")

    UserService.requestUsers(with: 0) { (models: [UserModel]?, statusCode: Int?, error: Error?) in
      XCTAssertTrue(statusCode == 200)
      XCTAssertNotNil(models)
      if let models = models {
        XCTAssertTrue(models.count == 10)
      }
      expectation.fulfill()
    }
    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }
}
