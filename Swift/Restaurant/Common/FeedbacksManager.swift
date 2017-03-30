//
//  FeedbacksManager.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/27/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

class FeedbacksManager: NSObject {
    
    static let sharedManager = FeedbacksManager()
    
    private override init() {}
    
    // MARK: - Public Methods
    func loadData() -> [Feedback] {
        let path = Bundle.main.path(forResource: "Feedbacks", ofType: "plist")
        if let dataArray = NSArray(contentsOfFile: path!) {
            return constructFeedbackItemsFromArray(array: dataArray)
        } else {
            return [Feedback]()
        }
    }
    
    // MARK: - Private Methods
    private func constructFeedbackItemsFromArray(array: NSArray) -> [Feedback] {
        var resultItems = [Feedback]()
        
        for object in array {
            let obj = object as! NSDictionary
            let name = obj["name"] as! String
            let text = obj["text"] as! String
            let numberOfStars = obj["numberOfStars"] as! Int
            
            let loadedFeedback = Feedback(name: name, text: text, numberOfStars: numberOfStars)
            resultItems.append(loadedFeedback)
        }
        return resultItems
    }
}
