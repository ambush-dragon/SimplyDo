//
//  IconPickerViewController.swift
//  SimplyDo
//
//  Created by Paul Prestwood on 7/30/15.
//  Copyright (c) 2015 Paul Prestwood. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController, didPickIcon iconName: String)
}

class IconPickerViewController:UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell") as UITableViewCell!
        
        let iconName = icons[(indexPath as NSIndexPath).row]
        cell?.textLabel!.text = iconName
        cell?.imageView!.image = UIImage(named: iconName)
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let iconName = icons[(indexPath as NSIndexPath).row]
            delegate.iconPicker(self, didPickIcon: iconName)
        }
    }
}
