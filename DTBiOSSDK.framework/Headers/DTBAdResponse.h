//
//  DTBAdResponse.h
//  DTBiOSSDK
//
//  Created by Singh, Prashant Bhushan on 10/4/15.
//  Copyright © 2015 amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTBAdSize.h"

typedef enum {
    NETWORK_ERROR = 81,
    NETWORK_TIMEOUT,
    NO_FILL,
    INTERNAL_ERROR,
    REQUEST_ERROR
} DTBAdError;

@interface DTBAdResponse : NSObject

@property (nonatomic) NSString * _Nonnull bidId;

@property (nonatomic) BOOL isVideo;

@property NSDictionary * _Nonnull  kvp;


- (void)addDTBPricePoint: (id _Nonnull) pp;

- (NSString * _Nonnull)hostname __deprecated;

- (NSArray * _Nonnull)adSizes;

- (DTBAdSize * _Nonnull)adSize;

- (NSString * _Nonnull)pricePoints:(DTBAdSize * _Nullable)adSize __deprecated;

- (NSString * _Nonnull)defaultPricePoints __deprecated;

- (NSDictionary * _Nullable)customTargetting;

- (NSDictionary * _Nullable)customTargeting;

- (NSString * _Nonnull)keywordsForMopub;

-(NSString * _Nonnull) keywordsForMopubServerless;

@end
