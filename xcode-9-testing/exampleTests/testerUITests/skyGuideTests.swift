//
//  skyGuideTests.swift
//  testerUITests
//
//  Created by Branden Byers on 9/27/17.
//  Copyright © 2017 brandenbyers. All rights reserved.
//

import XCTest

class skyGuideTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func tapPreference(_ pref: String) {
        let app = XCUIApplication(bundleIdentifier: "com.fifthstarlabs.skyguide")
        app.tables.staticTexts[pref].tap()
    }
    
    func tapGalaxy(_ galaxy: String) {
        let app = XCUIApplication(bundleIdentifier: "com.fifthstarlabs.skyguide")
        app.tables.staticTexts[galaxy].tap()
    }
    
    func testSetPreferences() {
        let app = XCUIApplication(bundleIdentifier: "com.fifthstarlabs.skyguide")
        app.activate()
        
        let menuButton = app.buttons["Menu"]
        let exitMenuButton = app.navigationBars["Menu"].children(matching: .button).element
        let preferencesStaticText = app.tables.staticTexts["Preferences"]
        let prefsBackToMenuButton = app.navigationBars["Preferences"].buttons["Menu"]
        let prefs = ["Constellations", "Mythology", "Ecliptic", "Horizon", "Labels", "Satellites", "Music", "Sounds", "Night Vision"]
        
        // Navigate to Menu > Preferences
        menuButton.tap()
        preferencesStaticText.tap()
        
        // Toggle all preferences
        for pref in prefs {
            tapPreference(pref)
        }
        
        // Toggle all preferences back to original state
        for pref in prefs {
            tapPreference(pref)
        }
        
        // Navigate back from Preferences and Menu
        prefsBackToMenuButton.tap()
        exitMenuButton.tap()
    }
    
    func testSetPreferencesWithActivity() {
        XCTContext.runActivity(named: "Toggle All Preferences And Then Return All To Original State", block: { _ in
            let app = XCUIApplication(bundleIdentifier: "com.fifthstarlabs.skyguide")
            app.activate()
        
            let menuButton = app.buttons["Menu"]
            let exitMenuButton = app.navigationBars["Menu"].children(matching: .button).element
            let preferencesStaticText = app.tables.staticTexts["Preferences"]
            let prefsBackToMenuButton = app.navigationBars["Preferences"].buttons["Menu"]
            let prefs = ["Constellations", "Mythology", "Ecliptic", "Horizon", "Labels", "Satellites", "Music", "Sounds", "Night Vision"]
        
            // Navigate to Menu > Preferences
            menuButton.tap()
            preferencesStaticText.tap()
        
            // Toggle all preferences
            for pref in prefs {
                tapPreference(pref)
            }
        
            // Toggle all preferences back to original state
            for pref in prefs {
                tapPreference(pref)
            }
        
            // Navigate back from Preferences and Menu
            prefsBackToMenuButton.tap()
            exitMenuButton.tap()
        })
    }
    
    func testScreenShotExample() {
        let app = XCUIApplication(bundleIdentifier: "com.fifthstarlabs.skyguide")
        let searchButton = app.buttons["Search"]
        let deepSkyStaticText = app.tables.staticTexts["Deep Sky"]
        let galaxiesStaticText = app.tables.staticTexts["Galaxies"]
        let galaxies = ["Triangulum Galaxy", "Bode's Galaxy", "Pinwheel Galaxy", "Messier 110", "Messier 32", "Cigar Galaxy", "Black Eye Galaxy", "Andromeda Galaxy"]
        
        XCTContext.runActivity(named: "Launch Sky Guide App", block: { _ in
            app.activate()
        })
        
        XCTContext.runActivity(named: "Navigate to Search > Deep Sky > Galaxies", block: { _ in
            searchButton.tap()
            deepSkyStaticText.tap()
            galaxiesStaticText.tap()
        })
        
        XCTContext.runActivity(named: "Take Screenshots of the Galaxies", block: { activity in
            for galaxy in galaxies {
                tapGalaxy(galaxy)
                let galaxyScreenshot = XCUIScreen.main.screenshot()
                let galaxyScreenshotAttachment = XCTAttachment(screenshot: galaxyScreenshot)
                galaxyScreenshotAttachment.lifetime = .keepAlways
                activity.add(galaxyScreenshotAttachment)
                searchButton.tap()
            }
        })
    }
}
