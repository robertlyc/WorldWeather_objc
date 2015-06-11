//
//  DailyWeather.h
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherStatus.h"

@interface DailyWeather : NSObject

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) WeatherStatus *status;
@property (nonatomic, strong, readonly) NSString *dayName;

- (instancetype)initWithDate:(NSDate *)date status:(WeatherStatus *)status;
+ (instancetype)dailyWeatherWithDate:(NSDate *)date status:(WeatherStatus *)status;

@end
