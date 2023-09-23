//
//  DetailsVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

class DetailsVC: UIViewController {
    var index: Int?
    var deviceM: ModelDevices?

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var nameDevice: UILabel!
    @IBOutlet var imageDevice: UIImageView!
    @IBOutlet var priceDevice: UILabel!
    @IBOutlet var ratingDevice: UILabel!

    @IBOutlet var showReviewBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let index = index else { return }
        deviceM = DevicesData.shared.devices[index]
        updateUI(with: view.bounds.size)
        showReviewBtn.isEnabled = deviceM?.feedBacks.count != 0 ? true : false
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUI(with: size)
    }

    private func updateUI(with size: CGSize) {
        title = "Device details"
        guard let deviсeModel = deviceM else { return }
        imageDevice.image = deviсeModel.image
        nameDevice.text = deviсeModel.name
        ratingDevice.text = CalculateRating.funcRating(index: index!)
        priceDevice.text = deviсeModel.price.description + " BYN"
        showReviewBtn.setTitle("View (\(deviсeModel.feedBacks.count)) reviews", for: .normal)
        showReviewBtn.isEnabled = deviсeModel.feedBacks.count != 0
        imageDevice.layer.cornerRadius = 25
    }

    @IBAction func viewAllReviewsBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let reviewVC = storyboard.instantiateViewController(withIdentifier: "AllReviewsTVC") as? AllReviewsTVC else { return }
        reviewVC.feedback = deviceM?.feedBacks
        navigationController?.pushViewController(reviewVC, animated: true)
    }

    @IBAction func goToCreateReview(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let crVC = storyboard.instantiateViewController(withIdentifier: "CreateReviewVC") as? CreateReviewVC else { return }
        crVC.index = index
        crVC.deviceModel = deviceM
        navigationController?.pushViewController(crVC, animated: true)
    }
}
