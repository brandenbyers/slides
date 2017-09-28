//
//  TestHelper.swift
//  testerUITests
//
//  Created by Branden Byers on 9/28/17.
//  Copyright © 2017 brandenbyers. All rights reserved.
//

import XCTest

extension XCTestCase {
    /// Turn on/off wifi on a physical device.
    ///     Only works with physical devices.
    ///
    /// - Parameter toggleOn: Toggle conditioner on; defaults to false
    func toggleWifi(_ toggleOn: Bool = false) {
        XCTContext.runActivity(named: "Test under network link conditioning", block: {_ in
            let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
            let wifiStaticText = settingsApp.tables.staticTexts["Wi-Fi"]
            let wifiSwitch = settingsApp.tables.switches["Wi-Fi"]
            let settingsNavButton = settingsApp.navigationBars.buttons["Settings"]
            let developerNavButton = settingsApp.navigationBars["Network Link Conditioner"].buttons["Developer"]
            
            settingsApp.activate()
            if (developerNavButton.exists && developerNavButton.isHittable) {
                developerNavButton.tap()
            }
            if (settingsNavButton.exists && settingsNavButton.isHittable) {
                settingsNavButton.tap()
            }
            wifiStaticText.tap()
            if (Int(wifiSwitch.value as! String) == 0 && toggleOn == true) {
                wifiSwitch.tap()
            }
            else if (Int(wifiSwitch.value as! String) == 1 && toggleOn == false) {
                wifiSwitch.tap()
            }
            settingsNavButton.tap()
        })
    }
    
    
    /// Turn on/off the Network Link Conditioner on a physical device.
    ///     Only works with physical devices.
    ///
    /// - Parameter network: 3G, Edge, High Latency DNS, LTE, or Very Bad Connection
    /// - Parameter toggleOn: Toggle conditioner on; defaults to true
    func conditionNetwork(_ network: String = "3G", toggleOn: Bool = true) {
        XCTContext.runActivity(named: "Test under network link conditioning", block: {_ in
            let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
            let developerStaticText = settingsApp.tables.staticTexts["Developer"]
            let statusStaticText = settingsApp.tables.staticTexts["Status"]
            let networkLinkConditionerStaticText = settingsApp.tables.staticTexts["Network Link Conditioner"]
            let enableSwitch = settingsApp.tables.switches["Enable"]
            let settingsNavButton = settingsApp.navigationBars.buttons["Settings"]
            let developerNavButton = settingsApp.navigationBars["Network Link Conditioner"].buttons["Developer"]
            
            settingsApp.activate()
            if (developerNavButton.exists && developerNavButton.isHittable) {
                developerNavButton.tap()
            }
            if (settingsNavButton.exists && settingsNavButton.isHittable) {
                settingsNavButton.tap()
            }
            developerStaticText.tap()
            networkLinkConditionerStaticText.exists ? networkLinkConditionerStaticText.tap() : statusStaticText.tap()
            if (Int(enableSwitch.value as! String) == 0 && toggleOn == true) {
                enableSwitch.tap()
                settingsApp.tables.staticTexts[network].tap()
            }
            else if (Int(enableSwitch.value as! String) == 1 && toggleOn == false) {
                enableSwitch.tap()
            }
            else {
                settingsApp.tables.staticTexts[network].tap()
            }
            developerNavButton.tap()
            settingsNavButton.tap()
        })
    }
}
