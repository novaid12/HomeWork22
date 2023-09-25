//
//  CreateReviewVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

class CreateReviewVC: UIViewController, UITextViewDelegate {
    var index: Int?
    var deviceModel: ModelDevices?

    @IBOutlet var scrollView: UIScrollView!
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
        guard let deviсeM = deviceModel else { return }
        imageDevice.image = deviсeM.image
        nameDevice.text = deviсeM.name
        ratingDevice.text = CalculateRating.funcRating(index: index!)
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

    @IBAction func saveData(_ sender: Any) {
        var name = ""
        if nameUser.text == "" {
            name = "Unknown"
        } else { name = nameUser.text! }
        let feedback = Feedback(name: name, text: feedbackUser.text, marker: Double(ratingUser.selectedSegmentIndex + 1))
        DevicesData.shared.devices[index!].feedBacks.append(feedback)
        navigationController?.popViewController(animated: true)
    }
}
