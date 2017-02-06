//
//  MainViewController.swift
//  RestApp
//
//  Created by Filipe Nobrega on 2/4/17.
//  Copyright © 2017 Filipe Nobrega. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {

  @IBOutlet weak var tableIndicatorView: TableLoadingIndicatorView!
  @IBOutlet weak var tableView: UITableView!

  let userList = Variable([UserModel]())
  let currentPage = Variable(1)
  let disposeBag = DisposeBag()
  var isLoading = true
  var isApiEmpty = false

  // MARK: - ViewController methods
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = String.localizedString(key: .userList)

    prepareRxTableView()
    loadUsers()
  }

  // MARK: - private view methods
  private func loadUsers() {
    currentPage.asObservable().subscribe(onNext: { [weak self] (nextPage: Int) in
      UserService.requestUsers(forPageIndex: nextPage) { (userModels: [UserModel]?, error: Error?) in
        guard let strongSelf = self else { return }
        guard let userModels = userModels else {
          self?.showAlertView(withError: error)
          return
        }
        strongSelf.isApiEmpty = userModels.isEmpty
        if strongSelf.isApiEmpty {
          strongSelf.tableIndicatorView.displayNoMoreCellsToDisplay()
        }
        strongSelf.userList.value.append(contentsOf: userModels)
        strongSelf.isLoading = false
      }
    }).disposed(by: disposeBag)
  }

  private func showAlertView(withError error: Error?) {
    let errorMessage = error?.localizedDescription ?? String.localizedString(key: .defaulError)
    let alert = UIAlertController(title: String.localizedString(key: .errorTitle),
                                  message: errorMessage,
                                  preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: String.localizedString(key: .tryAgain),
                                  style: .default,
                                  handler: { [weak self] _ in
                                    guard let value = self?.currentPage.value else {
                                      return
                                    }
                                    self?.currentPage.value = value
    }))

    alert.addAction(UIAlertAction(title: String.localizedString(key: .cancel),
                                  style: .default,
                                  handler: nil))

    present(alert, animated: true, completion: nil)
  }

  private func prepareRxTableView() {
    tableView
      .rx.setDelegate(self)
      .addDisposableTo(disposeBag)

    userList.asObservable()
      .bindTo(tableView.rx.items(cellIdentifier: "userCell", cellType: UserTableViewCell.self)) { [weak self] (row, element, cell) in
        guard let strongSelf = self else { return }
        cell.setup(withUserModel: element)
        if row >= strongSelf.userList.value.count - 3 &&
          !strongSelf.isLoading &&
          !strongSelf.isApiEmpty {
          strongSelf.isLoading = true
          strongSelf.currentPage.value += 1
          strongSelf.tableIndicatorView.startLoadingAnimator()
        }
      }
      .disposed(by: disposeBag)

    tableView
      .rx.itemSelected
      .subscribe(onNext: { [weak self] (indexPath: IndexPath) in
        guard let strongSelf = self else { return }
        let row = indexPath.row
        guard strongSelf.userList.value.count > row else { return }
        strongSelf.performSegue(withIdentifier: "segueUserDetailScreen", sender: strongSelf.userList.value[row])
      })
      .addDisposableTo(disposeBag)
  }

  // MARK: - Navigation methods
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueUserDetailScreen" {
      guard let userDetailViewController = segue.destination as? UserDetailViewController else { return }
      guard let userModel = sender as? UserModel else { return }
      userDetailViewController.setUserModel(userModel: userModel)
    }
  }
}

// MARK: - UITableViewDelegate extension
extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.selectionStyle = .none
  }

  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    return .none
  }
}
