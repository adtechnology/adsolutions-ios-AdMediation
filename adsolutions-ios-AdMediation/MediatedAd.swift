//
//  MediatedAd.swift
//  MediationAdnxs
//
//  Created by adtech  on 30.08.18.
//  Copyright © 2018 Spring Media. All rights reserved.
//
import UIKit

import Foundation

import AppNexusSDK


import DTBiOSSDK
import CriteoPublisherSdk

/*
 * MediatedAd
 * adds Amazon prebidding functionality to ANBannerAdView(Appnexus)
 * for amazon additionally an Amazon SlotId has to be provided.
 */
class MediatedAd: ANBannerAdView ,DTBAdCallback {
    
    //var amzn_SlotUUID:String? //= "21bc393b-edef-4f00-9664-5125dd3c52e7"
    //var azloader:DTBAdLoader?
    //var azsize:DTBAdSize?
    //var ArrayList<DTBAdSize>;// azSizes = new ArrayList<DTBAdSize>();
    var amazonSizes = [DTBAdSize]()
    var criteoBannerAdUnit:CRBannerAdUnit?
    
    /*
     * add the sizes amazon prebidding should be done (size + uuid to create a DTBAdSize you get from MI)
    */
    func addAmazonSize(amazonSize:DTBAdSize){
        self.amazonSizes.append(amazonSize)
    }
    
    /*
     add Criteo BannerAdUnit to enable Criteo Prebidding
     */
    func setCriteoBannerAdUnit(criteoBannerAdUnit:CRBannerAdUnit){
        self.criteoBannerAdUnit = criteoBannerAdUnit
    }
    
    /*
     * override loadAd func to ad Amazon Prebidding
     */
    override func loadAd() {
        if(self.criteoBannerAdUnit != nil){
            print("in if criteo")
            // your biddable object
            var criteoBid : NSMutableDictionary = [:]

            // add Criteo bids into biddable object
            Criteo.shared().setBidsForRequest(criteoBid, with: self.criteoBannerAdUnit!)
            self.removeCustomKeyword(withKey: "crt_displayUrl");
            self.removeCustomKeyword(withKey: "crt_cpm");
            self.removeCustomKeyword(withKey: "crt_size");
            print("criteobid?");
            for (key, value) in criteoBid {
                self.addCustomKeyword(withKey: "\(key)", value: "\(value)")
                print("criteo Value: \(value) for key: \(key)")
            }
            //self.addCustomKeyword(withKey: "crt_cpm", value: criteoBid["crt_cpm"]);
            //self.addCustomKeyword(withKey: "crt_displayUrl", value: criteoBid["crt_displayUrl"]);
            //self.addCustomKeyword(withKey: "crt_size", value: criteoBid["crt_size"]);
        }
        
        
        if(!amazonSizes.isEmpty){
            let azloader = DTBAdLoader()
            azloader.setAdSizes(amazonSizes)
            azloader.loadAd(self)
        }
        
        else{
            print("does without amazon")
            super.loadAd()
        }
        
    }
    
    
    func onFailure(_ error: DTBAdError) {
        print("MediatedAdView Amazon Failure \(error)")
        self.removeCustomKeyword(withKey: "amznslots")
        super.loadAd()
    }
    
    /*
     * handles success of Amazon Adrequests
     * attaches amazon keywords to appnexus adcall and triggers it
     */
    func onSuccess(_ adResponse: DTBAdResponse!) {
        print("MediatedAdView")
        self.removeCustomKeyword(withKey: "amznslots")
        guard let response = adResponse else {
            return
        }
        
        response.customTargetting()?.forEach({ (key, value) in
            if let key = key as? String, let value = value as? String {
                self.addCustomKeyword(withKey: key, value: value)
                print(" key: \(key) value \(value)")
            }
        })
        
        super.loadAd()
    }
}


