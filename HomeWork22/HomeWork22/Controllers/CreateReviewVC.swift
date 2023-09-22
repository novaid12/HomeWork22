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
