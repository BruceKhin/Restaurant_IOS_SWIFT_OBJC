//
//  MenuItem.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/27/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

class MenuItem: NSObject {

    var name: String
    var ingredients: String
    var image: String
    var price: String
    var discount: String?
    
    init(name: String, ingredients: String, image: String, price: String, discount: String?) {
        self.name = name
        self.ingredients = ingredients
        self.image = image
        self.price = price
        self.discount = discount
    }
}
