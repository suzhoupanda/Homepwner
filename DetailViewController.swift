//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Aleksander Makedonski on 1/23/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    var item: Item!{
        didSet{
            navigationItem.title = item.name
        }
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
   
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var serialNumberField: UITextField!
    
    @IBOutlet weak var valueField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        
        
        present(imagePicker, animated: true, completion: nil)
     
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
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
        view.endEditing(animated)
        item.name = nameField.text ?? " "
        item.serialNumber = serialNumberField.text
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText){
                item.valueInDollars = value.intValue
        }else {
            item.valueInDollars = 0
        }
    }
    

}

