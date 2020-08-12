//
//  AppDelegate.swift
//  adsolutions-ios-AdMediation
//
//  Created by adtech Test on 10.10.18.
//  Copyright © 2018 Spring Media. All rights reserved.
// 

import UIKit
import AppNexusSDK
import DTBiOSSDK
import CriteoPublisherSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //to request appnexus ads via ssl
        //ANSDKSettings.sharedInstance().httpsEnabled = true
        
        //Amazon Appkey nessecary for mediation prebidding, provided by media impact
        DTBAds.sharedInstance().setAppKey("6d292e101d3741e6adfab413ae50d57d")
        //for testing only
        DTBAds.sharedInstance().testMode = true
        
        //to enable appnexus debug logging
        ANLogManager.setANLogLevel(ANLogLevel.all)
        
        //Criteo Setup
        let criteoPublisherId: String = "B-048188" // Provided by criteo

        // Reference to singleton shared instance of Criteo SDK
        let criteoSdk : Criteo = Criteo.shared()

        // Create AdUnit(s) that correspond to the display sizes the app wishes to monetize
        //let bannerAdUnit: CRBannerAdUnit = CRBannerAdUnit.init(adUnitId: "adtechnology.axelspringer.de-app-test-mediation_story-banner", size: CGSize.init(width: 300, height: 250))
        let bannerAdUnit: CRBannerAdUnit = CRBannerAdUnit.init(adUnitId: "30s6zt3ayypfyemwjvmp", size: CGSize.init(width: 300, height: 250))

    
        let adUnits = [bannerAdUnit]

        // Register Criteo SDK
        criteoSdk.registerPublisherId(criteoPublisherId, with: adUnits)
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

