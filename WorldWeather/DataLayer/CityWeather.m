//
//  CityWeather.m
//  WorldWeather
//
//  Created by RoBeRt on 15/6/10.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "CityWeather.h"

@interface CityWeather ()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *weather;

@end

@implementation CityWeather

- (instancetype)initWithCityName:(NSString *)name weather:(NSArray *)weather {
  if (self = [super init]) {
    self.name = name;
    self.weather = weather;
  }
  return self;
}

+ (instancetype)weatherForCityNamed:(NSString *)name weather:(NSArray *)weather {
  return [[[self class] alloc] initWithCityName:name weather:weather];
}

- (UIImage *)cityImage {
  return [UIImage imageNamed:self.name];
}

@end
