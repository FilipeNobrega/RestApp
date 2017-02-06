//
//  LocalizedStrings.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/5/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation

enum LocalizedStringKey: String {
  case userList = "User List"
  case youGotEverything = "You've got everything"
  case userInfo = "User Info"
  case companyInfo = "Company Info"
  case addressInfo = "Address Info"
  case defaulError = "Something went wrong"
  case errorTitle = "Error"
  case tryAgain = "Try again"
  case cancel = "Cancel"
}

extension String {
  static func localizedString(key localizedStringKey: LocalizedStringKey) -> String {
    return NSLocalizedString(localizedStringKey.rawValue, comment: "")
  }
}
