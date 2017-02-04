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
    let phoneExtensionSeparator = "x"
    let phoneArray = self.components(separatedBy: phoneExtensionSeparator)

    guard let phone = phoneArray.first?.filterNumber() else { return "" }
    var parsedNumber = ""

    if phone.characters.count > 10 {
      parsedNumber = "+\(phone)"
    } else {
      parsedNumber = phone
    }

    guard let lineExtension = phoneArray.last, phoneArray.count > 1 else {
      return parsedNumber
    }

    return "\(parsedNumber) x\(lineExtension)"
    
  }

  private func filterNumber() -> String {
    return String(self.characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
  }
}
