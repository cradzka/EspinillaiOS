//
//  LocationManager.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/25/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate {

    var collectionView: UICollectionView!
    
    let alert = UIAlertController(title: "Alert", message: "Location services were previously denied. Please enable location services for this app in Settings.", preferredStyle: UIAlertControllerStyle.alert)
    var locationManager: CLLocationManager = CLLocationManager()
    var west = CLCircularRegion.init(center: CLLocationCoordinate2DMake(34.065078, -106.906145), radius: 20, identifier: "West")
    var cramer = CLCircularRegion.init(center: CLLocationCoordinate2DMake(34.066968, -106.905103), radius: 20, identifier: "Cramer")
    
    init(collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        self.locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus")
        
        switch status {
        case .notDetermined:
            print(".NotDetermined")
            break
            
        case .authorized:
            print(".Authorized")
            self.locationManager.startMonitoring(for: west)
            self.locationManager.startMonitoring(for: cramer)
            self.locationManager.startUpdatingLocation()
            break
            
        case .denied:
            self.alert.present(alert, animated: true, completion: nil)
            break
            
        default:
            print("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region.identifier == "West" {
            let cell = self.collectionView?.cellForItem(at: IndexPath(row: 0, section: 0)) as! BuildingViewTileCell as BuildingViewTileCell
            cell.roundSwipeBar.image = #imageLiteral(resourceName: "inRangeImage")
            cell.swipeBarLabel.text = "Begin Rounds"
        }
        else if region.identifier == "Cramer" {
            let cell = self.collectionView?.cellForItem(at: IndexPath(row: 3, section: 0)) as! BuildingViewTileCell
            cell.roundSwipeBar.image = #imageLiteral(resourceName: "inRangeImage")
            cell.swipeBarLabel.text = "Begin Rounds"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region.identifier == "West" {
            let cell = self.collectionView?.cellForItem(at: IndexPath(row: 0, section: 0)) as! BuildingViewTileCell
            cell.roundSwipeBar.image = #imageLiteral(resourceName: "outOfRangeImage")
            cell.swipeBarLabel.text = "Out Of Range"
        }
        else if region.identifier == "Cramer" {
            let cell = self.collectionView?.cellForItem(at: IndexPath(row: 3, section: 0)) as! BuildingViewTileCell
            cell.roundSwipeBar.image = #imageLiteral(resourceName: "outOfRangeImage")
            cell.swipeBarLabel.text = "Out Of Range"
        }
    }

}
