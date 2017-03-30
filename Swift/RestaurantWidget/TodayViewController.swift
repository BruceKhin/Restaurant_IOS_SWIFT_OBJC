//
//  TodayViewController.swift
//  RestaurantWidget
//
//  Created by AppsFoundation on 23/09/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit
import NotificationCenter

let CellRatio: CGFloat = 0.57

class TodayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint?

    var menuItems: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = MenuItemsManager.sharedManager.loadData()
    }

}

// MARK: - UITableViewDataSource
extension TodayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell") as! MenuItemTableViewCell
        let item = menuItems[indexPath.row]
        
        cell.menuItemNameLabel?.text = item.name
        cell.ingredientsItemLabel?.text = item.ingredients
        cell.priceItemLabel?.text = item.price
        cell.menuItemImageView?.image = UIImage(named: item.image)
        
        if let discount = item.discount {
            cell.discountLabel?.text = discount
        } else {
            cell.discountLabel?.isHidden = true
        }
        
        return cell
    }
    
}

// MARK: - UITableViewDataSource
extension TodayViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableViewHeightConstraint!.constant += cell.bounds.size.height;
        self.tableView!.needsUpdateConstraints()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.width * CellRatio;
    }

}

// MARK: - NCWidgetProviding
extension TodayViewController: NCWidgetProviding {
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        var defaultMarginInsetsResult = defaultMarginInsets
        defaultMarginInsetsResult.right = defaultMarginInsets.left
        view.needsUpdateConstraints()
        tableView?.needsUpdateConstraints()
        return defaultMarginInsetsResult
    }

}
