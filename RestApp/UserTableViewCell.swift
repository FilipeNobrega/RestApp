//
//  UserTableViewCell.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/5/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {
  
  private var nameLabel = UILabel(numberOfLines: 1)
  private var phoneLabel = UILabel(numberOfLines: 1)
  private var websiteLabel = UILabel(numberOfLines: 1)
  private var emailLabel = UILabel(numberOfLines: 1)
  private var companyNameLabel = UILabel(numberOfLines: 1)

  private var name: String? {
    set {
      guard let newValue = newValue else { return }
      nameLabel.text = "👤 \(newValue)"
    }
    get {
      return nameLabel.text
    }
  }
  private var phone: String? {
    set {
      guard let newValue = newValue else { return }
      phoneLabel.text = "☎️ \(newValue.phone())"
    }
    get {
      return phoneLabel.text
    }
  }
  private var website: String? {
    set {
      guard let newValue = newValue else { return }
      websiteLabel.text = "🌐 \(newValue)"
    }
    get {
      return websiteLabel.text
    }
  }
  private var email: String? {
    set {
      guard let newValue = newValue else { return }
      emailLabel.text = "✉️ \(newValue)"
    }
    get {
      return emailLabel.text
    }
  }
  private var companyName: String? {
    set {
      guard let newValue = newValue else { return }
      companyNameLabel.text = "🏢 \(newValue)"
    }
    get {
      return companyNameLabel.text
    }
  }

  // MARK: - View methods
  override func prepareForReuse() {
   nameLabel.text = ""
   phoneLabel.text = ""
   websiteLabel.text = ""
   emailLabel.text = ""
   companyNameLabel.text = ""
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    prepareView()
  }

  // MARK: - public methods
  func setup(withUserModel userModel: UserModel) {
    name = userModel.name
    phone = userModel.phone
    website = userModel.website
    email = userModel.email
    companyName = userModel.company.name
  }

  // MARK: - private methods
  private func prepareView() {
    addSubview(nameLabel)
    addSubview(phoneLabel)
    addSubview(websiteLabel)
    addSubview(emailLabel)
    addSubview(companyNameLabel)

    nameLabel.snp.makeConstraints { (make) -> Void in
      make.left.top.equalTo(StyleGuide.UserTableViewCell.margin)
      make.right.lessThanOrEqualToSuperview().offset(-StyleGuide.UserTableViewCell.margin)
    }
    phoneLabel.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(nameLabel)
      make.firstBaseline.equalTo(nameLabel.snp.lastBaseline).offset(StyleGuide.UserTableViewCell.labelDistance)
      make.right.lessThanOrEqualToSuperview().offset(-StyleGuide.UserTableViewCell.margin)
    }
    websiteLabel.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(nameLabel)
      make.firstBaseline.equalTo(phoneLabel.snp.lastBaseline).offset(StyleGuide.UserTableViewCell.labelDistance)
      make.right.lessThanOrEqualToSuperview().offset(-StyleGuide.UserTableViewCell.margin)
    }
    emailLabel.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(nameLabel)
      make.firstBaseline.equalTo(websiteLabel.snp.lastBaseline).offset(StyleGuide.UserTableViewCell.labelDistance)
      make.right.lessThanOrEqualToSuperview().offset(-StyleGuide.UserTableViewCell.margin)
    }
    companyNameLabel.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(nameLabel)
      make.firstBaseline.equalTo(emailLabel.snp.lastBaseline).offset(StyleGuide.UserTableViewCell.labelDistance)
      make.right.lessThanOrEqualToSuperview().offset(-StyleGuide.UserTableViewCell.margin)
    }
  }
}
