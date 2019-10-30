//
//  DTBSlotGroup.h
//  DTBiOSSDK
//
//  Created by Krivopaltsev, Eugene on 6/17/19.
//  Copyright © 2019 amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DTBAdSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface DTBSlotGroup : NSObject

@property(nonatomic) NSString * _Nonnull name;

-(instancetype)initWithName:(NSString * _Nonnull) name;

-(void)addSize:(DTBAdSize * _Nonnull) size;

-(DTBAdSize * _Nullable) sizeByWidth:(NSInteger)width height:(NSInteger)height;

-(DTBAdSize * _Nullable) sizeByWidth:(NSInteger)width height:(NSInteger)height type:(ADType) type;

-(DTBAdSize * _Nullable) sizeByUUID:(NSString * _Nonnull)slotUUID;

@end

NS_ASSUME_NONNULL_END
