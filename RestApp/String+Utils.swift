//
//  String+Utils.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation

extension String {
  func phone() -> String {
    let posSpacesMap = [3: "-",
                        6: ") ",
                        9: "("]
    let preSpacesMap = [10: " "]
    let phoneExtensionSeparator = "x"
    let phoneArray = components(separatedBy: phoneExtensionSeparator)

    guard let phone = phoneArray.first?.filterNumber() else { return "" }
    var parsedNumber = ""

    if phone.characters.count > 10 {
      parsedNumber = "+\(phone)"
    } else {
      parsedNumber = phone
    }

    var phoneNumber = ""

    var index = 0
    for char in parsedNumber.characters.reversed() {
      if let char = preSpacesMap[index] {
        phoneNumber = "\(char)\(phoneNumber)"
      }
      phoneNumber = "\(char)\(phoneNumber)"
      if let char = posSpacesMap[index] {
        phoneNumber = "\(char)\(phoneNumber)"
      }
      index += 1
    }

    guard let lineExtension = phoneArray.last, phoneArray.count > 1 else {
      return phoneNumber
    }

    return "\(phoneNumber) x\(lineExtension)"
  }

  private func filterNumber() -> String {
    return String(characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
  }
}
