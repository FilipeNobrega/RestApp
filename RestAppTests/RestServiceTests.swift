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
    let expectation = self.expectation(description: "Waiting for web response")

    RestService.request(with: "https://google.com/") { (response: Any?, statusCode: Int?, error: Error?) in

      XCTAssertTrue(statusCode == 200)
      XCTAssertNotNil(error)

      expectation.fulfill()
    }
    self.waitForExpectations(timeout: self.timeOut, handler: nil)
  }

  func testThatWhenResponseIsAValidJSONItShouldReturnSuccess() {
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
