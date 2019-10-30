//
//  DTBAdResponse+Mediation.h
//  Serverless
//
//  Created by Krivopaltsev, Eugene on 12/11/18.
//  Copyright © 2018 Krivopaltsev, Eugene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTBAdResponse.h"
NS_ASSUME_NONNULL_BEGIN

@interface DTBAdResponse(Mediation)

-(NSString * _Nonnull)bidInfo;

-(NSString * _Nonnull)bidInfoInterstitial;

-(NSString * _Nonnull)amznSlots;



-(NSDictionary * _Nonnull)mediationHints:(BOOL)isSmartBanner;

-(NSDictionary * _Nonnull)mediationHints;

@end

NS_ASSUME_NONNULL_END
