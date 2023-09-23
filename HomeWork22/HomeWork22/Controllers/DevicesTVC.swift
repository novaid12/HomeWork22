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
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        devices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DevicesCell", for: indexPath) as! DevicesCell
        let device = devices[indexPath.row]
        cell.nameDevice.text = device.name
        cell.priceDevice.text = device.price.description + " BYN"
        cell.ratingDevice.text = CalculateRating.funcRating(index: indexPath.row)
        cell.imageDevice.image = devices[indexPath.row].image
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let detailVC = segue.destination as? DetailsVC else { return }
        detailVC.index = indexPath.row
    }
}
