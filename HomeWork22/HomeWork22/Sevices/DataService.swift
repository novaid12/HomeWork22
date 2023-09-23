//
//  DataService.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

class DevicesData {
    static let shared = DevicesData()

    var devices: [ModelDevices]

    private init() {
        devices = [ModelDevices(category: "iPhone", name: "Apple iPhone 15 Pro Max (Titanium)", price: 7999, image: #imageLiteral(resourceName: "iPhone15ProMax"),
                                feedBacks: [Feedback(name: "Сергей", text: "Хороший телефон! Как всегда ничего нового! Стоит, как крыло самолета! Лучший продукт на рынке!!!!", mark: 4.0),
                                            Feedback(name: "Александр", text: "Сяоми лучше намного! Переоцененная фигня!!!", mark: 2.0)]),
                   ModelDevices(category: "iPhone", name: "Apple iPhone 15 Pro (Titanium blue)", price: 6999, image: #imageLiteral(resourceName: "iPhone15Pro")),
                   ModelDevices(category: "iPhone", name: "Apple iPhone 15 (Blue)", price: 5999, image: #imageLiteral(resourceName: "Iphone15")),
                   ModelDevices(category: "iPhone", name: "Apple iPhone 12 Pro Max (Silver)", price: 7999, image: #imageLiteral(resourceName: "iPhone12ProMax")),

                   ModelDevices(category: "Macbook", name: "Apple Macbook Pro 16", price: 13999, image: #imageLiteral(resourceName: "MacBookPro16")),
                   ModelDevices(category: "Macbook", name: "Apple Macbook Pro 14", price: 11999, image: #imageLiteral(resourceName: "MacBookPro16")),
                   ModelDevices(category: "Macbook", name: "Apple Macbook Air 15", price: 6999, image: #imageLiteral(resourceName: "MacbookAir15")),
                   ModelDevices(category: "Macbook", name: "Apple Macbook Air 13", price: 3999, image: #imageLiteral(resourceName: "MacbookAir13")),

                   ModelDevices(category: "iPad", name: "Apple iPad Pro 12.9", price: 7999, image: #imageLiteral(resourceName: "iPadPro13")),
                   ModelDevices(category: "iPad", name: "Apple iPad Air ", price: 5999, image: #imageLiteral(resourceName: "iPadAir")),
                   ModelDevices(category: "iPad", name: "Apple iPad Mini", price: 2999, image: #imageLiteral(resourceName: "iPadMini")),
                   ModelDevices(category: "iPad", name: "Apple iPad 10.2", price: 1999, image: #imageLiteral(resourceName: "iPad2021"))]
    }
}
