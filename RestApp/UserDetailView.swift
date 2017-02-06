//
//  UserDetailView.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/5/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MapKit

class UserDetailView: UIView {
  let mapView: MKMapView = {
    let view = MKMapView()
    view.isUserInteractionEnabled = false
    return view
  }()

  private var userStatusLabel: UILabel = {
    let label = UILabel(numberOfLines: 1, textAlignment: .center)
    label.text = String.localizedString(key: .userInfo)
    return label
  }()

  private var addressInfoLabel: UILabel = {
    let label = UILabel(numberOfLines: 1, textAlignment: .center)
    label.text = String.localizedString(key: .addressInfo)
    return label
  }()

  private var companyStatusLabel: UILabel = {
    let label = UILabel(numberOfLines: 1, textAlignment: .center)
    label.text = String.localizedString(key: .companyInfo)
    return label
  }()

  private var usernameLabel = UILabel(numberOfLines: 1)
  private var phoneLabel = UILabel(numberOfLines: 1)
  private var websiteLabel = UILabel(numberOfLines: 1)
  private var emailLabel = UILabel(numberOfLines: 1)

  private var streetLabel = UILabel(numberOfLines: 1)
  private var suiteLabel = UILabel(numberOfLines: 1)
  private var cityLabel = UILabel(numberOfLines: 1)
  private var zipcodeLabel = UILabel(numberOfLines: 1)

  private var companyNameLabel = UILabel(numberOfLines: 1)
  private var companyBSLabel = UILabel(numberOfLines: 1)
  private var companyCatchPhraseLabel = UILabel(numberOfLines: 1)

  // MARK: - publicVars
  var username: String? {
    set {
      usernameLabel.text = newValue
    }
    get {
      return usernameLabel.text
    }
  }
  var phone: String? {
    set {
      phoneLabel.text = newValue?.phone()
    }
    get {
      return phoneLabel.text
    }
  }
  var website: String? {
    set {
      websiteLabel.text = newValue
    }
    get {
      return websiteLabel.text
    }
  }
  var email: String? {
    set {
      emailLabel.text = newValue
    }
    get {
      return emailLabel.text
    }
  }
  var street: String? {
    set {
      streetLabel.text = newValue
    }
    get {
      return streetLabel.text
    }
  }
  var suite: String? {
    set {
      suiteLabel.text = newValue
    }
    get {
      return suiteLabel.text
    }
  }
  var city: String? {
    set {
      cityLabel.text = newValue
    }
    get {
      return cityLabel.text
    }
  }
  var zipcode: String? {
    set {
      zipcodeLabel.text = newValue
    }
    get {
      return zipcodeLabel.text
    }
  }
  var companyName: String? {
    set {
      companyNameLabel.text = newValue
    }
    get {
      return companyNameLabel.text
    }
  }
  var companyBS: String? {
    set {
      companyBSLabel.text = newValue
    }
    get {
      return companyBSLabel.text
    }
  }
  var companyCatchPhrase: String? {
    set {
      companyCatchPhraseLabel.text = newValue
    }
    get {
      return companyCatchPhraseLabel.text
    }
  }
  var geo: GeoModel? {
    didSet {
      guard let geo = geo else { return }
      var region = MKCoordinateRegion()
      region.center.latitude = geo.latitude
      region.center.longitude = geo.longitude
      region.span.latitudeDelta = 2
      region.span.longitudeDelta = 2
      mapView.region = region
      let annotation = MKPointAnnotation()
      annotation.coordinate.latitude = geo.latitude
      annotation.coordinate.longitude = geo.longitude
      mapView.addAnnotation(annotation)
    }
  }

  var userModel: UserModel?

  // MARK: - View methods
  override func awakeFromNib() {
    super.awakeFromNib()
    prepareViews()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  // MARK: - private methods
  private func prepareViews() {
    prepareInfoViews()
    prepareAddressInfoViews()
    prepareCompanyInfoViews()
  }

  private func prepareInfoViews() {
    addSubview(userStatusLabel)
    addSubview(usernameLabel)
    addSubview(phoneLabel)
    addSubview(websiteLabel)
    addSubview(emailLabel)

    userStatusLabel.snp.makeConstraints { (make) -> Void in
      make.left.top.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    usernameLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(userStatusLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    phoneLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(usernameLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    websiteLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(phoneLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    emailLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(websiteLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
  }

  private func prepareAddressInfoViews() {
    addSubview(addressInfoLabel)
    addSubview(streetLabel)
    addSubview(suiteLabel)
    addSubview(cityLabel)
    addSubview(zipcodeLabel)
    addSubview(mapView)

    addressInfoLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(emailLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    streetLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(addressInfoLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    suiteLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(streetLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    cityLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(suiteLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    zipcodeLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(cityLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    mapView.snp.makeConstraints { (make) in
      make.top.equalTo(zipcodeLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.leading.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.trailing.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
      make.height.equalTo(StyleGuide.UserDetailView.mapHeight)
    }
  }

  private func prepareCompanyInfoViews() {
    addSubview(companyStatusLabel)
    addSubview(companyNameLabel)
    addSubview(companyBSLabel)
    addSubview(companyCatchPhraseLabel)
    companyStatusLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(mapView.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    companyNameLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(companyStatusLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    companyBSLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(companyNameLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
    companyCatchPhraseLabel.snp.makeConstraints { (make) -> Void in
      make.firstBaseline.equalTo(companyBSLabel.snp.lastBaseline).offset(StyleGuide.UserDetailView.labelDistance)
      make.left.equalToSuperview().offset(StyleGuide.UserDetailView.margin)
      make.right.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
      make.bottom.equalToSuperview().offset(-StyleGuide.UserDetailView.margin)
    }
  }
}
