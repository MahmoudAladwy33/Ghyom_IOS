//
//  locationManager.swift
//  Ghyom
//
//  Created by Al3dwy on 05/06/2026.
//

import Foundation
import CoreLocation
import Observation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    
    var location: CLLocationCoordinate2D?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var errorMessage: String?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.authorizationStatus = manager.authorizationStatus
    }
    
  
    func requestLocationPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
      
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            errorMessage = "Location access was denied. Please enable it in Settings."
        @unknown default:
            break
        }
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            self.location = lastLocation.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorMessage = error.localizedDescription
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.authorizationStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            manager.requestLocation()
        }
    }
}

extension CLLocationCoordinate2D: @retroactive Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
