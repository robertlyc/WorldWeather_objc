//
//  WeatherStatus.h
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef NS_ENUM(NSUInteger, WeatherStatusType) {
  WeatherStatusTypeSun,
  WeatherStatusTypeCloud,
  WeatherStatusTypeLighting
};

@interface WeatherStatus : NSObject

@property (strong, nonatomic, readonly) NSNumber *temperature;
@property (strong, nonatomic, readonly) UIImage *statusImage;

- (instancetype)initWithTemperature:(NSNumber *)temperature type:(WeatherStatusType)type;
+ (instancetype)statusWithTemperature:(NSNumber *)temperature type:(WeatherStatusType)type;

@end

