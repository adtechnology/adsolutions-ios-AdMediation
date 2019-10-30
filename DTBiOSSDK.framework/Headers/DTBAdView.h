//
//  AmazonBanner.h
//  Serverless
//
//  Created by Krivopaltsev, Eugene on 12/10/18.
//  Copyright © 2018 Krivopaltsev, Eugene. All rights reserved.
//

@import UIKit;
@import WebKit;
#import "DTBMraidUtils.h"

NS_ASSUME_NONNULL_BEGIN
@class DTBAdDispatcher;

@interface DTBAdView : WKWebView

@property (nonatomic, readonly) DTBAdDispatcher *bridge;
@property (nonatomic) NSString *adUnitID;
@property (nonatomic) BOOL isLoading;
@property (nonatomic) BOOL isVisible;
@property (nonatomic) BOOL ignoreExposure;
@property (nonatomic) int  exposurePercent;

#pragma mark - Initializer
- (instancetype)initWithFrame:(CGRect)frame withController:(DTBAdDispatcher *) controller;
- (instancetype)initWithFrame:(CGRect)frame withController:(DTBAdDispatcher *) controller params:(NSDictionary * _Nullable)params;

#pragma mark - Ad loader methods.
- (void)load:(NSString *)url;
- (void)fetchAd:(NSString *)bidInfo;
- (void)evaluateJavaScriptFromString:(NSString *)script;
- (CGRect) positionOnScreen;
- (CGRect) positionInRootView;
- (UIView *) adViewRootView;
- (UIViewController *) adViewRootViewController;
- (void) verifyIsVisible;
- (void) refireExposureChange;


@end

NS_ASSUME_NONNULL_END
