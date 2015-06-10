//
//  CityWeather.h
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "DailyWeather.h"

@interface CityWeather : NSObject

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) UIImage *cityImage;
@property (strong, nonatomic, readonly) NSArray *weather;

- (instancetype)initWithCityName:(NSString *)name weather:(NSArray *)weather;
+ (instancetype)weatherForCityNamed:(NSString *)name weather:(NSArray *)weather;

@end
