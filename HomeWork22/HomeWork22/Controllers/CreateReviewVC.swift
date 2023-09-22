//
//  CreateReviewVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

class CreateReviewVC: UIViewController {
    var index: Int?
    var section: Int?
    var deviceModel: ModelDevices?

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var nameDevice: UILabel!
    @IBOutlet var imageDevice: UIImageView!
    @IBOutlet var priceDevice: UILabel!
    @IBOutlet var ratingDevice: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        guard let deviсeM = deviceModel else { return }
        imageDevice.image = deviсeM.image
        nameDevice.text = deviсeM.name
        ratingDevice.text = deviсeM.rating
        priceDevice.text = deviсeM.price.description + " BYN"
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
        navigationController?.navigationBar.isHidden = true
    }

    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
