//
//  ViewController.swift
//  AgeCalculator
//
//  Created by diego.rios on 18/01/19.
//  Copyright © 2019 diego.rios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnCalculateHandler(_ sender: UIButton){
        let birthDate = self.datePicker.date
        let today = Date()
        if birthDate >= today {
            let alertView = UIAlertController(title: "Error", message: "Please enter a valid date", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertView.addAction(action)
            self.present(alertView, animated: false, completion: nil)
            return
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        let ageYears = components.year
        let ageMonths = components.month
        let ageDays = components.day
        
        self.lblAge.text = "\(ageYears!) years, \(ageMonths!) months, \(ageDays!) days"
    }

}

