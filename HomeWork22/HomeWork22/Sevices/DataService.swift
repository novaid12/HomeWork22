//
//  DataService.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

final class DevicesData {
    static let shared = DevicesData()

    var devices = [Int: [ModelDevices]]()

    var feedbacks = [String: [Feedback]]()

    private init() {
        devices[0] = [ModelDevices(category: "iPhone", name: "Apple iPhone 15 Pro Max (Titanium)", price: 7999, image: #imageLiteral(resourceName: "iPhone15ProMax"), feedback: "id321"),
                      ModelDevices(category: "iPhone", name: "Apple iPhone 15 Pro (Titanium blue)", price: 6999, image: #imageLiteral(resourceName: "iPhone15Pro"), feedback: "id\(Int.random(in: 100 ... 999))"),
                      ModelDevices(category: "iPhone", name: "Apple iPhone 15 (Blue)", price: 5999, image: #imageLiteral(resourceName: "Iphone15"), feedback: "id\(Int.random(in: 100 ... 999))"),
                      ModelDevices(category: "iPhone", name: "Apple iPhone 12 Pro Max (Silver)", price: 7999, image: #imageLiteral(resourceName: "iPhone12ProMax"), feedback: "id\(Int.random(in: 100 ... 999))")]

        devices[1] = [ModelDevices(category: "Macbook", name: "Apple Macbook Pro 16", price: 13999, image: #imageLiteral(resourceName: "MacBookPro16"), feedback: "id231"),

                      ModelDevices(category: "Macbook", name: "Apple Macbook Pro 14", price: 11999, image: #imageLiteral(resourceName: "MacBookPro16"), feedback: "id\(Int.random(in: 100 ... 999))"),
                      ModelDevices(category: "Macbook", name: "Apple Macbook Air 15", price: 6999, image: #imageLiteral(resourceName: "MacbookAir15"), feedback: "id\(Int.random(in: 100 ... 999))"),
                      ModelDevices(category: "Macbook", name: "Apple Macbook Air 13", price: 3999, image: #imageLiteral(resourceName: "MacbookAir13"), feedback: "id\(Int.random(in: 100 ... 999))")]

        devices[2] = [ModelDevices(category: "iPad", name: "Apple iPad Pro 12.9", price: 7999, image: #imageLiteral(resourceName: "iPadPro13"), feedback: "id\(Int.random(in: 100 ... 999))"),
                      ModelDevices(category: "iPad", name: "Apple iPad Air ", price: 5999, image: #imageLiteral(resourceName: "iPadAir"), feedback: "id\(Int.random(in: 100 ... 999))"),
                      ModelDevices(category: "iPad", name: "Apple iPad Mini", price: 2999, image: #imageLiteral(resourceName: "iPadMini"), feedback: "id\(Int.random(in: 100 ... 999))"),
                      ModelDevices(category: "iPad", name: "Apple iPad 10.2", price: 1999, image: #imageLiteral(resourceName: "iPad2021"), feedback: "id\(Int.random(in: 100 ... 999))")]

        feedbacks["id321"] = [Feedback(name: "Сергей", text: "Хороший телефон! Как всегда ничего нового! Стоит, как крыло самолета! Лучший продукт на рынке!!!!", marker: 4.0),
                              Feedback(name: "Александр", text: "Сяоми лучше намного! Переоцененная фигня!!!", marker: 2.0)]

        feedbacks["id231"] = [Feedback(name: "Евгений", text: "Отличный компьютер! Прекрасно подходит для работы!!!", marker: 5.0)]
    }
}
