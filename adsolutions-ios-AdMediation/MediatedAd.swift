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

//import DTBiOSSDK


class MediatedAd: ANBannerAdView /*,DTBAdCallback*/ {
    
    let amzn_SlotUUID:String
    
    //(instancetype)initWithFrame:(CGRect)frame memberId:(NSInteger)memberId inventoryCode:(NSString *)inventoryCode adSize:(CGSize)size;
    
    init(frame:CGRect,memberId:NSInteger, inventoryCode:String, adWidth:NSInteger, adHeight:NSInteger, andSlotUUID:String){
        
        self.amzn_SlotUUID = andSlotUUID
        
        super.init(frame:frame, memberId:memberId, inventoryCode:inventoryCode, adSize:CGSize(width:adWidth, height:adHeight))
        
        self.autoRefreshInterval = 0   // Set to 0 to disable auto-refresh.
        
        print("---MediatedAd.init SlotID "+andSlotUUID)
        /*
        let azsize = DTBAdSize.init(bannerAdSizeWithWidth: adWidth, height: adHeight, andSlotUUID: "63c4c4c6-1e0b-4666-b8cd-7994163e0552")
        
        let azloader:DTBAdLoader = DTBAdLoader()
        
        azloader.setAdSizes([azsize,nil])
        */
        
        
    }
    
    
    
    
    
    override func loadAd() {
        
        super.loadAd()
        
        print("-----Test-----")
        
    }
    /*
    func onFailure(_ error: DTBAdError) {
        
        
        
    }
    
    
    
    func onSuccess(_ adResponse: DTBAdResponse!) {
        
        
        
    }
    */
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        self.amzn_SlotUUID = "false"
        
        super.init(coder: aDecoder)
        
        //fatalError("init(coder:) has not been implemented")
        
    }
    
    override init(frame: CGRect) {
        
        self.amzn_SlotUUID = "false"
        
        super.init(frame: frame)
        
    }
    
    override init!(frame: CGRect, placementId: String!) {
        
        self.amzn_SlotUUID = "false"
        
        super.init(frame: frame, placementId: placementId!)
        
    }
    
    override init!(frame: CGRect, placementId: String!, adSize size: CGSize) {
        
        self.amzn_SlotUUID = "false"
        
        super.init(frame: frame, placementId: placementId!, adSize:size)
        
    }
    
    override init!(frame: CGRect, memberId: Int, inventoryCode: String!) {
        
        self.amzn_SlotUUID = "false"
        
        super.init(frame: frame, memberId: memberId, inventoryCode: inventoryCode!)
        
    }
    
    override init!(frame: CGRect, memberId: Int, inventoryCode: String!, adSize size: CGSize) {
        
        self.amzn_SlotUUID = "false"
        
        super.init(frame: frame, memberId: memberId, inventoryCode: inventoryCode!, adSize:size)
        
    }
    
    
    
    
    
}


