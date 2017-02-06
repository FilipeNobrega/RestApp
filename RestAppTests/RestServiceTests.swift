//
//  RestServiceTests.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import XCTest

@testable import RestApp

class RestServiceTests: XCTestCase {
  fileprivate let timeOut : TimeInterval = 10.0

  func testThatWhenResponseIsNotAValidJSONItShouldReturnError() {
    TestHelper().prepareStub(with: "google.com", file: "empty", type: "html")
    let expectation = self.expectation(description: "Waiting for web response")

    RestService.request(withEndPoint: "https://google.com/") { (response: Any?, error: Error?) in
      XCTAssertNotNil(error)
      expectation.fulfill()
    }
    waitForExpectations(timeout: timeOut, handler: nil)
  }

  func testThatWhenResponseIsAValidJSONItShouldReturnSuccess() {
    TestHelper().prepareStub(with: "jsonplaceholder.typicode.com", file: "UsersRequest")
    let expectation = self.expectation(description: "Waiting for web response")

    RestService.request(withEndPoint: "https://jsonplaceholder.typicode.com/users") { (response: Any?, error: Error?) in
      XCTAssertNotNil(response)
      expectation.fulfill()
    }
    waitForExpectations(timeout: timeOut, handler: nil)
  }

  func testThatATSWillAllowUnsecureAccessFromTypicode() {
    let expectation = self.expectation(description: "Waiting for web response")

    RestService.request(withEndPoint: "http://jsonplaceholder.typicode.com/users") { (response: Any?, error: Error?) in
      XCTAssertNotNil(response)
      expectation.fulfill()
    }

    waitForExpectations(timeout: timeOut, handler: nil)
  }
}
