//
//  ViewController.swift
//  adsolutions-ios-AdMediation
//
//  Created by adtech Test on 10.10.18.
//  Copyright © 2018 Spring Media. All rights reserved.
//

import UIKit
import AppNexusSDK
import DTBiOSSDK

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var adListe: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add reloadbutton here..... todo
        reloadButton.layer.borderColor = UIColor.red.cgColor
        
        
        // Get the screen size so we can center our 300x250 example ad.
        
        let  screenRect  = UIScreen.main.bounds
        
        let  centerX     = (screenRect.size.width / 2) - 150
        //let  centerX     = 0
        let  centerY     = (screenRect.size.height / 2) - 125
        //let  centerY     = 0
        
        
        
        // Set up some sizing variables we'll need when we create our ad view.
        
        let  adWidth = 300
        
        let adHeight = 250
        
        let  rect  = CGRect(x:centerX, y:centerY, width:300, height:250)
        
        //let  size  = CGSize(width:adWidth, height:adHeight)
        
        
        
        // Create the banner ad view and add it as a subview.
        
        let  banner:MediatedAd  = MediatedAd(frame:rect, memberId:7823, inventoryCode:"adtechnology.axelspringer.de-app-test-mediation_index-mrec", adSize:CGSize(width:adWidth, height:adHeight))
        
        banner.addAmazonSize(amazonSize:DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: "21bc393b-edef-4f00-9664-5125dd3c52e7"))
        banner.rootViewController = self;
        
        banner.autoRefreshInterval = 60   // just for testing

        adListe.addSubview(banner)

        // Load an ad!
        
        banner.loadAd()

        // Do any additional setup after loading the view, typically from a nib.
    }

}

