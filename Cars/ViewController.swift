//
//  ViewController.swift
//  Cars
//
//  Created by Eric.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfBrand: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var scGasType: UISegmentedControl!
    @IBOutlet weak var ivCars: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveCar(_ sender: UIButton) {
        
        let car = Car(brand: tfBrand.text!, name: tfName.text!, price: Double(tfPrice.text!)!, gasType: GasType(rawValue: scGasType.selectedSegmentIndex)!)
        REST.saveCar(car) { (success:Bool) in
            print(success)
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            
        }
    
        
    }
}



