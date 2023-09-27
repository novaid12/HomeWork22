//
//  AllReviews.swift
//  HomeWork22
//
//  Created by  NovA on 23.09.23.
//

import UIKit

final class AllReviewsTVC: UITableViewController {
    var feedback: [Feedback]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All reviews"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedback!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsCell", for: indexPath) as! ReviewsCell
        let mark = "⭐️"
        let feedBack = feedback?[indexPath.row]
        cell.nameLbl.text = feedBack?.name
        cell.ratingLbl.text = Int(feedBack!.marker) == 0 ? mark : addMark()
        func addMark() -> String {
            var a = ""
            for _ in 0 ..< Int(feedBack!.marker) {
                a += "⭐️"
            }
            return a
        }
        cell.textLbl.numberOfLines = 0
        cell.textLbl.text = feedBack?.text
        return cell
    }
}
