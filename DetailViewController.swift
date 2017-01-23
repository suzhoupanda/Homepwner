//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Aleksander Makedonski on 1/23/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation

import UIKit

class DetailViewController: UIViewController{
    
    var item: Item!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var serialNumberField: UITextField!
    
    @IBOutlet weak var valueField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated as Date)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        item.name = nameField.text ?? " "
        item.serialNumber = serialNumberField.text
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText){
                item.valueInDollars = value.intValue
        }else {
            item.valueInDollars = 0
        }
    }
    

}

