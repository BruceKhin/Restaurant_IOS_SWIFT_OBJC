//
//  Feedback.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/27/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

class Feedback: NSObject {
    
    var name: String
    var text: String
    var numberOfStars: Int
    
    override init() {
        name = ""
        text = ""
        numberOfStars = 1
    }
    
    init(name: String, text: String, numberOfStars: Int) {
        self.name = name
        self.text = text
        self.numberOfStars = numberOfStars
    }
}
