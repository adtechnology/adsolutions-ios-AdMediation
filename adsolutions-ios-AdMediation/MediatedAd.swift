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
/*
 * MediatedAd
 * adds Amazon prebidding functionality to ANBannerAdView(Appnexus)
 * for amazon additionally an Amazon SlotId has to be provided.
 */
class MediatedAd: ANBannerAdView ,DTBAdCallback {
    
    var amzn_SlotUUID:String? //= "21bc393b-edef-4f00-9664-5125dd3c52e7"
    var azloader:DTBAdLoader?
    var azsize:DTBAdSize?
    /*
     * set AmznSlotUUID --> sets amazon slot uuid and ads 300x250 call before appnexus asdcall
     */
    func setAmznSlotUUID(slotUUID:String){
        self.amzn_SlotUUID = slotUUID
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: slotUUID)
        self.azloader = DTBAdLoader()
        self.azloader?.setAdSizes([self.azsize])
    }
    override func loadAd() {
        if var azloader = self.azloader{
            print("does amazon adcall BannerAd.setAmznUUID")
            self.azloader?.loadAd(self)
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


