//
//  DevicesTVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

class DevicesTVC: UITableViewController {
    var devices: [ModelDevices] {
        DevicesData.shared.devices
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Apple Devices List"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6107875705, green: 0.5678505301, blue: 0.5201402903, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

//        navigationController?.navigationBar.tintColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return devices.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DevicesCell", for: indexPath) as! DevicesCell
        let device = devices[indexPath.section]
        cell.nameDevice.text = device.name
        cell.priceDevice.text = device.price.description + " BYN"
        cell.ratingDevice.text = CalculateRating.funcRating(index: indexPath.section)
        cell.imageDevice.image = device.image
        cell.imageDevice.layer.cornerRadius = 15
        cell.backgroundColor = #colorLiteral(red: 0.671189189, green: 0.6184870601, blue: 0.570966363, alpha: 1)
        cell.nameDevice.textColor = .white
        cell.priceDevice.textColor = .white
        cell.ratingDevice.textColor = .white
        return cell
    }

//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return " "
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let detailVC = segue.destination as? DetailsVC else { return }
        detailVC.index = indexPath.section
    }
}
