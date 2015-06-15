//
//  WeatherTextViewController.m
//  WorldWeather
//
//  Created by RoBeRt on 15/6/11.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "WeatherTextViewController.h"
#import "CityWeather.h"

@interface WeatherTextViewController ()

@end

@implementation WeatherTextViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
  if (self.cityWeather) {
    self.cityNameLabel.text = self.cityWeather.name;
    DailyWeather *todaysWeather = self.cityWeather.weather.firstObject;
    WeatherStatus *todaysStatus = todaysWeather.status;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%ldC", (long)todaysStatus.temperature.integerValue];
  }
}

@end
