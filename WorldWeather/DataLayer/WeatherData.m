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
    self.cities = [self loadWeatherDataFromPListedNamed:plistName];
  }
  return self;
}

+ (instancetype)loadFromDefaultPList {
  return [[[self class] alloc] initWithPListedNamed:@"WeatherData"];
}

#pragma mark - Private methods
- (NSArray *)loadWeatherDataFromPListedNamed:(NSString *)plistName {
  NSDictionary *imported = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]];
  
  NSMutableArray *cityData =[NSMutableArray array];
  [imported enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSArray *obj, BOOL *stop) {
    [cityData addObject:[self cityWeatherFromArray:obj withName:key]];
  }];
  
  return [cityData copy];
}

- (CityWeather *)cityWeatherFromArray:(NSArray *)array withName:(NSString *)name {
  NSMutableArray *weather = [NSMutableArray array];
  [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
    [weather addObject:[self dailyWeatherFromDictionary:obj]];
  }];
  return [CityWeather weatherForCityNamed:name weather:[weather copy]];
}

- (DailyWeather *)dailyWeatherFromDictionary:(NSDictionary *)dict {
  return [DailyWeather dailyWeatherWithDate:dict[@"date"] status:[self weatherStatusFromDictionary:dict]];
}

- (WeatherStatus *)weatherStatusFromDictionary:(NSDictionary *)dict {
  WeatherStatusType statusType = 0;
  NSString *typeFromDict = dict[@"type"];
  if ([typeFromDict isEqualToString:@"lighting"]) {
    statusType = WeatherStatusTypeLighting;
  } else if ([typeFromDict isEqualToString:@"sun"]) {
    statusType = WeatherStatusTypeSun;
  } else if ([typeFromDict isEqualToString:@"cloud"]) {
    statusType = WeatherStatusTypeCloud;
  }
  
  return [WeatherStatus statusWithTemperature:dict[@"temperature"] type:statusType];
}

@end
