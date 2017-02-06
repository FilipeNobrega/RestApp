//
//  UserDetailViewController.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/5/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
  @IBOutlet weak var detailView: UserDetailView!
  private var userModel: UserModel?

  func setUserModel(userModel: UserModel) {
    self.userModel = userModel
    navigationItem.title = userModel.name
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    updateDetailView()
  }

  private func updateDetailView() {
    guard let userModel = userModel else { return }
    detailView.username = userModel.username
    detailView.phone = userModel.phone
    detailView.website = userModel.website
    detailView.email = userModel.email

    let company = userModel.company
    detailView.companyName = company.name
    detailView.companyBS = company.bs
    detailView.companyCatchPhrase = company.catchPhrase

    let address = userModel.address
    detailView.street = address.street
    detailView.suite = address.suite
    detailView.city = address.city
    detailView.zipcode = address.zipcode

    let geo = address.geo
    detailView.geo = geo
  }
}
