//
//  MediatedAd.swift
//  MediationAdnxs
//
//  Created by adtech Test on 30.08.18.
//  Copyright © 2018 Spring Media. All rights reserved.
//
import UIKit

import Foundation

import AppNexusSDK

//import GoogleMobileAds

import DTBiOSSDK

class MediatedAd: ANBannerAdView ,DTBAdCallback {
    
    let amzn_SlotUUID:String
    var azloader:DTBAdLoader
    var azsize:DTBAdSize
    //(instancetype)initWithFrame:(CGRect)frame memberId:(NSInteger)memberId inventoryCode:(NSString *)inventoryCode adSize:(CGSize)size;
    
    init(frame:CGRect,memberId:NSInteger, inventoryCode:String, adWidth:NSInteger, adHeight:NSInteger, andSlotUUID:String){
        
        self.amzn_SlotUUID = andSlotUUID
        self.azloader = DTBAdLoader()
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: adWidth, height: adHeight, andSlotUUID: andSlotUUID)
        
        super.init(frame:frame, memberId:memberId, inventoryCode:inventoryCode, adSize:CGSize(width:adWidth, height:adHeight))
        
        self.autoRefreshInterval = 0   // Set to 0 to disable auto-refresh.
        
        print("---MediatedAd.init SlotID "+andSlotUUID)
    }
    
    override func loadAd() {
        print("-----Test1-----")
        self.azloader = DTBAdLoader()
        print("-----Test2-----")
        azloader.setAdSizes([azsize])
        print("-----Test3-----")
        self.azloader.loadAd(self)
        //super.loadAd()
        
        print("-----Test4-----")
        
    }
    func onFailure(_ error: DTBAdError) {
        print("-----onFailure----- \(error)")
        super.loadAd()
    }
    
    
    
    func onSuccess(_ adResponse: DTBAdResponse!) {
        print("-------onSuccess-------")
      
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
    

    
    required init?(coder aDecoder: NSCoder) {
        
        self.amzn_SlotUUID = "false"
        self.azloader = DTBAdLoader()
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        super.init(coder: aDecoder)
        
        //fatalError("init(coder:) has not been implemented")
        
    }
    
    override init(frame: CGRect) {
        
        self.amzn_SlotUUID = "false"
        self.azloader = DTBAdLoader()
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        super.init(frame: frame)
        
    }
    
    override init!(frame: CGRect, placementId: String!) {
        
        self.amzn_SlotUUID = "false"
        self.azloader = DTBAdLoader()
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        super.init(frame: frame, placementId: placementId!)
        
    }
    
    override init!(frame: CGRect, placementId: String!, adSize size: CGSize) {
        
        self.amzn_SlotUUID = "false"
        self.azloader = DTBAdLoader()
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        super.init(frame: frame, placementId: placementId!, adSize:size)
        
    }
    
    override init!(frame: CGRect, memberId: Int, inventoryCode: String!) {
        
        self.amzn_SlotUUID = "false"
        self.azloader = DTBAdLoader()
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        super.init(frame: frame, memberId: memberId, inventoryCode: inventoryCode!)
        
    }
    
    override init!(frame: CGRect, memberId: Int, inventoryCode: String!, adSize size: CGSize) {
        
        self.amzn_SlotUUID = "false"
        self.azloader = DTBAdLoader()
        self.azsize = DTBAdSize.init(bannerAdSizeWithWidth: 300, height: 250, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        super.init(frame: frame, memberId: memberId, inventoryCode: inventoryCode!, adSize:size)
        
    }
}


