//
//  NumberOfGuestsTableViewCell.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/27/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

private let defaultNumberOfGuests = 4
private let minimumGuestsNumber = 1

class NumberOfGuestsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberOfGuestsLabel: UILabel?
    @IBOutlet weak var titleLabel: UILabel?
    
    var numberOfGuests: Int = defaultNumberOfGuests
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateNumberOfGuestsLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Actions
    @IBAction func decreaseGuestsNumber(_ sender: AnyObject) {
        print("Decrease number of guests")
        if numberOfGuests > minimumGuestsNumber {
            numberOfGuests -= 1
            updateNumberOfGuestsLabel()
        }
    }
    
    @IBAction func increaseGuestsNumber(_ sender: AnyObject) {
        print("Increase number of guests")
        numberOfGuests += 1
        updateNumberOfGuestsLabel()
    }
    
    // MARK: - Private Methods
    private func updateNumberOfGuestsLabel() {
        numberOfGuestsLabel?.text = String(numberOfGuests)
    }
}
