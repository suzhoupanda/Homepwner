//
//  ItemStore.swift
//  Homepwner
//
//  Created by Aleksander Makedonski on 1/8/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit

class ItemStore{
    var allItems = [Item]()
    
    func createItem()->Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
  
}
