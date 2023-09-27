//
//  CreateReviewVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

final class CreateReviewVC: UIViewController, UITextViewDelegate {
    var index: Int?
    var section: Int?
    var deviceModel: ModelDevices?

    @IBOutlet var centerYConstraint: NSLayoutConstraint!
    @IBOutlet var nameDevice: UILabel!
    @IBOutlet var imageDevice: UIImageView!
    @IBOutlet var priceDevice: UILabel!
    @IBOutlet var ratingDevice: UILabel!

    @IBOutlet var lbl: UILabel!
    @IBOutlet var saveDataBtn: UIButton!
    @IBOutlet var nameUser: UITextField!
    @IBOutlet var feedbackUser: UITextView!

    @IBOutlet var ratingUser: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackUser.delegate = self
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }

    func textViewDidChange(_ feedbckUser: UITextView) {
        let currentText = feedbckUser.text ?? ""
        let currentLength = currentText.count
        let boolean = currentLength > 20 ? false : true
        lbl.isHidden = !boolean
        saveDataBtn.isHidden = boolean
    }

    private func setupUI() {
        guard let deviсeM = deviceModel, let index = index, let section = section else { return }
        imageDevice.image = deviсeM.image
        nameDevice.text = deviсeM.name
        ratingDevice.text = CalculateRating.funcRating(index: index, section: section)
        priceDevice.text = deviсeM.price.description + " BYN"
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
        nameUser.layer.borderWidth = 1
        nameUser.layer.borderColor = CGColor(genericCMYKCyan: 1, magenta: 1, yellow: 1, black: 1, alpha: 1)
        nameUser.layer.cornerRadius = 5
        feedbackUser.layer.borderWidth = 1
        feedbackUser.layer.borderColor = CGColor(genericCMYKCyan: 1, magenta: 1, yellow: 1, black: 1, alpha: 1)
        feedbackUser.layer.cornerRadius = 5
        title = "Create review"
    }

    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        centerYConstraint.constant -= keyboardSize.height / 3
    }

    @objc private func keyboardWillHide(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        centerYConstraint.constant += keyboardSize.height / 3
    }

    @IBAction func saveData(_ sender: Any) {
        var name = ""
        if nameUser.text == "" {
            name = "Unknown"
        } else { name = nameUser.text! }
        let feedback = Feedback(name: name, text: feedbackUser.text, marker: Double(ratingUser.selectedSegmentIndex + 1))
        guard let deviceModel = deviceModel, let idFeedback = deviceModel.feedback else { return }
        guard var allReviews = DevicesData.shared.feedbacks[idFeedback] == nil ? [] : DevicesData.shared.feedbacks[idFeedback] else { return }
        allReviews.append(feedback)
        DevicesData.shared.feedbacks[idFeedback] = allReviews
        navigationController?.popViewController(animated: true)
    }
}
