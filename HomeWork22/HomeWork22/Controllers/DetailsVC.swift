//
//  DetailsVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

final class DetailsVC: UIViewController {
    var index: Int?
    var section: Int?
    var deviceM: ModelDevices?

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var nameDevice: UILabel!
    @IBOutlet var imageDevice: UIImageView!
    @IBOutlet var priceDevice: UILabel!
    @IBOutlet var ratingDevice: UILabel!

    @IBOutlet var showReviewBtn: UIButton!
    @IBOutlet var createReview: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let section = section, let index = index, let devices = DevicesData.shared.devices[section] else { return }
        deviceM = devices[index]
        updateUI()
    }

    private func updateUI() {
        title = "Device details"
        guard let deviсeModel = deviceM,
              let index = index,
              let section = section else { return }
        imageDevice.image = deviсeModel.image
        nameDevice.text = deviсeModel.name
        guard let idFeedback = deviсeModel.feedback else { return }
        ratingDevice.text = CalculateRating.funcRating(index: index, section: section)
        let count = DevicesData.shared.feedbacks[idFeedback]?.count == nil ? 0 : DevicesData.shared.feedbacks[idFeedback]?.count
        showReviewBtn.setTitle("View (\(count!)) reviews", for: .normal)
        showReviewBtn.isEnabled = count != 0
        showReviewBtn.isEnabled = count != 0 ? true : false
        priceDevice.text = deviсeModel.price.description + " BYN"
    }

    @IBAction func viewAllReviewsBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let reviewVC = storyboard.instantiateViewController(withIdentifier: "AllReviewsTVC") as? AllReviewsTVC else { return }
        reviewVC.feedback = DevicesData.shared.feedbacks[(deviceM?.feedback)!]
        navigationController?.pushViewController(reviewVC, animated: true)
    }

    @IBAction func goToCreateReview(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let crVC = storyboard.instantiateViewController(withIdentifier: "CreateReviewVC") as? CreateReviewVC else { return }
        crVC.index = index
        crVC.section = section
        crVC.deviceModel = deviceM
        navigationController?.pushViewController(crVC, animated: true)
    }
}
