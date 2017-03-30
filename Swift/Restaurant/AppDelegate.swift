//
//  AppDelegate.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/27/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

let secondsInMinute = 60.0

enum RateApp: Int {
    case Declined = 0
    case Confirmed
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Remove comments to add Flurry Analytics more information here - www.flurry.com
        // let flurrySessionId = ConfigurationManager.sharedManager.flurrySessionId
        // Flurry.startSession(flurrySessionId)
        
        initAppiRater()
        
        //init rate timer
        initRateAppTimer()
        
        ThemeManager.sharedManager.applyNavigationBarTheme()
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: false)
        
        return true
    }
    
    class func sharedDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func showAppRate() {
        let didShowAppRate = UserDefaults.standard.value(forKey: "showedAppRate") as? Bool
        if didShowAppRate != true {
            rateApp()
            UserDefaults.standard.set(true, forKey: "showedAppRate")
            UserDefaults.standard.synchronize()
        }
    }
    
    // MARK: - Actions
    func openOurMenu() {
        openControllerWithIndentifier(identifier: "ourMenuNavController")
    }
    
    func openReservation() {
        openControllerWithIndentifier(identifier: "reservationNavController")
    }
    
    func openFindUs() {
        openControllerWithIndentifier(identifier: "findUsNavController")
    }
    
    func openFeedback() {
        openControllerWithIndentifier(identifier: "feedbackNavController")
    }
    
    // MARK: - Private Methods
    private func openControllerWithIndentifier(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)
        let rootController = window?.rootViewController as! MSSlidingPanelController
        
        rootController.centerViewController = controller
        rootController.closePanel()
    }
    
    private func initAppiRater() {
        Appirater.appLaunched(true)
        Appirater.setAppId(ConfigurationManager.sharedManager.appId)
        Appirater.setOpenInAppStore(true)
    }
    
    private func initRateAppTimer() {
        let didShowAppRate = UserDefaults.standard.value(forKey: "showedAppRate") as? Bool
        if didShowAppRate != true {
            let showRateDelay = TimeInterval(Double(ConfigurationManager.sharedManager.rateAppDelay)! * secondsInMinute)
            Timer.scheduledTimer(timeInterval: showRateDelay, target: self, selector: #selector(AppDelegate.showAppRate), userInfo: nil, repeats: false)
        }
    }
    
    private func rateApp() {
        let alertController = UIAlertController(title: "Rate the App", message: "Do you like this app?", preferredStyle: UIAlertControllerStyle.alert)
        
        //Create action for "No"
        let noAction: UIAlertAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) { action -> Void in }
        alertController.addAction(noAction)
        
        //Create action for "Yes"
        let yesAction: UIAlertAction = UIAlertAction(title: "Yes", style: .default) { action -> Void in
            Appirater.rateApp()
        }
        alertController.addAction(yesAction)
        
        window?.rootViewController!.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UIAlertViewDelegate
extension AppDelegate: UIAlertViewDelegate {
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if alertView.title == "Rate the App" {
            switch buttonIndex {
            case RateApp.Declined.rawValue:
                break
            case RateApp.Confirmed.rawValue:
                Appirater.rateApp()
                break
            default:
                break
            }
        }
    }
}

