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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return devices.count
//    }
    
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
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let device = devices[section] else { return nil }
//        let myView = UIView()
//        myView.backgroundColor = .whiteBlack
//        let label = UILabel(frame: CGRect(x: 20, y: 3, width: 300, height: 25))
//        label.text = device[section].category
//        label.textColor = .blackWhite
//        label.font = .boldSystemFont(ofSize: 25)
//        myView.addSubview(label)
//        return myView
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let detailVC = segue.destination as? DetailsVC else { return }
        detailVC.index = indexPath.row
    }
}
