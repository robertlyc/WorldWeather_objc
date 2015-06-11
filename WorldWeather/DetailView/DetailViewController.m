//
//  DetailViewController.m
//  WorldWeather
//
//  Created by RoBeRt on 15/6/11.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self configureView];
  [self provideDataToChildViewControllers];
  self.navigationItem.leftItemsSupplementBackButton = true;
  self.navigationItem.hidesBackButton = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utitlity Methods
- (void)configureView {
  if (self.cityWeather) {
    DailyWeather *todaysWeather = self.cityWeather.weather.firstObject;
    WeatherStatus *todaysStatus = todaysWeather.status;
    self.title = self.cityWeather.name;
    self.weatherIconImageView.image = todaysStatus.statusImage;
  }
}

- (void)provideDataToChildViewControllers {
  for (UIViewController *vc in self.childViewControllers) {
    if ([vc respondsToSelector:@selector(setCityWeather:)]) {
      [((id)vc) setCityWeather:self.cityWeather];
    }
  }
}

@end
