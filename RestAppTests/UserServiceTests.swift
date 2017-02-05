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

  func testThatWhenResponseIsValidJsonItShouldReturnAnArray() {
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

  func testThatWhenResponseIsValidJsonItShouldCorrectlyParseUserObject() {
    TestHelper().prepareStub(with: "jsonplaceholder.typicode.com", file: "UsersRequest")

    let expectation = self.expectation(description: "Waiting for web response")

    UserService.requestUsers(with: 0) { (models: [UserModel]?, statusCode: Int?, error: Error?) in
      XCTAssertTrue(statusCode == 200)

      if let userModel = models?[0] {
        XCTAssertEqual(userModel.id, 1)
        XCTAssertEqual(userModel.name, "Leanne Graham")
        XCTAssertEqual(userModel.username, "Bret")
        XCTAssertEqual(userModel.email, "Sincere@april.biz")
        XCTAssertEqual(userModel.phone, "1-770-736-8031 x56442")
        XCTAssertEqual(userModel.website, "hildegard.org")
        XCTAssertEqual(userModel.company.name, "Romaguera-Crona")
        XCTAssertEqual(userModel.company.catchPhrase, "Multi-layered client-server neural-net")
        XCTAssertEqual(userModel.company.bs, "harness real-time e-markets")
        XCTAssertEqual(userModel.address.street, "Kulas Light")
        XCTAssertEqual(userModel.address.suite, "Apt. 556")
        XCTAssertEqual(userModel.address.city, "Gwenborough")
        XCTAssertEqual(userModel.address.zipcode, "92998-3874")
        XCTAssertEqual(userModel.address.geo.latitude, -37.3159)
        XCTAssertEqual(userModel.address.geo.longitude, 81.1496)
      }
      expectation.fulfill()
    }
    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }
}
