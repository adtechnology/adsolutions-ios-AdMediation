//
//  ViewController.swift
//  adsolutions-ios-AdMediation
//
//  Created by adtech Test on 10.10.18.
//  Copyright © 2018 Spring Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        
        label.center = CGPoint(x: 160, y: 85)
        
        label.textAlignment = .center
        
        label.text = "I'am a test label"
        
        self.view.addSubview(label)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get the screen size so we can center our 300x50 example ad.
        
        let  screenRect  = UIScreen.main.bounds
        
        let  centerX     = (screenRect.size.width / 2) - 150
        
        let  centerY     = (screenRect.size.height / 2) - 125
        
        
        
        // Set up some sizing variables we'll need when we create our ad view.
        
        let  adWidth = 300
        
        let adHeight = 250
        
        let  rect  = CGRect(x:centerX, y:centerY, width:300, height:250)
        
        //let  size  = CGSize(width:adWidth, height:adHeight)
        
        
        
        // Create the banner ad view and add it as a subview.
        
        let  banner:MediatedAd?  = MediatedAd(frame:rect, memberId:7823, inventoryCode:"adtechnology.axelspringer.de-app-test-mediation_index-mrec", adWidth:adWidth, adHeight:adHeight, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        
        
//        banner?.addCustomKeyword(withKey: "test", value: "true")
      
        banner?.rootViewController = self;
        
        banner?.autoRefreshInterval = 60   // just for testing
        
        self.view.addSubview(banner!)
        
        // Load an ad!
        
        banner?.loadAd()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

