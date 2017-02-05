//
//  RestServiceTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import XCTest

class RestServiceTests: XCTestCase {
  fileprivate let timeOut : TimeInterval = 10.0

  func testThatWhenResponseIsNotAValidJSONItShouldReturnError() {
    TestHelper().prepareStub(with: "google.com", file: "empty", type: "html")
    let expectation = self.expectation(description: "Waiting for web response")

    RestService.request(with: "https://google.com/") { (response: Any?, statusCode: Int?, error: Error?) in

      XCTAssertTrue(statusCode == 200)
      XCTAssertNotNil(error)

      expectation.fulfill()
    }
    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }

  func testThatWhenResponseIsAValidJSONItShouldReturnSuccess() {
    TestHelper().prepareStub(with: "jsonplaceholder.typicode.com", file: "UsersRequest")
    let expectation = self.expectation(description: "Waiting for web response")

    RestService.request(with: "https://jsonplaceholder.typicode.com/users/1/") { (response: Any?, statusCode: Int?, error: Error?) in

      XCTAssertTrue(statusCode == 200)
      XCTAssertNotNil(response)

      expectation.fulfill()
    }
    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }

  func testThatATSWillAllowUnsecureAccessFromTypicode() {
    let expectation = self.expectation(description: "Waiting for web response")

    RestService.request(with: "http://jsonplaceholder.typicode.com/users/1/") { (response: Any?, statusCode: Int?, error: Error?) in

      XCTAssertTrue(statusCode == 200)
      expectation.fulfill()
    }

    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }
}
