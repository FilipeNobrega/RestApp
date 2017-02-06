//
//  UILabel+Initializers.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/5/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
  convenience init(numberOfLines: Int, textAlignment: NSTextAlignment = .left) {
    self.init()
    self.textAlignment = textAlignment
    self.numberOfLines = numberOfLines
  }
}
