//
//  WeatherStatus.m
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "WeatherStatus.h"

@interface WeatherStatus ()

@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, assign) WeatherStatusType type;

@end

@implementation WeatherStatus

- (instancetype)initWithTemperature:(NSNumber *)temperature type:(WeatherStatusType)type {
  if (self = [super init]) {
    self.temperature = temperature;
    self.type = type;
  }
  return self;
}

+ (instancetype)statusWithTemperature:(NSNumber *)temperature type:(WeatherStatusType)type {
  return [[[self class] alloc] initWithTemperature:temperature type:type];
}

- (UIImage *)statusImage {
  switch (self.type) {
    case WeatherStatusTypeCloud:
      return [UIImage imageNamed:@"cloud"];
    case WeatherStatusTypeLighting:
      return [UIImage imageNamed:@"lightning"];
    case WeatherStatusTypeSun:
      return [UIImage imageNamed:@"sun"];
  }
}

@end
