//
//  DailyWeather.m
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "DailyWeather.h"

@interface DailyWeather ()

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) WeatherStatus *status;

@end

@implementation DailyWeather

- (instancetype)initWithDate:(NSDate *)date status:(WeatherStatus *)status {
  if (self = [super init]) {
    self.date = date;
    self.status = status;
  }
  return self;
}

+ (instancetype)dailyWeatherWithDate:(NSDate *)date status:(WeatherStatus *)status {
  return [[[self class] alloc] initWithDate:date status:status];
}

#pragma mark - Property overrides
- (NSString *)dayName {
  static NSDateFormatter *dateFormatter = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"E";
  });
  return [dateFormatter stringFromDate:self.date];
}

@end
