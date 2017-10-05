//
//  CarsTableViewController.swift
//  Cars
//
//  Created by Eric.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {

    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func loadCars(){
        REST.loadCars { (cars:[Car]?) in
            if let cars = cars{
                self.cars = cars
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCars()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let car = cars[indexPath.row]
        
        cell.textLabel?.text = car.name
        cell.detailTextLabel?.text = "R$ \(car.price)"        
        
        return cell
    }

}





