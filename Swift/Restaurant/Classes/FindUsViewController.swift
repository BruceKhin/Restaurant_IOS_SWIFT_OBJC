//
//  FindUsViewController.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/31/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit
import MapKit

class FindUsViewController: BaseViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView?
    @IBOutlet weak var locationLabel: UILabel?
    @IBOutlet weak var distanceLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func onPreviosLocation(_ sender: AnyObject) {
        print("Previous location")
        
        distanceLabel?.text = "2,5 Mi"
        locationLabel?.text = "21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200"
    }
    
    @IBAction func onNextLocation(_ sender: AnyObject) {
        print("Next location")
        
        locationLabel?.text = "21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200"
        distanceLabel?.text = "2,5 Mi"
    }
    
    @IBAction func onMakeReservation(_ sender: AnyObject) {
        let alert = UIAlertView(title: "Thank You", message: "You have booked table. Thanks for your reservation.", delegate: nil, cancelButtonTitle: "Ok")
        alert.show()
    }
}
