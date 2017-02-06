//
//  TableLoadingIndicatorView.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/5/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import Foundation
import UIKit

class TableLoadingIndicatorView: UIView {
  private var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.activityIndicatorViewStyle = .gray
    return activityIndicator
  }()

  private var noMoreContentLabel: UILabel = {
    let label = UILabel(numberOfLines: 1)
    label.text = String.localizedString(key: .youGotEverything)
    label.textColor = UIColor.lightGray
    return label
  }()

  // MARK: - view methods
  override func awakeFromNib() {
    super.awakeFromNib()
    prepareViews()
  }

  // MARK: - private methods
  private func prepareViews() {
    addSubview(activityIndicator)
    activityIndicator.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
    addSubview(noMoreContentLabel)
    noMoreContentLabel.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }

    activityIndicator.isHidden = true
    noMoreContentLabel.isHidden = true
  }

  // MARK: - public methods
  func startLoadingAnimator() {
    activityIndicator.startAnimating()
    activityIndicator.isHidden = false
    noMoreContentLabel.isHidden = true
  }

  func displayNoMoreCellsToDisplay() {
    activityIndicator.stopAnimating()
    activityIndicator.isHidden = true
    noMoreContentLabel.isHidden = false

  }
}
