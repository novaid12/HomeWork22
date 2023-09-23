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
        let feedB = feedback?[indexPath.row]
        cell.nameLbl.text = feedB?.name
        cell.ratingLbl.text = Int(feedB!.marker) == 0 ? mark : lol()
        func lol() -> String {
            var a = ""
            for _ in 0 ..< Int(feedB!.marker) {
                a += mark
            }
            return a
        }
        cell.textLbl.numberOfLines = 0
        cell.textLbl.text = feedB?.text

        return cell
    }
}
