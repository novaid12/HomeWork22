//
//  funcRating.swift
//  HomeWork22
//
//  Created by  NovA on 23.09.23.
//

import UIKit

final class CalculateRating {
    static func funcRating(index: Int, section: Int) -> String {
        guard let devices = DevicesData.shared.devices[section],
              let idFeedbacks = devices[index].feedback else { return "There are no reviews here yet" }
        
        var rating = 0.0
        var countStars = ""
        if let feedbacks = DevicesData.shared.feedbacks[idFeedbacks], feedbacks.count != 0 {
            for i in 0 ..< feedbacks.count {
                rating += feedbacks[i].marker
            }
            rating = rating / Double(feedbacks.count)
            let r = lround(rating)
            for _ in 1 ... r {
                countStars += "⭐️"
            }
        } else {
            return "There are no reviews here yet"
        }
        return countStars
    }
}
