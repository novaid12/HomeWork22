//
//  DetailsVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

class DetailsVC: UIViewController {
    var index: Int?
    var section: Int?
    var deviceM: ModelDevices?

    @IBOutlet var mealStackView: UIStackView!
    @IBOutlet var nameDevice: UILabel!
    @IBOutlet var imageDevice: UIImageView!
    @IBOutlet var priceDevice: UILabel!
    @IBOutlet var ratingDevice: UILabel!

    @IBOutlet var showReviewBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let section = section,
              let index = index else { return }
        let category = DevicesData.shared.devices[section]
        let device = category?[index]
        deviceM = device
        updateUI(with: view.bounds.size)
//        hideKeyboardWhenTappedAround()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUI(with: size)
    }

    private func updateUI(with size: CGSize) {
        title = "Device details"
        let isVertival = size.width < size.height
        mealStackView.axis = isVertival ? .vertical : .horizontal
        guard let deviсeModel = deviceM else { return }
        imageDevice.image = deviсeModel.image
        nameDevice.text = deviсeModel.name
        ratingDevice.text = deviсeModel.rating
        priceDevice.text = deviсeModel.price.description + " BYN"
        showReviewBtn.setTitle("View (\(deviсeModel.feedBacks.count)) reviews", for: .normal)
        showReviewBtn.isEnabled = deviсeModel.feedBacks.count != 0
    }

//    private func startKeyboardObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc private func keyboardWillShow(notification: Notification) {
//        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
//        }
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
//        scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//    }
//
//    @objc private func keyboardWillHide() {
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
//        scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let crVC = segue.destination as? CreateReviewVC else { return }
        crVC.index = index
        crVC.section = section
        crVC.deviceModel = deviceM
    }
}
