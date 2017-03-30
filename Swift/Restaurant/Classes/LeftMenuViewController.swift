//
//  LeftMenuViewController.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/28/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

enum MenuItemType: Int {
    case OurItem = 0
    case Reservation
    case FindUs
    case Feedback
}

class LeftMenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView?
    
    var menuItems: [String] = []
    var menuItemsImages: [String] = []
    var selectedMenuItemIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        menuItems = ["OUR MENU","RESERVATION","FIND US","FEEDBACK"]
        menuItemsImages = ["our_menu","reservation","find_us","feedback"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource
extension LeftMenuViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        
        cell.selectedMenuImageView?.isHidden = selectedMenuItemIndex != indexPath.row
        cell.itemNameLabel?.text = menuItems[indexPath.row]
        cell.itemImageView?.image = UIImage(named: menuItemsImages[indexPath.row])
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
}

// MARK: - UITableViewDelegate
extension LeftMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMenuItemIndex = indexPath.row
        
        switch selectedMenuItemIndex {
        case MenuItemType.OurItem.rawValue:
            AppDelegate.sharedDelegate().openOurMenu()
            break
        case MenuItemType.Reservation.rawValue:
            AppDelegate.sharedDelegate().openReservation()
            break
        case MenuItemType.FindUs.rawValue:
            AppDelegate.sharedDelegate().openFindUs()
            break
        case MenuItemType.Feedback.rawValue:
            AppDelegate.sharedDelegate().openFeedback()
            break
        default:
            break
        }
        
        menuTableView?.reloadData()
    }
}
