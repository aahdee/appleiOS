//
//  ItemsManager.swift
//  scavenger hunt
//
//  Created by Apple on 3/26/16.
//  Copyright © 2016 Aren. All rights reserved.
//

import UIKit

class ItemsManager {
    var itemsList = [ScavengerHuntItem]()
    
    func archivePath() -> String?{
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first{
            return documentsPath + "/ScavengetHuntItems"
        }
        assertionFailure("Could not determine where to store the file")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath(){
            if NSKeyedArchiver.archiveRootObject(itemsList, toFile: theArchivePath) {
                print("Saved sucessfully")
            } else{
                assertionFailure("Could nto save the data to \(theArchivePath)")
            }
        }
    }
    
    init(){
        if let theArchivePath = archivePath(){
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath){
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
        
    }
}