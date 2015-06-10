//
//  WeatherData.h
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (strong, nonatomic, readonly) NSArray *cities;

- (instancetype)initWithPListedNamed:(NSString *)plistName;
+ (instancetype)loadFromDefaultPList;

@end
