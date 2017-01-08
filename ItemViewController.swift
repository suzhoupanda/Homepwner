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
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        var itemsCheap = [Item]()
        var itemsExpensive = [Item]()
        var item: Item!
        
        for someItem in itemStore.allItems{
            if someItem.valueInDollars > 50{
                itemsCheap.append(someItem)
            }else{
                itemsExpensive.append(someItem)
            }
        }
        
        
        if indexPath.section == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
            item = itemsCheap[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "\(item.valueInDollars)"
            
        }else if indexPath.section == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
            item = itemsExpensive[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "\(item.valueInDollars)"
            
        }
        
    
        
       
        
        
        
        return cell
    }
}
