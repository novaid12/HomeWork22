//
//  AllReviews.swift
//  HomeWork22
//
//  Created by  NovA on 23.09.23.
//

import UIKit

class AllReviewsTVC: UITableViewController {
    var feedback: [Feedback]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All reviews"
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedback!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsCell", for: indexPath) as! ReviewsCell
        let mark = "⭐️"
        cell.nameLbl.text = feedback?[indexPath.row].name
        for _ in 0 ..< Int(feedback![indexPath.row].mark) {
            cell.ratingLbl.text! += mark
        }
        cell.textLbl.numberOfLines = 0
        cell.textLbl.text = feedback?[indexPath.row].text

        return cell
    }

}
