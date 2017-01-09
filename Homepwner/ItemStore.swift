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
    
    func removeItem(item: Item){
        if let index = allItems.index(of: item){
            allItems.remove(at: index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
        
    }
    
    func createItem()->Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
  
}
