//
//  funcRating.swift
//  HomeWork22
//
//  Created by  NovA on 23.09.23.
//

import UIKit

final class CalculateRating {
    static func funcRating(index: Int) -> String {
        let device = DevicesData.shared.devices[index]
        var rating = 0.0
        let mark = "⭐️"
        var countStars = ""
        if device.feedBacks.count != 0 {
            for i in 0 ..< device.feedBacks.count {
                rating += device.feedBacks[i].marker
            }
            rating = rating / Double(device.feedBacks.count)
            let r = lround(rating)
            for _ in 0 ..< r {
                countStars += mark
            }
        } else { return "There are no reviews here yet" }
        return countStars
    }
}
