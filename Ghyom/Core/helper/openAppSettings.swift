//
//  openAppSettings.swift
//  Ghyom
//
//  Created by Al3dwy on 05/06/2026.
//


import Foundation
import UIKit

 func openAppSettings() {
    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
    
    if UIApplication.shared.canOpenURL(settingsUrl) {
        UIApplication.shared.open(settingsUrl)
    }
}
