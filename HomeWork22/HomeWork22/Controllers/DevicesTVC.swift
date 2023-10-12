//
//  DevicesTVC.swift
//  HomeWork22
//
//  Created by  NovA on 22.09.23.
//

import UIKit

final class DevicesTVC: UITableViewController {
    var devices: [Int: [ModelDevices]] {
        DevicesData.shared.devices
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Apple Devices List"
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        devices.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices[section]!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DevicesCell", for: indexPath) as! DevicesCell
        guard let device = devices[indexPath.section] else { return cell }
        cell.nameDevice.text = device[indexPath.row].name
        cell.priceDevice.text = device[indexPath.row].price.description + " BYN"
        cell.ratingDevice.text = CalculateRating.funcRating(index: indexPath.row, section: indexPath.section)
        cell.imageDevice.image = device[indexPath.row].image
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let device = devices[section]
        return device![section].category
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let detailVC = segue.destination as? DetailsVC else { return }
        detailVC.index = indexPath.row
        detailVC.section = indexPath.section
    }
}
