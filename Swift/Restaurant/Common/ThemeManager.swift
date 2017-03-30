//
//  ThemeManager.swift
//  Restaurant
//
//  Created by AppsFoundation on 7/29/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

private let NavigationBarFontSize = 18.0
private let NavigationBarFontName = "KozGoPro-Light"

class ThemeManager: NSObject {
    
    static let sharedManager = ThemeManager()
    
    private override init() {}

    func applyNavigationBarTheme() {
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: NavigationBarFontName, size: CGFloat(NavigationBarFontSize))!]
    }
}
