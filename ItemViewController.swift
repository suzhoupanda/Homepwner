//
//  ItemViewController.swift
//  Homepwner
//
//  Created by Aleksander Makedonski on 1/8/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController{
    
    var itemStore: ItemStore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //TODO1: Make it so that the last row of UITableView always has the text no more items!. Make sure
    //this row appears regardless of the number of items in the row (including 0 items)
    
    //TODO2: Make each row's height 60 points, except for the last row which displays "No more items!," which should remain 44 points; then change the font size of every row except the last to 20 poitns; finally, make the background of UITableView display an image, make sure to include 1x images for non-Retina displays, 2x images for Retina displays, and 3x images for iPhone 6S
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
    
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.valueInDollars)"
        
        return cell
    }
}
