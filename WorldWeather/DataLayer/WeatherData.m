//
//  WeatherData.m
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "WeatherData.h"
#import "CityWeather.h"

@interface WeatherData ()

@property (strong, nonatomic) NSArray *cities;

@end

@implementation WeatherData

- (instancetype)initWithPListedNamed:(NSString *)plistName {
  if (self = [super init]) {
    self.cities = self 
  }
  return self;
}

@end
